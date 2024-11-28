import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/action_bottom_sheet.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/app_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const MyAppBar(title: "Home"),
      body: PostListScreen(),
      bottomNavigationBar: const MyBottomBar(currentIndex: 0),
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
        userName: '井ノ本',
        userHandle: '@johndoe',
        tweetContent: 'flutteについて色々書いてみますものの、とは言っても色々書いてみますものの',
        profileImage: 'images/post/sample.png',
        isLiked: false),
    Post(
        userName: '江戸川コナン',
        userHandle: '@janesmith',
        tweetContent: 'こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは',
        profileImage: 'images/post/sample.png',
        isLiked: true),
  ];

  PostListScreen({super.key});

  /// [ActionBottomSheet]にのせる選択肢
  /// ボトムシートの土台

  void onMoreVertPressed(BuildContext context) {
    ActionBottomSheet.show(
      context,
      actions: [
        ActionItem(
          icon: Icons.edit_note_outlined,
          text: '投稿を編集する',
          onTap: () => debugPrint('編集'),
        ),
        ActionItem(
          icon: Icons.delete,
          text: '投稿を削除する',
          onTap: () => debugPrint('削除'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
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
            color: Colors.white,
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
                            onTap: () {
                              onMoreVertPressed(context);
                            },
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 2,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        post.isLiked
                            ? Icons.favorite
                            : Icons
                                .favorite_border, // isLikedがtrueなら塗りつぶしアイコン、falseなら枠線のみ
                        color: post.isLiked
                            ? Colors.red
                            : Colors.black, // isLikedがtrueなら赤色、falseなら灰色
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text('10'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.chat_bubble_outline,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text('2'),
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
