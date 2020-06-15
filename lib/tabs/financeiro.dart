import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hackathonccr/utils/utils.dart';

class FinanceiroCarousel extends StatelessWidget {
  final List<Widget> carouselImages = [
    GestureDetector(
      onTap: () {
        launchURL('http://minhaseconomias.com.br/educacao-financeira');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/cuidedoseudinheiro.jpg'),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL('http://minhaseconomias.com.br/educacao-financeira');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/cuidedoseudinheiro2.jpg'),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL('http://minhaseconomias.com.br/educacao-financeira');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/cuidedoseudinheiro3.jpg'),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = carouselImages
        .map((item) => Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: item),
            ))
        .toList();

    return SafeArea(
      child: CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.width),
      ),
    );
  }
}
