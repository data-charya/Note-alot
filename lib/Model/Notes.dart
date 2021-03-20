import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Notealot/Model/Add.dart';

import 'Edit.dart';

class Notes extends StatelessWidget {
  final refer = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(27, 27, 27, 1),
          child: Icon(
            Icons.add_rounded,
            size: 50,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        body: StreamBuilder(
            stream: refer.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Editnote(
                            doctoEdit: snapshot.data.docs[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 204, 128, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                snapshot.data.docs[index].data()['title'],
                                style: GoogleFonts.montserrat(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(36, 39, 33, 1),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                snapshot.data.docs[index].data()['content'],
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(66, 69, 63, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 11,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 140,
                                  ),
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(36, 39, 33, 1),
                                      borderRadius: BorderRadius.circular(
                                        50,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Addnote(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 5);
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
