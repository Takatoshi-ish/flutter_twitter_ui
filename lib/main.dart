import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String imageURL = 'assets/profile.png';
  String userName = 'Taka @ Flutter大学';
  String date = '2022/05/05';
  String comment = '最高でした。';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            alignment: FractionalOffset.centerLeft,
            child: OverflowBox(
              maxWidth: 110,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  imageURL,
                ),
              ),
            ),
          ),
          title: const Text(
            'ホーム',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            Transform.rotate(
              angle: 180 * pi / 180,
              child: Icon(Icons.auto_awesome),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 20; i++) ...{
                TweetTile(imageURL, userName, date, comment),
              },
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}

class TweetTile extends StatelessWidget {
  String imageURL;
  String userName;
  String date;
  String comment;

  TweetTile(this.imageURL, this.userName, this.date, this.comment, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              imageURL,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(userName),
                  const SizedBox(width: 8),
                  Text(date),
                ],
              ),
              const SizedBox(height: 4),
              Text(comment),
              const SizedBox(height: 4),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  IconContainer('assets/comment.png', 20, 20),
                  const SizedBox(
                    width: 30,
                  ),
                  IconContainer('assets/repeat.png', 25, 20),
                  const SizedBox(
                    width: 30,
                  ),
                  IconContainer('assets/heart.png', 25, 25),
                  const SizedBox(
                    width: 30,
                  ),
                  IconContainer('assets/share.png', 20, 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//今回はUIだけなので良いが機能（アイコンタップ時の処理）も含めると分けるのが良いとは言い切れない
class IconContainer extends StatelessWidget {
  String iconPath;
  double width;
  double height;
  IconContainer(this.iconPath, this.width, this.height, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              iconPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
