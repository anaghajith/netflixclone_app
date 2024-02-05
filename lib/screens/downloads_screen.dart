import 'dart:math';
import 'package:Netflixapp/screens/search_screen.dart';
import 'package:Netflixapp/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});

  final _widgetList = [ ImageSection(), ButtonSection()];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) => NavigationHelper.navigate(context, index),
        currentIndex: 3,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: _widgetList.length),
    );
  }
}

class ImageSection extends StatelessWidget {
  ImageSection({super.key});

  final List imageList = [
    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/bkpPTZUdq31UGDovmszsg2CchiI.jpg",
    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/9GBhzXMFjgcZ3FdR9w3bUMMTps5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads For You ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        const Text(
          "we will download a personalized selection of\n movies and shows for you, so there is always\n something to watch",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.3,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: EdgeInsets.only(
                  left: 89,
                ),
                angle: 30,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 89),
                angle: -30,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                margin: EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.35, size.width * 0.65),
                radius: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
          },
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            margin: margin,
            width: size.width,
            height: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                //fit: BoxFit.cover,
                image: NetworkImage(
                  imageList,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
