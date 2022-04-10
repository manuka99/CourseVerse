import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/services/database.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  Add({Key? key, required this.db}) : super(key: key);
  Database db;
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController subjectController1 = TextEditingController();
  TextEditingController subjectController2 = TextEditingController();
  TextEditingController amountController1 = TextEditingController();
  TextEditingController hoursController1 = TextEditingController();
  TextEditingController amountController2 = TextEditingController();
  TextEditingController hoursController2 = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.dBlue,
        title: const Text("Add Tutor"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Tutor Name"),
                controller: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Qualifications"),
                controller: qualificationController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Education"),
                controller: educationController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Expertise Subject 1"),
                controller: subjectController1,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Amount for Expertise Subject 1"),
                controller: amountController1,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration:
                    inputDecoration("Duration fot Expertiese Subject 1"),
                controller: hoursController1,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Expertise Subject 2"),
                controller: subjectController2,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration("Amount for Expertise Subject 2"),
                controller: amountController2,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration:
                    inputDecoration("Duration fot Expertiese Subject 2"),
                controller: hoursController2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: CustomColors.dBlue,
              onPressed: () {
                widget.db.create(
                    nameController.text,
                    qualificationController.text,
                    educationController.text,
                    subjectController1.text,
                    subjectController2.text,
                    amountController1.text,
                    amountController2.text,
                    hoursController1.text,
                    hoursController2.text);
                Navigator.pop(context, true);
              },
              child: const Text(
                "Save Details",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: CustomColors.dBlue,
      labelStyle: const TextStyle(color: Color.fromARGB(255, 78, 77, 77)),
      labelText: labelText,
      fillColor: Color.fromARGB(255, 78, 77, 77),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: CustomColors.dBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
    );
  }
}
