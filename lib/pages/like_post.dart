import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/app_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/floating_button.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/post_list_screen.dart';
import 'package:flutter_2nd_year_sns_fr_design/models/post.dart';

final List<Post> postLikePageposts = [
  Post(
    userName: '工藤新一',
    content:
        "俺は高校生探偵、工藤新一。幼馴染で同級生の毛利蘭と遊園地へ遊びに行って黒ずくめの男の怪しげな取引現場を目撃した。取引を見るのに夢中になっていた俺は、背後から近づいてくるもう一人の仲間に気づかなかった。俺はその男に毒薬を飲まされ、目が覚めたら・・・",
    profileImage: 'images/post/sample5.png',
    isLiked: true,
  ),
];

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
      body: PostListScreen(posts: postLikePageposts),
      bottomNavigationBar: const MyBottomBar(currentIndex: 1),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
