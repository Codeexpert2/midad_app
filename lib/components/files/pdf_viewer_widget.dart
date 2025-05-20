import 'dart:io';
import 'package:flutter/material.dart';
import 'package:midad/core/log/app_log.dart';
import 'package:midad/core/utils/snackbars.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatelessWidget {
  const PdfViewerWidget({super.key, required this.pdfFile});

  final File pdfFile;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(
      pdfFile,
      canShowScrollHead: false,
      canShowScrollStatus: false,
      enableDoubleTapZooming: true,
      enableTextSelection: true,
      pageSpacing: 0,
      onDocumentLoadFailed: (details) {
        AppLog.error('PDF load failed: ${details.error}');
        showErrorSnackbar('pdfLoadFailed');
      },
    );
  }
}
