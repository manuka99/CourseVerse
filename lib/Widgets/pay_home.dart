import 'dart:convert';
import 'package:course_app/common/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';
import 'package:http/http.dart' as http;

class StripePayment extends StatefulWidget {
  const StripePayment({Key? key}) : super(key: key);

  @override
  _StripePaymentState createState() => _StripePaymentState();
}

class _StripePaymentState extends State<StripePayment> {
  final String postCreateIntentURL =
      "https://api.stripe.com/v1/payment_methods";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final StripeCard card = StripeCard();

  Stripe stripe = Stripe(
    'pk_test_51KfqVnB32MK4W6iDNeUGfW19fJfk9CJlJiDQomtCNsiCK8KDVybPyyLqhKqHBUO70jrG1pzQFXaWdMLhV6PKGXHE00umfgiErO',
    stripeAccount: "acct_1KfqVnB32MK4W6iD",
    // returnUrlForSca: "http://example.com",
  );

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('You clicked on'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('This is a Dialog Box. Click OK to Close.'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.dBlue,
        title: const Text("Pay for Course"),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: Column(
              children: [
                CardForm(formKey: formKey, card: card),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    color: CustomColors.dBlue,
                    textColor: Colors.white,
                    child: const Text('Pay for Course',
                        style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      formKey.currentState!.validate();
                      formKey.currentState!.save();
                      buy(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void buy(context) async {
    final StripeCard stripeCard = card;
    final String customerEmail = getCustomerEmail();

    if (!stripeCard.validateCVC()) {
      showAlertDialog(context, "Error", "CVC not valid.");
      return;
    }
    if (!stripeCard.validateDate()) {
      showAlertDialog(context, "Error", "Date not valid.");
      return;
    }
    if (!stripeCard.validateNumber()) {
      showAlertDialog(context, "Error", "Number not valid.");
      return;
    }

    Map<String, dynamic> paymentIntentRes =
        await createPaymentIntent(stripeCard, customerEmail);
    String clientSecret = paymentIntentRes[
        'sk_test_51KfqVnB32MK4W6iDHhWtTu6Cy8Hy4fVncZpsflKRc5P1uuqjSOEDg590HGMI0HgMPtovVYI8RVwW3cndLD3WW4k900GVLHl7Dz'];
    String paymentMethodId = paymentIntentRes['card'];
    String status = paymentIntentRes['status'];

    if (status == 'requires_action') {
      paymentIntentRes =
          await confirmPayment3DSecure(clientSecret, paymentMethodId);
    }

    if (paymentIntentRes['status'] != 'succeeded') {
      showAlertDialog(context, "Warning", "Canceled Transaction.");
      return;
    }

    if (paymentIntentRes['status'] == 'succeeded') {
      showAlertDialog(context, "Success", "Thanks for Choosing us!");
      return;
    }
    showAlertDialog(
        context, "Warning", "Transaction rejected.Something went wrong");
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      StripeCard stripeCard, String customerEmail) async {
    String clientSecret;
    Map<String, dynamic> paymentIntentRes, paymentMethod;

    paymentMethod = await stripe.api.createPaymentMethodFromCard(stripeCard);
    clientSecret =
        await postCreatePaymentIntent(customerEmail, paymentMethod['id']);
    paymentIntentRes = await stripe.api.retrievePaymentIntent(clientSecret);

    return paymentIntentRes;
  }

  Future<String> postCreatePaymentIntent(
      String email, String paymentMethodId) async {
    String clientSecret;
    http.Response response = await http.post(
      Uri(),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'payment_method_id': paymentMethodId,
      }),
    );
    clientSecret = json.encode(response.body);
    return clientSecret;
  }

  Future<Map<String, dynamic>> confirmPayment3DSecure(
      String clientSecret, String paymentMethodId) async {
    Map<String, dynamic> paymentIntentRes_3dSecure;

    await stripe.confirmPayment(clientSecret, context,
        paymentMethodId: paymentMethodId);
    paymentIntentRes_3dSecure =
        await stripe.api.retrievePaymentIntent(clientSecret);

    return paymentIntentRes_3dSecure;
  }

  String getCustomerEmail() {
    String customerEmail;
    customerEmail = "12@gmail.com";
    return customerEmail;
  }

  showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
