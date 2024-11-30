import 'package:flutter/material.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/bottom_bar.dart';
import 'package:flutter_2nd_year_sns_fr_design/components/post_list_screen.dart';
import 'package:flutter_2nd_year_sns_fr_design/models/post.dart';

List<Post> mypagePosts = [
  Post(
    userName: '怪盗キッド',
    content:
        '変装の達人で、世界中を騒がしている神出鬼没の怪盗。 その国際犯罪者番号から怪盗１４１２号と呼ばれていたが、必ず予告状を送りつけては、警察を完全に手玉にとり、盗みを成功させる鮮やかな手並みから、世間の人々には “怪盗キッド“と呼ばれている。 実は現在の怪盗キッドは２代目で、正体は高校生の黒羽快斗。',
    profileImage: 'images/post/sample3.jpg',
    isLiked: false,
  ),
  Post(
    userName: '怪盗キッド',
    content: "盗みってサイコー！！",
    profileImage: 'images/post/sample3.jpg',
    isLiked: false,
  ),
  Post(
    userName: '怪盗キッド',
    content: "今日のお目当ては赤面の人魚(ブラッシュ・マーメイド)!!動物愛護団体が怒りそうなお宝だぜ！",
    profileImage: 'images/post/sample3.jpg',
    isLiked: false,
    photo: 'images/post/sample6.jpg',
  ),
];

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'images/post/sample2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: -60,
                    left: 16,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
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
            const SizedBox(height: 10),
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
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
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
                  SizedBox(width: 3),
                  Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('いいねしたポスト'),
                  SizedBox(width: 3),
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
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              // 下線(indicator)の設定
              indicatorColor: Colors.greenAccent,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: '最近'),
                Tab(text: 'いいねが多い'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  PostListScreen(posts: mypagePosts), // 最近の投稿
                  PostListScreen(posts: mypagePosts), // いいねが多い投稿
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(currentIndex: 2),
    );
  }
}
