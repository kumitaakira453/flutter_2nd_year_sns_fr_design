import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/home.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/like_post.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/mypage.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    // ページ遷移を行う関数
    void changePage(int index) {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionDuration: Duration.zero, // アニメーションなし
          ));
          break;
        case 1:
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LikePostPage(),
            transitionDuration: Duration.zero, // アニメーションなし
          ));
          break;
        case 2:
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyPage(),
            transitionDuration: Duration.zero, // アニメーションなし
          ));
          break;
        default:
          throw Exception('Invalid index: $index');
      }
    }

    return BottomNavigationBar(
      backgroundColor: Colors.greenAccent[400],
      currentIndex: currentIndex,
      onTap: changePage,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black.withOpacity(0.6),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Mypage',
        ),
      ],
    );
  }
}
