import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/CentralAffecting/Central_affecting.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared/ui/theme/app_color.dart';

class QrCodeScanner extends StatelessWidget {
  QrCodeScanner({super.key});

  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    // Define the scan window size
    final double scanWindowSize = context.widthmedia(0.5);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
                    child:
          SizedBox(
            width: context.width,
            height: context.height,
            child: 
          MobileScanner(

            controller: controller,
            fit: BoxFit.fill,
            scanWindow: Rect.fromCenter(
              center: Offset(MediaQuery.of(context).size.width / 2,
                  MediaQuery.of(context).size.height / 2),
              width: scanWindowSize,
              height: scanWindowSize,
            ),
            onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                print('QR Code detected: ${barcode.rawValue}');
              }
              controller.stop();
              
              //Get.to(CentralAffecting( uuid: capture.barcodes.last.rawValue!,));
      showModalBottomSheet(
  context: context,
  isScrollControlled: true, 
  backgroundColor: Colors.transparent,
  builder: (context) {
    return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,  
          ),
          child:  CentralAffecting(
          uuid: capture.barcodes.last.rawValue!,   
    ),          
        );
      },
    )
 .then((value) {
  controller.start();  
});


            },
          ),
          ),
          ),
          ClipPath(
            clipper: _ScannerOverlayClipper(scanWindowSize),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Container(
              width: scanWindowSize,
              height: scanWindowSize,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 4.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerOverlayClipper extends CustomClipper<Path> {
  final double scanWindowSize;

  _ScannerOverlayClipper(this.scanWindowSize);

  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: scanWindowSize,
        height: scanWindowSize,
      ),
      const Radius.circular(12.0),
    ));

    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
