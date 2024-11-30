import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/app_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/floating_button.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/post_list_screen.dart';
import 'package:flutter_2nd_year_sns_fr_design/models/post.dart';

List<Post> homePosts = [
  Post(
    userName: '服部平次',
    content: 'せやかて工藤！工藤ーーー！ってくどいねん',
    profileImage: 'images/post/sample4.jpg',
    photo: "images/post/sample2.jpg",
    isLiked: false,
  ),
  Post(
    userName: '工藤新一',
    content:
        "俺は高校生探偵、工藤新一。幼馴染で同級生の毛利蘭と遊園地へ遊びに行って黒ずくめの男の怪しげな取引現場を目撃した。取引を見るのに夢中になっていた俺は、背後から近づいてくるもう一人の仲間に気づかなかった。俺はその男に毒薬を飲まされ、目が覚めたら・・・",
    profileImage: 'images/post/sample5.png',
    isLiked: true,
  ),
];

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
      body: PostListScreen(
        posts: homePosts,
      ),
      bottomNavigationBar: const MyBottomBar(currentIndex: 0),
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
