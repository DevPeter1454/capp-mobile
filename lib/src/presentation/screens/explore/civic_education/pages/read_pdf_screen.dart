// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:capp/src/data_source/network/shared_preference_service.dart';


class ReadPdfScreen extends StatefulWidget {

  final String pdfUrl;
  const ReadPdfScreen({
    Key? key,
    required this.pdfUrl,
   
  }) : super(key: key);

  @override
  State<ReadPdfScreen> createState() => _ReadPdfScreenState();
}

class _ReadPdfScreenState extends State<ReadPdfScreen> {
  // PdfViewerController pdfViewerController = PdfViewerController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        
        // controller: pdfViewerController,
      )),
    );
  }
}
