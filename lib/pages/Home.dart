import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Notealot/Model/Notes.dart';
import 'package:Notealot/pages/Settings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Text(
                      "Hey Shanwill !",
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(210, 210, 210, 1),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(199, 232, 110, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.trip_origin,
                          size: 40,
                          color: Color.fromRGBO(27, 27, 27, 1),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(_createRoute());
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.2,
                child: Notes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Settings(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
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
