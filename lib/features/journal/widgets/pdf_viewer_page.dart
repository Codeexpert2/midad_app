import 'dart:io';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:midad/configs/app_configs.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/log/app_log.dart';
import 'package:midad/core/utils/url.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({
    super.key,
    required this.pdfPath,
  });

  final String pdfPath;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _downloadAndOpenPdf();
  }

  Future<void> _downloadAndOpenPdf() async {
    try {
      final String fullUrl = normalizeUrl(widget.pdfPath, AppConfigs.baseUrl);
      final String fileName = Uri.parse(fullUrl).pathSegments.last;
      AppLog.error('Checking for file: $fileName');

      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        AppLog.success('PDF already downloaded: $filePath');
        await OpenFile.open(file.path);
        setState(() => isLoading = false);
        return;
      }

      AppLog.error('Downloading from: $fullUrl');
      final response = await Dio().download(
        fullUrl,
        file.path,
        options: Options(
          headers: {
            'User-Agent': 'Mozilla/5.0',
            'Accept': 'application/pdf',
          },
        ),
      );

      if (response.statusCode == 200) {
        AppLog.success('PDF downloaded to: $filePath');
        await OpenFile.open(file.path);
        setState(() => isLoading = false);
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
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(S.of(context).downloading),
                ],
              )
            : errorMessage != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            errorMessage = null;
                          });
                          _downloadAndOpenPdf();
                        },
                        child: Text(S.of(context).retry),
                      ),
                    ],
                  )
                : Text(S.of(context).pdfOpenedSuccessfully),
      ),
    );
  }
}
