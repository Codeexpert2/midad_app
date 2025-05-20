import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import 'package:midad/components/files/pdf_viewer_widget.dart';
import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/configs/app_configs.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/log/app_log.dart';
import 'package:midad/core/utils/url.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({
    super.key,
    required this.pdfUrl,
  });

  final String pdfUrl;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  bool isLoading = true;
  String? errorMessage;

  File? pdfFile;

  @override
  void initState() {
    super.initState();
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
      final String fullUrl = normalizeUrl(widget.pdfUrl, AppConfigs.baseUrl);
      final String fileName = Uri.parse(fullUrl).pathSegments.last;
      AppLog.error('Checking for file: $fileName');

      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        AppLog.success('PDF already downloaded: $filePath');
        setState(() {
          pdfFile = file;
          isLoading = false;
        });
        return;
      }

      AppLog.error('Downloading from: $fullUrl');
      final response = await Dio().download(
        fullUrl,
        file.path,
        options: Options(
          headers: {
            'Accept': 'application/pdf',
          },
        ),
      );

      if (response.statusCode == 200) {
        AppLog.success('PDF downloaded to: $filePath');
        setState(() {
          pdfFile = file;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to download PDF');
      }
    } catch (e) {
      AppLog.error('Error downloading PDF: $e');
      setState(() {
        isLoading = false;
        errorMessage = S.of(context).downloadFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pdfViewer),
      ),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LoadingWidget(),
                  const SizedBox(height: 16),
                  Text(S.of(context).downloading),
                ],
              )
            : errorMessage != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        errorMessage ?? S.of(context).unknownError,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _downloadPdf,
                        child: Text(S.of(context).retry),
                      ),
                    ],
                  )
                : PdfViewerWidget(pdfFile: pdfFile!),
      ),
    );
  }
}
