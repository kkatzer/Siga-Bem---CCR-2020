import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hackathonccr/constants.dart';
import 'package:hackathonccr/utils/utils.dart';

class SaudeCarousel extends StatelessWidget {
  final List<Widget> carouselImages = [
    GestureDetector(
      onTap: () {
        launchURL('https://sportlife.com.br/7-alongamentos-fazer-transito/');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/dicas e cuidados.png'),
        ),
      ),
    ),
    Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Image.asset('assets/images/info/preservativos.png'),
      ),
    ),
    Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Image.asset('assets/images/info/preservativos2.png'),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL('http://saude.gov.br/saude-de-a-z/aids-hiv');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/IST.png'),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL('http://saude.gov.br/saude-de-a-z/aids-hiv');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/AIDS.png'),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL(
            'http://www.aids.gov.br/pt-br/publico-geral/o-que-sao-ist/gonorreia-e-infeccao-por-clamidia');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/gonorreia.png'),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL('http://saude.gov.br/saude-de-a-z/hepatite');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/hepatite.png'),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        launchURL('http://saude.gov.br/saude-de-a-z/sifilis');
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset('assets/images/info/sifilis.png'),
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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Nós nos preocupamos com a sua saúde. Por isso, separamos algumas dicas valiosas para você. Caso queira saber mais, clique nas imagens abaixo.',style: kBodyStyle,),
          ),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                viewportFraction: 0.85,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.width),
          ),
        ],
      ),
    );
  }
}
