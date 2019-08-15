import 'package:design_netflix_splash_screen/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NXHomePage extends StatefulWidget {
  @override
  _NXHomePageState createState() => _NXHomePageState();
}

class _NXHomePageState extends State<NXHomePage> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      buildMainSlider(
        urlLocalImg: 'assets/images/netflix01.png',
        title: 'Watch on any device',
        text:
            'Stream on your phone, tablet, laptop, and TV without paying more.',
      ),
      buildMainSlider(
        urlLocalImg: 'assets/images/netflix02.png',
        title: 'asdad',
        text:
            'Stream on your phone, tablet, laptop, and TV without paying more.',
      ),
      buildMainSlider(
        urlLocalImg: 'assets/images/netflix03.png',
        title: 'Watch on any device',
        text:
            'Stream on your phone, tablet, laptop, and TV without paying more.',
      ),
      buildLastSlider(),
    ];

    return Scaffold(
      backgroundColor: NetflixColors.mainBg,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(children: [
              CarouselSlider(
                items: myList,
                autoPlay: false,
                viewportFraction: 1.0,
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                onPageChanged: (int index) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              buildCarouselDots(myList),
              buildFakeAppBar(),
            ]),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              color: NetflixColors.red,
              child: Text(
                'JOIN NOW',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () => print('join now!!! $_current'),
            ),
          )
        ],
      ),
    );
  }

  Positioned buildFakeAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 90,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                'assets/images/netflixLogo.png',
                width: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Text('SIGN IN'),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 69,
                    child: FlatButton(
                      child: Text('HELP'),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildCarouselDots(List<Widget> myList) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(myList.length, (index) {
          return Container(
            width: 9.0,
            height: 9.0,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? NetflixColors.red : Colors.grey),
          );
        }),
      ),
    );
  }

  Column buildMainSlider({String urlLocalImg, String title, String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(urlLocalImg),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Container buildLastSlider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/netflix04.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.transparent, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.2, 0.95],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Unilimited entertaiment, one low price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Stream and download as much as you want, no extra fees.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
