import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/app_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/floating_button.dart';

class LikePostPage extends StatefulWidget {
  const LikePostPage({super.key});

  @override
  State<LikePostPage> createState() => _LikePostPageState();
}

class _LikePostPageState extends State<LikePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MyAppBar(title: "Favorites"),
      body: PostListScreen(),
      bottomNavigationBar: const MyBottomBar(currentIndex: 1),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}

class Post {
  final String userName;
  final String userHandle;
  final String tweetContent;
  final String profileImage;
  final bool isLiked;

  Post({
    required this.userName,
    required this.userHandle,
    required this.tweetContent,
    required this.profileImage,
    required this.isLiked,
  });
}

class PostListScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(
      userName: '工藤新一',
      userHandle: '@janesmith',
      tweetContent:
          "俺は高校生探偵、工藤新一。幼馴染で同級生の毛利蘭と遊園地へ遊びに行って黒ずくめの男の怪しげな取引現場を目撃した。取引を見るのに夢中になっていた俺は、背後から近づいてくるもう一人の仲間に気づかなかった。俺はその男に毒薬を飲まされ、目が覚めたら・・・",
      profileImage: 'images/post/sample5.png',
      isLiked: true,
    ),
  ];

  PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black54,
              ),
            ),
          ),
          child: Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(),
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(post.profileImage),
                            radius: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            post.userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "11/24 20:20",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.more_vert,
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      post.tweetContent,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // 角の丸みを指定
                    child: Image.asset(
                      'images/post/sample2.jpg', // 画像のパス
                      width: MediaQuery.of(context).size.width - 40,
                      height: (MediaQuery.of(context).size.width - 40) / 2,
                      fit: BoxFit.cover, // 画像のフィット方法
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 2,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('10'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.chat_bubble_outline,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('2'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
