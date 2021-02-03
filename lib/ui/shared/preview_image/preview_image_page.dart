import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PreviewImagePage extends StatelessWidget {
  final String imageUrl;

  PreviewImagePage({this.imageUrl});

  static void start({@required String imageUrl}) => Get.to(PreviewImagePage(imageUrl: imageUrl));

  @override
  Widget build(BuildContext context) {
    return PreviewImageWidget(
      imageUrl: imageUrl,
    );
  }
}

class PreviewImageWidget extends StatelessWidget {
  final String imageUrl;

  const PreviewImageWidget({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 375,
                width: double.infinity,
                child: PhotoView(
                  imageProvider: NetworkImage(imageUrl),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
