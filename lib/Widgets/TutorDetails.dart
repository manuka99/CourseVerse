import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class TutorDetailsView extends StatefulWidget {
  TutorDetailsView({Key? key, required this.Tutors, required this.db})
      : super(key: key);
  Map Tutors;
  Database db;
  @override
  _TutorDetailsViewState createState() => _TutorDetailsViewState();
}

enum SingingCharacter { sub1, sub2 }

class _TutorDetailsViewState extends State<TutorDetailsView> {
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

  SingingCharacter? _character = SingingCharacter.sub1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.dBlue,
        title: const Text("View Tutor"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(70), // Image radius
                      child: Image.asset("assets/images/img1.jpg",
                          width: 100, height: 100),
                    ),
                  ),
                  Column(
                    children: [
                      Row(children: [
                        const SizedBox(
                          height: 20,
                          width: 10,
                        ),
                        Text(
                          widget.Tutors['name'],
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman"),
                        ),
                      ]),
                      Row(
                        children: [
                          const SizedBox(
                            height: 20,
                            width: 50,
                          ),
                          const Icon(
                            Icons.circle_rounded,
                            color: Colors.grey,
                            size: 8,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.Tutors['sub1'],
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20,
                            width: 10,
                          ),
                          const Icon(
                            Icons.circle_rounded,
                            color: Colors.grey,
                            size: 8,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.Tutors['sub2'],
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 40,
                          ),
                          Icon(Icons.star_rounded,
                              color: Color.fromARGB(255, 248, 241, 35)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star_rounded,
                              color: Color.fromARGB(255, 248, 241, 35)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star_rounded,
                              color: Color.fromARGB(255, 248, 241, 35)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star_rounded,
                              color: Color.fromARGB(255, 248, 241, 35)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star_half_rounded,
                              color: Color.fromARGB(255, 248, 241, 35)),
                        ],
                      ),
                    ],
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.starGreen,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Years of Experience : ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.Tutors['qualification'],
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.starGreen,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "University : ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.Tutors['education'],
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      "Choose Course",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text(widget.Tutors['sub1']),
                      subtitle: Text(widget.Tutors['hours1']),
                      trailing: Text(widget.Tutors['amount1']),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.sub1,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(widget.Tutors['sub2']),
                      subtitle: Text(widget.Tutors['hours2']),
                      trailing: Text(widget.Tutors['amount2']),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.sub2,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(
                      Icons.notifications,
                      color: Colors.red,
                    ),
                    const Text("Pay for course and allocate Session",
                        style: TextStyle(
                            fontSize: 10, fontStyle: FontStyle.italic)),
                  ],
                )
              ],
            )),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
            color: CustomColors.dBlue,
            onPressed: () => {Navigator.pushNamed(context, '/pay')},
            child: const Text(
              'Pay for Course',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Success',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
