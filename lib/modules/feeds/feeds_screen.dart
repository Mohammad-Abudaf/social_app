import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        Container(
            child: Card(
                elevation: 15.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
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
                ))),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => postBuilder(context),
          separatorBuilder: (context, index) => SizedBox(height: 5.0,),
          itemCount: 10,
        ),
      ]),
    );
  }

  Widget postBuilder(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg'),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Ave Whitman',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.blue,
                            size: 15.0,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Jan 21, 2021 at 11:00 am',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 14.0),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.more_horiz_rounded), onPressed: () {})
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. ... One of the most important of these is a topic sentence.',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 15.0,
                      ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.zero,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6.0),
                      child: Container(
                        height: 20.0,
                        child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Text(
                            '#software',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Image(
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://image.freepik.com/free-photo/close-up-portrait-magnificent-caucasian-girl-round-pink-sunglasses_197531-20682.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '1200',
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              color: Colors.amberAccent,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '500',
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg'),
                    radius: 20.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 11.0),
                        height: 40.0,
                        child: Text(
                          'write a comment ...',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.favorite_outline,
                        size: 25.0,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.ios_share,
                        size: 25.0,
                        color: Colors.green,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      );
}
