import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({Key? key}) : super(key: key);

  @override
  State<ImageSliderScreen> createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  int _currInx = 0;
  List imgList = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Slider'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Image slider with inx 0\n\n',
            textAlign: TextAlign.center,
          ),
          CarouselSlider(
            items: imgList.map((imgUrl) {
              return Container(
                child: Image.asset(imgUrl, fit: BoxFit.fill),
              );
            }).toList(),
            options: CarouselOptions(
                //see all options in the class, will be fun
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enableInfiniteScroll: false,
                pauseAutoPlayOnTouch: false,
                scrollDirection: Axis.horizontal,
                //reverse: true,
                height: 250,
                initialPage: 0,
                onPageChanged: (inx, _) {
                  setState(() {
                    _currInx = inx;
                  });
                }),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContainer(0),
              buildContainer(1),
              buildContainer(2),
              buildContainer(3),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Image slider with CarouselSlider.builder\n\n',
            textAlign: TextAlign.center,
          ),
          CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index, _) {
              return Container(
                child: Image.asset(imgList[index], fit: BoxFit.fill),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 1),
              scrollDirection: Axis.vertical,
              //reverse: true,
              height: 250,
              initialPage: 0,
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainer(int inx) {
    return Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currInx==inx? Colors.redAccent : Colors.green,
          ),
        );
  }
}
