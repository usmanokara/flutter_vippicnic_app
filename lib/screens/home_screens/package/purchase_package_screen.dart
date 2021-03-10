import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vippicnic/screens/home_screens/package/cutomize_event_screen.dart';
import 'package:vippicnic/screens/home_screens/package/packge_detail_screen.dart';
import 'package:vippicnic/utils/constants.dart';
import 'package:vippicnic/widgets/cache_image.dart';
import 'package:vippicnic/widgets/center_text.dart';

import '../../login_screen.dart';

class PurchasePackageScreen extends StatefulWidget {
  static String ID = "/purchase_package_screen";

  @override
  _PurchasePackageScreenState createState() => _PurchasePackageScreenState();
}

class _PurchasePackageScreenState extends State<PurchasePackageScreen> {
  List<Map<String, dynamic>> categories = [
    {
      'title': 'Picnic',
      'image':
          'https://i.pinimg.com/originals/df/f9/ff/dff9ff5a892a5163b91c463093894dcb.jpg'
    },
    {
      'title': 'Events',
      'image':
          'https://images.unsplash.com/photo-1549934159-af720506e2bb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFtaWx5JTIwcGljbmljfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80'
    },
    {
      'title': 'Parties',
      'image':
          'https://cdn.choosechicago.com/uploads/2019/05/Lyric-Halloween_Fox-Harrison_header-2-2400x1399.png'
    },
    {
      'title': 'Babyshower',
      'image':
          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F38%2F2018%2F12%2F12232522%2Fshutterstock_599720180.jpg'
    },
    {
      'title': 'Gender Reveal',
      'image': 'https://www.out.com/sites/default/files/gender-reveal.jpg'
    },
    {
      'title': 'Customize',
      'image':
          'https://i.pinimg.com/564x/bf/bb/38/bfbb38a443d9da5161c954cc4895dff1.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back,
                            color: kPrimaryColor, size: 40)),
                    Expanded(
                      child: CenterText(
                        text: "Purchase event",
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
              ),
              SizedBox(height: 10),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: categories.map((e) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context,
                              e['title'] == "Customize"
                                  ? CustomizeEventScreen.ID
                                  : PackageDetailScreen.ID),
                          child: MyListTile(
                              backImage: e['image'], title: e['title']),
                        );
                      }).toList(),
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

class MyListTile extends StatelessWidget {
  const MyListTile({@required this.backImage, this.title});

  final String backImage;
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Stack(
            children: [
              AppCacheImage(
                  imageUrl: backImage,
                  width: double.infinity,
                  height: double.infinity),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.35),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                right: 10,
                child: Text(
                  '$title',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'open_regular',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.width / 2.3,
          width: MediaQuery.of(context).size.width / 2.3,
        ),
      ),
    );
  }
}
