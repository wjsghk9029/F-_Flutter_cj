import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/register/page/allergy_page.dart';
import 'package:oftable_flutter/page/register/page/registerpage1.dart';
import 'package:oftable_flutter/page/register/page/registerpage2.dart';
import 'package:oftable_flutter/page/register/page/registerpage3.dart';
import 'package:oftable_flutter/page/widget/register_page_router.dart';


class StartOfTablePage extends StatefulWidget {
  static final PageController pageController = PageController();
  static int beforePageNum = 0;

  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {
  PageController _pageController;
  int _pagenum = 0;
  AssetImage backgroundImage;

  List<Widget> _pages = [
    RegisterPage1(),
    RegisterPage2(),
    AllergyPage(),
    RegisterPage3(),
  ];

  @override
  void initState() {
    backgroundImage = AssetImage('assets/register_background.jpg');
    _pageController = StartOfTablePage.pageController;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: backgroundImage , fit: BoxFit.fill),
            ),
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: Get.height * 0.1)),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int pageNum){
                    setState(() {
                      _pagenum = pageNum;
                      StartOfTablePage.beforePageNum = _pagenum;
                    });
                  },
                  itemBuilder: (ctx, idx){
                    return _pages[idx];
                    },
                  itemCount: _pages.length,
                  controller: _pageController,
                ),
              ),
              Container(
                height: Get.height * 0.03,
                width: 125,
                child: PageRouterWithCircle(
                  pageIndex: _pagenum,
                  pageViewLength: _pages.length,
                    ),
              ),
            ],
          ),
          _buildPositioned(),
        ],
      ),
    );
  }

  Positioned _buildPositioned() {
    return Positioned(
          width: Get.width,
          child: AppBar(
            shape: Border(bottom: BorderSide(color: Colors.white, width: 0.75)),
            toolbarHeight: Get.height * 0.075,
            elevation: 0,
            shadowColor: Colors.white,
            backgroundColor: Colors.transparent,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/상단로고.png',
                fit: BoxFit.cover,
                height: Get.height * 0.05,),
            ),
            automaticallyImplyLeading: false,
          ),
        );
  }


}
