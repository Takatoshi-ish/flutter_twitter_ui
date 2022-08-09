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
  String comment = '昨日のイベント最高でした！';

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
              child: const Icon(Icons.auto_awesome),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: ListView(
          children: List.generate(
            100,
            (int index) {
              return TweetTile(imageURL, userName, date, comment);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[400],
          tooltip: 'New Comment',
          child: const Icon(Icons.create),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
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
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageURL),
      ),
      title: Text(
        userName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              comment,
              overflow: TextOverflow.clip,
              maxLines: 3,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
