import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/utils/url.dart';

class PDFViewerPage extends StatelessWidget {
  const PDFViewerPage({
    super.key,
    required this.pdfPath,
  });

  final String pdfPath;

  static const String _baseUrl = 'https://yourdomain.com/';

  @override
  Widget build(BuildContext context) {
    final String fullUrl = normalizeUrl(pdfPath, _baseUrl);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).pdfViewer)),
      body: SfPdfViewer.network(fullUrl),
    );
  }
}
