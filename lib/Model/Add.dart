import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

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
                  InkWell(
                      child: Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 59, 59, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(199, 199, 199, 1),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        ref.add({
                          'title': title.text,
                          'content': content.text
                        }).whenComplete(() => Navigator.pop(context));
                      }),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: title,
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(199, 199, 199, 1),
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(199, 199, 199, 1),
                      )),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: content,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(199, 199, 199, 1),
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type Something ...',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(199, 199, 199, 1),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
