import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/pages/home.dart';

List<Post> mypagePosts = [
  Post(
      userName: '怪盗キッド',
      content:
          '変装の達人で、世界中を騒がしている神出鬼没の怪盗。 その国際犯罪者番号から怪盗１４１２号と呼ばれていたが、必ず予告状を送りつけては、警察を完全に手玉にとり、盗みを成功させる鮮やかな手並みから、世間の人々には “怪盗キッド“と呼ばれている。 実は現在の怪盗キッドは２代目で、正体は高校生の黒羽快斗。',
      profileImage: 'images/post/sample3.jpg',
      isLiked: false),
  Post(
    userName: '怪盗キッド',
    content: "盗みってサイコー！！",
    profileImage: 'images/post/sample3.jpg',
    isLiked: false,
  ),
];

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
                            image: AssetImage('images/post/sample3.jpg'),
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
                  '怪盗キッド',
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
                  Text('投稿'),
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
                        height: 2,
                        color: Colors.greenAccent[400],
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Container(
                        height: 2,
                        color: Colors.green.withOpacity(0),
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: PostListScreen(
                posts: mypagePosts,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(currentIndex: 2),
    );
  }
}
