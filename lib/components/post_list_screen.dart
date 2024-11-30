import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/action_bottom_sheet.dart';
import 'package:flutter_2nd_year_sns_fr_design/models/post.dart';

class PostListScreen extends StatelessWidget {
  final List<Post> posts;

  const PostListScreen({super.key, required this.posts});

  void handleOnDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('本当に投稿を削除しますか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // 削除処理
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('投稿を削除しました。'),
                  ),
                );
              },
              child: const Text('はい'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('いいえ'),
            ),
          ],
        );
      },
    );
  }

  void onMoreVertPressed(BuildContext context) {
    ActionBottomSheet.show(
      context,
      actions: [
        ActionItem(
          icon: Icons.edit_note_outlined,
          text: '投稿を編集する',
          onTap: () => Navigator.of(context).pushNamed('/post/update'),
        ),
        ActionItem(
          icon: Icons.delete,
          text: '投稿を削除する',
          onTap: () {
            handleOnDelete(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
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
                        post.content,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  post.photo != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // 角の丸みを指定
                            child: Image.asset(
                              post.photo!, // 画像のパス
                              width: MediaQuery.of(context).size.width - 40,
                              height:
                                  (MediaQuery.of(context).size.width - 40) / 2,
                              fit: BoxFit.cover, // 画像のフィット方法
                            ),
                          ),
                        )
                      : Container(),
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
      ),
    );
  }
}
