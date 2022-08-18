import 'package:flutter/material.dart';
import 'package:potrtfolio/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Software Engineer ",
          subTitle:
              "Bachelor's Degree in Software Engineering \nat in Salahaddin University",
          duration: "2017 - 2021",
        ),
        WorkCustomData(
          title: "UI/UX Designer ",
          subTitle:
              "recently Worked as a UI/UX Designer \nat at Lezzoo eats , full-time office",
          duration: "2022",
        ),
        WorkCustomData(
          title: "UI/UX Designer ",
          subTitle:
              "Worked as a UI/UX Designer \nat at Lucid Source , full-time office",
          duration: "2021 - 2022",
        ),
        WorkCustomData(
          title: "web Development Bootcamp",
          subTitle:
              "Complete web Development Bootcamp at Recoded Training Center",
          duration: "Dec - 2018 to sep - 2018",
        ),
        WorkCustomData(
          title: "Freelancer - Graphic Designer ",
          subTitle:
              "Graphic Designer and experienced programmer with an extensive history of designing and coding . ",
          duration: "sep - 2020 to apr - 2021",
        ),
        // WorkCustomData(
        //   title: "Mentor at Contributor's Hack, 2020",
        //   subTitle:
        //       "Working as a mentor in HakinCode organization for Flutter CodeAsylums application \n where I can utilize my skills and be an asset to the organization",
        //   duration: "Sep 2020 - Oct 2020",
        // ),
        // WorkCustomData(
        //   title: "Flutter Intern at Mind Sports League | Gurgaon In",
        //   subTitle:
        //       "Building world class Poker Learning platform. Poker Sports League is India’s first poker league is to sportify the game of poker through a unique, team based format",
        //   duration: "Nov - 2020 Present",
        // ),
      ],
    );
  }
}
