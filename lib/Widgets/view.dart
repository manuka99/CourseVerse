import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/services/database.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  View({Key? key, required this.Tutors, required this.db}) : super(key: key);
  Map Tutors;
  Database db;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController qualificationController = new TextEditingController();
  TextEditingController educationController = new TextEditingController();
  TextEditingController subjectController1 = new TextEditingController();
  TextEditingController subjectController2 = new TextEditingController();
  TextEditingController amountController1 = new TextEditingController();
  TextEditingController hoursController1 = new TextEditingController();
  TextEditingController amountController2 = new TextEditingController();
  TextEditingController hoursController2 = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.Tutors);
    nameController.text = widget.Tutors['name'];
    qualificationController.text = widget.Tutors['qualification'];
    educationController.text = widget.Tutors['education'];
    subjectController1.text = widget.Tutors['sub1'];
    subjectController2.text = widget.Tutors['sub2'];
    amountController1.text = widget.Tutors['amount1'];
    hoursController1.text = widget.Tutors['hours1'];
    amountController2.text = widget.Tutors['amount2'];
    hoursController2.text = widget.Tutors['hours2'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.dBlue,
        title: const Text("View Tutor"),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.db.delete(widget.Tutors["id"]);
                Navigator.pop(context, true);
              })
        ],
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
              color: CustomColors.dBlue,
              onPressed: () {
                widget.db.update(
                    widget.Tutors['id'],
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
      labelStyle: const TextStyle(color: Colors.black),
      labelText: labelText,
      fillColor: Colors.black,
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
