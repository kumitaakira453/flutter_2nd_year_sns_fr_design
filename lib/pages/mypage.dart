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
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
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
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'AWS bot',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'hiroto_inomoto@aws.co.jp',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 2, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '今年から大学生です！大学デビューで髪の毛を緑色🟢に染めてみました！ぜひお声かけください！🙏',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('ポスト'),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('いいねしたポスト'),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // 枠線の色
                    width: 1.0, // 枠線の幅
                  ),
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '最近',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 130,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'いいねが多い',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 2, // 下線の太さ
                        color: Colors.greenAccent[400], // 下線の色
                        width:
                            MediaQuery.of(context).size.width / 2, // 必要に応じて調整
                      ),
                      Container(
                        height: 2, // 下線の太さ
                        color: Colors.green.withOpacity(0), // 下線の色
                        width:
                            MediaQuery.of(context).size.width / 2, // 必要に応じて調整
                      ),
                    ],
                  ),
                ],
              ),
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
