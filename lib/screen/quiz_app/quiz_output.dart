import 'package:flutter/material.dart';

import '../../home.dart';

class OutputResult extends StatelessWidget {
  final int resultScore;
  final void Function() HandleReset;

  OutputResult(this.resultScore, this.HandleReset);

//Marks allocation
  String get final_result {
    String final_result;
    if (resultScore == 5) {
      final_result = 'Excellent!';
      print(resultScore);
    } else if (resultScore == 4) {
      final_result = 'Good!';
      print(resultScore);
    } else if (resultScore == 3) {
      final_result = 'You need to work more!';
    } else if (resultScore == 2) {
      final_result = 'Need More Improvement!';
    } else {
      final_result = 'Poor!';
      print(resultScore);
    }
    return final_result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                final_result,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Score ' '$resultScore',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                child: Text(
                  'Go Back To Quiz!',
                  style: TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                textColor: Color.fromARGB(255, 94, 21, 107),
                onPressed: HandleReset,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.home,
                ),
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side:
                        BorderSide(color: Color.fromARGB(255, 189, 158, 230))),
                label: Text("Home"),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.all(15.0),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Home(title: 'Home');
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
