import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Container(
          child: Card(
              elevation: 15.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                        'https://image.freepik.com/free-photo/appealing-young-woman-sparkle-sunglasses-looking-distance-portrait-glamorous-european-model-with-short-haircut-smiling_197531-20541.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'communicate with friends',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white, fontSize: 17),
                    ),
                  )
                ],
              )))
    ]);
  }
}
