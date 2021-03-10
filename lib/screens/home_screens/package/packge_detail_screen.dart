import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/screens/home_screens/package/order_package_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';

class PackageDetailScreen extends StatefulWidget {
  static String ID = "/package_detail_screen";

  @override
  _PackageDetailScreenState createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back,
                          color: kPrimaryColor, size: 40)),
                  Expanded(
                    child: CenterText(
                      text: "Picnic Packages",
                      textColor: kPrimaryColor,
                      fontSize: 20,
                      isCenter: true,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondryColor),
                        child: Center(
                            child: Icon(Icons.search,
                                color: Colors.white, size: 30))),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    PackageDetailItem(
                      title: "Picnic Kids",
                      image:
                          "https://i.pinimg.com/originals/df/f9/ff/dff9ff5a892a5163b91c463093894dcb.jpg",
                    ),
                    PackageDetailItem(
                      title: "Romantic picnic",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi3Y3OOuybjU97wI6jtfMsMy4_75VijPhbV-Y49NfiyugPeNc5RxhHpjc7Zjx6IX7DSz0&usqp=CAU",
                    ),
                    PackageDetailItem(
                      title: "Birthday picnic",
                      image:
                          "https://i.pinimg.com/originals/47/58/d0/4758d0fca1a66fe30a6356a50948e53c.jpg",
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class PackageDetailItem extends StatelessWidget {
  PackageDetailItem({this.title, this.image});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppCacheImage(
              imageUrl: this.image,
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
              round: 20),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CenterText(
                    text: this.title, textColor: kPrimaryColor, fontSize: 19),
                SizedBox(height: 10),
                MaterialButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, OrderPackageScreen.ID),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: kPrimaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: CenterText(
                        text: "See detail".toUpperCase(),
                        textColor: Colors.white,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
