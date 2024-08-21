// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


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
        // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        widget.pdfUrl,
        onDocumentLoaded: (details) {
          print('Document loaded');
        },
        onDocumentLoadFailed: (reason) {
          print('Failed to load the document: $reason');
        },

        // controller: pdfViewerController,
      )),
    );
  }
}
