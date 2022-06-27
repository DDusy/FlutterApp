import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderPage extends StatefulWidget {
  
  final Set<Image> imagelist;
  final double height;

  ImageSliderPage({
    Key? key,
    required this.imagelist,
    required this.height
    }) 
    : super(key: key);

  
  @override
  _ImageSliderPageState createState() => _ImageSliderPageState(imagelist,height);
  
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  final Set<Image> imagelist;
  final double _height;

  _ImageSliderPageState(this.imagelist,this._height);

  @override
  Widget build(BuildContext context) {
       return CarouselSlider(
          options: CarouselOptions(
            height : _height,
            autoPlay: true),
          items: imagelist.map((item) {
            return Builder(builder: (BuildContext context) 
            {
                return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal:10.0),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(1.0),
                child: item,
              ),
              );
            });
          }).toList(),
       );
  }
}