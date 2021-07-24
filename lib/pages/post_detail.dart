import 'package:denis/data/posts.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final Posts posts;
  final bool isMobileView;

  const PostDetails({Key? key, required this.posts, required this.isMobileView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobileView ? MediaQuery.of(context).size.width: 400,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [closeButton(context), buildBody()],
            ),
          );
        }
      ),
    );
  }

  Positioned closeButton(BuildContext context) {
    return Positioned(
      top: 10,
      right: 0,
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Positioned buildBody() {
    return Positioned.fill(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


        Spacer(),

        CircleAvatar(
          radius: 50,
          child: Text(posts.id.toString(), style: TextStyle(fontSize: 30),),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          posts.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        Text(posts.body, textAlign: TextAlign.center),
        Spacer(),
      ],
    ));
  }
}
