import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/post_model/post_model.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition: AppCubit.get(context).userModel != null && AppCubit.get(context).posts.length>0,
      builder: (context) => SingleChildScrollView(
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
            itemBuilder: (context, index) => postBuilder(AppCubit.get(context).posts[index],context, index),
            separatorBuilder: (context, index) => SizedBox(height: 5.0,),
            itemCount: AppCubit.get(context).posts.length,
          ),
        ]),
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  },
);
  }

  Widget postBuilder(PostModel postModel, BuildContext context, int index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('${postModel.userImage}'),
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
                            '${postModel.userName}',
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
                        '${postModel.dateTime}',
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
                  '${postModel.text}',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 15.0,
                      ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   margin: EdgeInsets.zero,
              //   child: Wrap(
              //     alignment: WrapAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsetsDirectional.only(end: 6.0),
              //         child: Container(
              //           height: 20.0,
              //           child: MaterialButton(
              //             minWidth: 1.0,
              //             padding: EdgeInsets.zero,
              //             onPressed: () {},
              //             child: Text(
              //               '#software',
              //               style: TextStyle(
              //                 color: Colors.blue,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              if(postModel.postImage != '')
                Container(
                width: double.infinity,
                child: Image(
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  image: NetworkImage('${postModel.postImage}'),
                ),
              ),
              SizedBox(height: 10.0,),
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
                              '${AppCubit.get(context).postsLikesNumber[index]}',
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
                              '0',
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
                    backgroundImage: NetworkImage(AppCubit.get(context).userModel.image),
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
                      onPressed: () {
                        AppCubit.get(context).likePost(AppCubit.get(context).postsID[index]);
                      }),
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
