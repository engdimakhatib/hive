import 'package:flutter/material.dart';

import '../views/post_app_bar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/post.jpeg'),fit: BoxFit.cover,opacity: 0.7,),),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(child: postAppBar(), preferredSize: Size.fromHeight(90),),
       // bottomNavigationBar: PostBottomBar(),
      ),
    );
  }
}