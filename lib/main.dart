import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String imageURL =
      'https://pbs.twimg.com/profile_images/1510946043718160386/mPJ6v_Xf_400x400.jpg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Twitter UI',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
              TweetTile(imageURL),
            ],
          ),
        ),
      ),
    );
  }
}

class TweetTile extends StatelessWidget {
  String imageURL;

  TweetTile(this.imageURL, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにする
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageURL),
          ),
          const SizedBox(width: 8), // 少し隙間を開ける
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('こんぶ @ Flutter大学'),
                  SizedBox(width: 8),
                  Text('2022/05/05'),
                ],
              ),
              const SizedBox(height: 4),
              const Text('最高でした。'),
              const SizedBox(height: 4),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/comment.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 25,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/repeat.png',
                          ),
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/heart.png',
                          ),
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/share.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
