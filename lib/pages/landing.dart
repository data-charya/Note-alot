import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Notealot/Services/Authentication.dart';
import 'package:Notealot/pages/Home.dart';

Authenticator authenticator = new Authenticator();

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(37, 37, 37, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Note-alot',
                style: GoogleFonts.montserrat(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(199, 199, 199, 1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.3,
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
                        Container(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            'assets/images/g.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Sign in with google',
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
                  await authenticator.googleSignIn();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
