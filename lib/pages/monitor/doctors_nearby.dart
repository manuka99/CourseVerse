import 'package:course_app/Widgets/doctor.box.dart';
import 'package:course_app/common/app.constraints.dart';
import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/models/doctor.dart';
import 'package:course_app/services/nearby_doctor_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorsNearby extends StatefulWidget {

  @override
  _DoctorsNearbyState createState() => _DoctorsNearbyState();
}

class _DoctorsNearbyState extends State<DoctorsNearby> {
  late Iterable<Doctor> doctors = [];

  @override
  void initState() {
    loadDoctors();
  }

  loadDoctors() async {
    doctors = await NearByDoctorsService.getDoctors();
    print(doctors.length);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Doctors nearby you",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: CustomColors.blackLight3TextColor,
                    fontSize: 14),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: CustomColors.iconSelected,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 174,
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctors.length,
              itemBuilder: (context, index) =>
                  DoctorBox(doctor: doctors.elementAt(index))),
        ),
      ],
    );
  }
}