import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Editnote extends StatefulWidget {
  DocumentSnapshot doctoEdit;

  Editnote({this.doctoEdit});

  @override
  _EditnoteState createState() => _EditnoteState();
}

class _EditnoteState extends State<Editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.doctoEdit.data()['title']);
    content = TextEditingController(text: widget.doctoEdit.data()['content']);
    super.initState();
  }

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
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                      ),
                    ),
                    onTap: () {
                      widget.doctoEdit.reference.update({
                        'title': title.text,
                        'content': content.text
                      }).whenComplete(() => Navigator.pop(context));
                    },
                  ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: InkWell(
                child: Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(59, 59, 59, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Delete",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(199, 199, 199, 1),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  widget.doctoEdit.reference
                      .delete()
                      .whenComplete(() => Navigator.pop(context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
