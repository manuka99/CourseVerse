import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/pages/account/section2_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSection2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: CustomColors.shadowColor,
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 4,
          )
        ],
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: sectionButtons.length,
          itemBuilder: (context, index) => sectionButtons[index]),
    );
  }
}

List<ProfileSection2BTN> sectionButtons = [
  ProfileSection2BTN(
      title: "My Courses",
      icon: Icons.earbuds,
      route: "/auth/my-doctors"),
  ProfileSection2BTN(
      title: "Lectures",
      icon: Icons.calendar_today_outlined,
      route: "/auth/appointments"),
  ProfileSection2BTN(
      title: "Online discussions",
      icon: Icons.people_alt_outlined,
      route: "/auth/consultation"),
  ProfileSection2BTN(
      title: "Tutorials and Resources",
      icon: Icons.receipt_long_outlined,
      route: "/auth/mrecords"),
  ProfileSection2BTN(
      title: "Reminders",
      icon: Icons.watch_later_outlined,
      route: "/auth/reminders"),
  ProfileSection2BTN(
      title: "Specialization interest",
      icon: Icons.health_and_safety,
      route: "/auth/health"),
  ProfileSection2BTN(
      title: "My payments",
      icon: Icons.credit_card,
      route: "/auth/payments"),
  ProfileSection2BTN(
      title: "Offers",
      icon: Icons.local_offer,
      route: "/auth/offers"),
];
