import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterText extends StatelessWidget {
  CenterText(
      {@required this.text,
      @required this.textColor,
      @required this.fontSize,
      this.textStyle,
      this.isBold,
      this.isCenter,
      this.maxLines,this.fontWeight});

  final String text;
  final Color textColor;
  final double fontSize;
  bool isBold = false;
  bool isCenter;
  int maxLines;
  TextStyle textStyle;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    isBold = isBold ?? false;
    isCenter = isCenter ?? false;
    textStyle = textStyle ?? GoogleFonts.openSans();
    fontWeight = fontWeight ?? FontWeight.normal;
    if (isCenter) {
      if (maxLines != null)
        return Container(
          child: Center(
            child: Text(
              this.text,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: textStyle.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            ),
          ),
        );
      else
        return Container(
          child: Center(
            child: Text(
              this.text,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: textStyle.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            ),
          ),
        );
    } else {
      if (maxLines != null) {
        return Container(
          child: Text(
            this.text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: textStyle.copyWith(
                color: textColor,
                fontSize: fontSize,
          )),
        );
      } else
        return Container(
          child: Text(
            this.text,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: textStyle.copyWith(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight),
          ),
        );
    }
  }
}
