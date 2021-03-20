import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Notealot/Services/Authentication.dart';
import 'package:Notealot/pages/landing.dart';
import 'Developer.dart';

class Settings extends StatelessWidget {
  final Authenticator _authenticator = Authenticator();
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(37, 37, 37, 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(59, 59, 59, 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 30,
                            color: Color.fromRGBO(212, 212, 212, 1),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(199, 199, 199, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 14,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(199, 232, 110, 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Developer',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(42, 42, 42, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(_createRoute());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Made with \n Flutter',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(42, 42, 42, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Image.asset(
                                  'assets/images/f.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 14,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 113, 110, 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Logout',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(42, 42, 42, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
                        await _authenticator.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Landing()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Developer(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
