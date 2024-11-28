import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/add_post.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/home.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/like_post.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/login.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/mypage.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/profile.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/settings.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signup',
      routes: {
        "/top": (context) => const HomePage(),
        "/signup": (context) => const SignUpPage(),
        "/login": (context) => const LoginPage(),
        "/like-post": (context) => const LikePostPage(),
        "/mypage": (context) => const MyPage(),
        "/profile": (context) => const ProfilePage(),
        "/post-add": (context) => const AddPostPage(),
        "/settings": (context) => const SettingsPage(),
        // "/post-update": (context) => PostUpdatePage(),
      },
    );
  }
}
