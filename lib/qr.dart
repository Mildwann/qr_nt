import 'package:flutter/material.dart';
import 'package:qrcode_reader_web/qrcode_reader_web.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final List<QRCodeCapture> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example App"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            QRCodeReaderSquareWidget(
              onDetect: (QRCodeCapture capture) =>
                  setState(() => list.add(capture)),
              size: 250,
            ),
            QRCodeReaderTransparentWidget(
              onDetect: (QRCodeCapture capture) =>
                  setState(() => list.add(capture)),
              targetSize: 250,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return ListTile(title: Text(list[index].raw));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
