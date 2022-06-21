import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final piclists = [
  'https://cdn.pixabay.com/photo/2018/07/07/16/39/landscape-3522447_960_720.jpg',
  'https://i.pinimg.com/736x/53/48/7e/53487e31f078f7a16b4f151852107cd7.jpg',
  'https://cdn.pixabay.com/photo/2015/11/11/03/47/evening-1038148__480.jpg',
];

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('클릭');
                  },
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('a'),
                  ]),
                ),
                Column(children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('b'),
                ]),
                Column(children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('c'),
                ]),
                Column(children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('d'),
                ]),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('e'),
                ]),
                Column(children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('f'),
                ]),
                Column(children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('g'),
                ]),
                Opacity(
                  opacity: 0.0,
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('h'),
                  ]),
                )
              ],
            ),
          ],
        ));
  }

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
      ),
      items: piclists.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(url, fit: BoxFit.cover),
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildBottom() {
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('이것은 공지사항입니다.'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}
