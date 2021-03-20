import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatelessWidget {
  const Developer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "About Me",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(199, 199, 199, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage('assets/images/sh.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Shanwill Pinto',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(199, 199, 199, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'I\'m a developer with a keen interest in Data Science and Flutter.',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(199, 199, 199, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
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
                              'Github',
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
                      _launchURL();
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(110, 195, 232, 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Linkedin',
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
                      _launchURL();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/data-charya';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

_launchURL() async {
  const url = 'https://github.com/data-charya';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
