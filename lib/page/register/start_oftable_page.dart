import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/register/page/register_testpage.dart';
import 'package:oftable_flutter/page/register/page/registerpage1.dart';
import 'package:oftable_flutter/page/register/page/registerpage2.dart';
import 'package:oftable_flutter/page/register/page/registerpage3.dart';
import 'package:oftable_flutter/page/register/page/registerpage4.dart';
import 'package:oftable_flutter/page/widget/register_page_router.dart';


class StartOfTablePage extends StatefulWidget {
  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {
  PageController _pageController;
  int _pagenum = 0;

  List<Widget> _pages = [
    RegisterPage1(),
    RegisterPage2(),
    RegisterPage3(),
    RegisterPage4(),
    RegisterTestPage(),
  ];

  @override
  void initState() {
    _pageController = PageController();
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
      appBar: AppBar(
        toolbarHeight: Get.height * 0.075,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/logo_white.png',
          fit: BoxFit.cover,
          height: Get.height * 0.045,),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int pageNum){
                  setState(() {
                    _pagenum = pageNum;
                  });
                },
                itemBuilder: (ctx, idx){
                  return _pages[idx];
                  },
                itemCount: _pages.length,
                controller: _pageController,
              ),
            ),
            Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: 50,
              child: PageRouterWithCircle(
                pageIndex: _pagenum,
                pageViewLength: _pages.length,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }


}
