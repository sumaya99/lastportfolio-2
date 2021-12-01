import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:potrtfolio/Model/Method.dart';
import 'package:potrtfolio/UI/About.dart';
import 'package:potrtfolio/UI/FeatureProject.dart';
import 'package:potrtfolio/UI/Work.dart';
import 'package:potrtfolio/Widget/AppBarTitle.dart';
import 'package:potrtfolio/Widget/CustomText.dart';
import 'package:potrtfolio/Widget/MainTiitle.dart';
//import 'package:potrtfolio/Widget/OSImages.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      // IconButton(
                      //     icon: Icon(
                      //       Icons.change_history,
                      //       size: 32.0,
                      //       color: Color(0xff64FFDA),
                      //     ),
                      //     onPressed: () {}),
                      Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Us',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              //hoverColor: Color(0xFF3E0449),
                              onPressed: () {
                                method.launchURL(
                                    "https://www.behance.net/suvishahoyi");
                              },
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                hoverColor: Color(0xFF3E0449),
                                onPressed: () {
                                  method.launchURL(
                                      "https://drive.google.com/file/d/1QYDrKRPMsHinpIJ8YxyLpAnnaAo9c5AG/view?usp=sharing");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    "Resume",
                                    style: TextStyle(
                                      color: Color(0xff64FFDA),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method
                                  .launchURL("https://instagram.com/savah.des");
                            }),
                            IconButton(
                            icon: FaIcon(FontAwesomeIcons.medium),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method
                                  .launchURL("https://medium.com/@suvi.shahoyi");
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.behance),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://www.behance.net/suvishahoyi");
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.swatchbook),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://www.shutterstock.com/g/suvvi");
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://github.com/sumaya99");
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.twitter),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://twitter.com/suuuvi99");
                            }),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method
                                .launchURL("https://www.linkedin.com/in/suvi/");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: Icon(Icons.call),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchCaller();
                            }),
                        IconButton(
                            icon: Icon(Icons.mail),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * .06,
                                  ),
                                  CustomText(
                                    text: "Hi, my name is",
                                    textsize: 16.0,
                                    color: Color(0xff41FBDA),
                                    letterSpacing: 3.0,
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  CustomText(
                                    text: "Sumaya Mohammed.",
                                    textsize: 68.0,
                                    color: Color(0xffCCD6F6),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  CustomText(
                                    text:
                                        "UI/UX Designer , I design and build things for Mobile App.",
                                    textsize: 56.0,
                                    color: Color(0xffCCD6F6).withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: size.height * .04,
                                  ),
                                  Wrap(
                                    children: [
                                      Text(
                                        "I'm a freelancer based in Erbil,Iraq specializing in \nbuilding (and occasionally designing) , \napplications, and everything in between.",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          letterSpacing: 2.75,
                                          wordSpacing: 0.75,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * .12,
                                  ),

                                  //get in tuch text
                                  InkWell(
                                    onTap: () {
                                      method.launchEmail();
                                    },
                                    hoverColor:
                                        Color(0xff64FFDA).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.09,
                                      width: size.width * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xff64FFDA),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        "Get In Touch",
                                        style: TextStyle(
                                          color: Color(0xff64FFDA),
                                          letterSpacing: 2.75,
                                          wordSpacing: 1.0,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: size.height * 0.20,
                                  ),
                                ],
                              ),

                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      FeatureProject(
                                        urlxd: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/e343a736-6865-408e-867c-2ec826a53dc6-b610/");
                                        },
                                        imagePath: "images/1.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/e343a736-6865-408e-867c-2ec826a53dc6-b610/");
                                        },
                                        projectDesc:
                                            "A Mobile app UI/UX Design for both Android and IOS. it's about finding Jobs/hiring employee the user can apply for job search for a job and view the company profile , also a job provider can see job seeker profile , with notification and saved feature. This project was for University research to Learn designing UI/UX and Flutter complex UI Design.",
                                        projectTitle:
                                            "Dozar App for finding job/hiring employee",
                                        tech1: "Adobe XD",
                                        tech2: "Flutter",
                                        tech3: "Dart",
                                      ),

                                      FeatureProject(
                                        urlxd: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/2403ebd0-d038-44d5-8df5-e2034dc426fb-7150/");
                                        },
                                        imagePath: "images/2.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/2403ebd0-d038-44d5-8df5-e2034dc426fb-7150/");
                                        },
                                        projectDesc:
                                            "A TODO application using Adobe XD to design and Flutter and mysql, User can track their daily todos and use a timer to tick them off.",
                                        projectTitle: "Todo Application",
                                        tech1: "Dart , flutter",
                                        tech2: "Adobe XD",
                                        tech3: "MYSQL",
                                      ),

                                      FeatureProject(
                                        urlxd: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/2403ebd0-d038-44d5-8df5-e2034dc426fb-7150/");
                                        },
                                        imagePath: "images/3.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://www.behance.net/suvishahoyi");
                                        },
                                        projectDesc:
                                            "A mob application designed in Adobe XD Using movies API, to show more than 5k+ movies trailer and their details . User can Search any movies.",
                                        projectTitle: "Movies",
                                        tech1: "Adobe XD",
                                        tech2: "Dart , Flutter",
                                        tech3: "API",
                                      ),

                                      FeatureProject(
                                        urlxd: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/d07d0ed9-ec60-4978-82af-027f2f6ade5f-852e/");
                                        },
                                        imagePath: "images/4.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/d07d0ed9-ec60-4978-82af-027f2f6ade5f-852e/");
                                        },
                                        projectDesc:
                                            "A Weather App Ui Design Concept to change the view accourding to the time",
                                        projectTitle: "Weather App",
                                        tech1: "Adobe XD",
                                      ),
                                      //ff
                                      FeatureProject(
                                        urlxd: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/d283229a-b6b6-4109-a125-1b5f3d7f6189-87d0/");
                                        },
                                        imagePath: "images/5.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/d283229a-b6b6-4109-a125-1b5f3d7f6189-87d0/");
                                        },
                                        projectDesc:
                                            "The landing page is just a simple static web page which will allow the user to learn more about the system. ",
                                        projectTitle: "Web Landing Page",
                                        tech1: "Adobe XD",
                                      ),

                                      FeatureProject(
                                        urlxd: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                        },
                                        imagePath: "images/6.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                        },
                                        projectDesc:
                                            "A responsive web Design Portfolio for myself",
                                        projectTitle: "Responsive Portfolio",
                                        tech1: "Adobe XD",
                                        tech2: "Flutter",
                                        tech3: "Dart",
                                      ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic7.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "Flutter Wallpaper application using firebase as a backend with a cool animation, it show the all images that are store in firebase firestore.",
                                      //   projectTitle: "Wallpaper App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Firebase",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic8.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "Weather app. This weather app is one of best free weather apps with full features: Local weather, weather map (weather map service) and weather widgets. Widgets for Android: The weather radar widget free and clock widget weather with beautiful style.",
                                      //   projectTitle: "Weather Application",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic10.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A flutter package which help developer in creating a onboarding screens of their app.",
                                      //   projectTitle:
                                      //       "Flutter Onboarding Screen Package",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Dart Package",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic11.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "To explore the flutter Neumorphic design",
                                      //   projectTitle: "Neumorphic Design",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // MainTiitle(
                                      //   number: "0.4",
                                      //   text: "Open Source Project",
                                      // ),

                                      // SizedBox(
                                      //   height: size.height * 0.04,
                                      // ),

                                      // //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic101.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic103.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic111.gif",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic113.jfif",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Payment Getway",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Chat App",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Spotify Clone",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "TODO App",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic114.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic115.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic116.jfif",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic117.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Spannish Audio",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Drumpad",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic118.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic119.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic120.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic121.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Prime Videos UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Tic Tac Toe Game",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Love Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic102.gif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "SolMusic",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Web",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic104.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign Up and Sign In",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic105.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign up and Sign in",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic106.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Online Flowers Shop",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic107.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Food delivery App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic108.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Plant Nursery App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic109.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Foody",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic110.jfif",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Online Food order",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic501.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Ganpati Bappa",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter Animation",
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic506.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://xd.adobe.com/view/704bffcf-afce-4ee2-af1f-97c6ecd0f0bd-2518/");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Flutter Netflix Web",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter Wen",
                                      //   tech3: "Flutter UI",
                                      // ),
                                    ],
                                  )),

                              SizedBox(
                                height: 6.0,
                              ),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            text: "0.4 What's Next?",
                                            textsize: 16.0,
                                            color: Color(0xff41FBDA),
                                            letterSpacing: 3.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          CustomText(
                                            text: "Get In Touch",
                                            textsize: 42.0,
                                            color: Colors.white,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "Although I'm currently looking for SDE-1 opportunities, my inbox is \nalways open. Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  letterSpacing: 0.75,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 32.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              method.launchEmail();
                                            },
                                            child: Card(
                                              elevation: 4.0,
                                              color: Color(0xff64FFDA),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.all(0.85),
                                                height: size.height * 0.09,
                                                width: size.width * 0.10,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff0A192F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                                  child: Text(
                                                    "Say Hello",
                                                    style: TextStyle(
                                                      color: Color(0xff64FFDA),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Footer
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      //color: Colors.white,
                                      child: Text(
                                        "Designed & Built by Suvi Shahoyi 💙 Flutter",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          letterSpacing: 1.75,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "sumaya.shahoyi@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
