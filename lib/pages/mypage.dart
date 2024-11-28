import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/home.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _PostLikePageState();
}

class _PostLikePageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottombarを画面いっぱいに広げる
      resizeToAvoidBottomInset: true,
      // appBar: const MyAppBar(title: "Mypage"),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // 背景画像
                  Positioned.fill(
                    child: Image.asset(
                      'images/post/sample2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // プロフィールカード
                  Positioned(
                    bottom: -60, // 少しはみ出す位置調整
                    left: 16, // 左寄せ
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // 余白を追加
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // 円形
                          border: Border.all(
                            // 白い境界線
                            color: Colors.white,
                            width: 4,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('images/post/sample.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 55,
                  height: 30,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.black26),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "編集",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: PostListScreen(),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(currentIndex: 2),
    );
  }
}
