import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class ShowPDF extends StatefulWidget {
  // String? fileName;
  // String? userID;
  // String? subjectID;

  // ShowPDF({required this.subjectID,
  //   required this.userID,
  //   required this.fileName});

  @override
  State<ShowPDF> createState() => _ShowPDFState();
}

class _ShowPDFState extends State<ShowPDF> {

  // String? fileName;
  // String? userID;
  // String? subjectID;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              child:SfPdfViewer.network('https://www.orimi.com/pdf-test.pdf'))),
    );
  }
}
