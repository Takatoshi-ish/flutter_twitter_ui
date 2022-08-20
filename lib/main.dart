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
  String comment2 =
      'IT企業勤務2年目(東京) | アプリ開発の勉強中 まずはIT企業で経験を積んで、その後あらゆるところで活躍できるエンジニアになりたいと思ってます！！ITエンジニアの人と繋がりたいです！';
  String comment3 = 'note書きましたmm\nわかりにくい戦略・構想・企画の話｜森 健志郎（˶′◡‵˶）スクー社長';
  String commentmini1 = 'わかりにくい戦略・構想・企画の話｜森 健志郎 スクー社長｜...';

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
              if (index % 3 == 0) {
                return TweetTile(imageURL, userName, date, comment2);
              } else if (index % 5 == 0) {
                return TweetWithImageTile(
                    imageURL, userName, date, comment3, commentmini1);
              } else {
                return TweetTile(imageURL, userName, date, comment);
              }
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
              IconContainer(
                  'assets/comment.png', 'assets/share_darttheme.png', 20, 20),
              const Text(
                '1',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 30,
              ),
              IconContainer(
                  'assets/repeat.png', 'assets/share_darttheme.png', 25, 20),
              const Text(
                '5',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 30,
              ),
              IconContainer(
                  'assets/heart.png', 'assets/share_darttheme.png', 25, 25),
              const Text(
                '100',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 30,
              ),
              IconContainer(
                  'assets/share.png', 'assets/share_darttheme.png', 20, 20),
            ],
          ),
        ],
      ),
    );
  }
}

class TweetWithImageTile extends StatelessWidget {
  String imageURL;
  String userName;
  String date;
  String comment;
  String commentmini;

  TweetWithImageTile(
      this.imageURL, this.userName, this.date, this.comment, this.commentmini,
      {Key? key})
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
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 187, 187, 187)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 187, 187, 187),
                      ),
                    ),
                    // borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image.asset(
                      'assets/image1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    commentmini,
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
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
              IconContainer(
                  'assets/comment.png', 'assets/share_darttheme.png', 20, 20),
              const Text(
                '1',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 30,
              ),
              IconContainer(
                  'assets/repeat.png', 'assets/share_darttheme.png', 25, 20),
              const Text(
                '5',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 30,
              ),
              IconContainer(
                  'assets/heart.png', 'assets/share_darttheme.png', 25, 25),
              const Text(
                '100',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 30,
              ),
              IconContainer(
                  'assets/share.png', 'assets/share_darttheme.png', 20, 20),
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
  String iconPathDartMode;
  double width;
  double height;
  IconContainer(this.iconPath, this.iconPathDartMode, this.width, this.height,
      {Key? key})
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
              Theme.of(context).brightness == Brightness.dark
                  ? iconPathDartMode
                  : iconPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
