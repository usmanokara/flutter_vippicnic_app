import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/widgets/loading_progress.dart';

// ignore: must_be_immutable
class SelfiesFullImage extends StatelessWidget {
  String imgPath;

  SelfiesFullImage({this.imgPath});

  final LinearGradient background = LinearGradient(
    colors: [
      Color(0x1000000),
      Color(0x3000000),
    ],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SizedBox.expand(
        child: new Container(
          decoration: new BoxDecoration(gradient: background),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: InteractiveViewer(
                  child: CachedNetworkImage(
                    useOldImageOnUrlChange: false,
                    fit: BoxFit.contain,
                    imageUrl: imgPath,
                    placeholder: (context, url) => SizedBox(
                      child: NativeProgress(),
                      height: 30.0,
                      width: 20.0,
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error_outline),
                  ),
                ),
              ),
              new Align(
                alignment: Alignment.topLeft,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: CircleBorder(),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
