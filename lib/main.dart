import 'package:flutter/material.dart';
import 'package:youtube_clone/pages.dart';
import 'package:youtube_clone/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube clone',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Pages(title: 'Home page'),
              Pages(title: 'Trending page'),
              Pages(title: 'Subscribing page'),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.explore),
                text: 'Trending',
              ),
              Tab(
                icon: Icon(Icons.video_collection),
                text: 'Subscibing',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
            ],
            labelColor: Colors.red,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
          backgroundColor: Color(0xFF282828),
        ),
      ),
    );
  }
}
