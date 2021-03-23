import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/Widget/register_page_router.dart';
import 'package:oftable_flutter/page/register/page/register_testpage.dart';
import 'package:oftable_flutter/page/register/page/registerpage1.dart';
import 'package:oftable_flutter/page/register/page/registerpage2.dart';
import 'package:oftable_flutter/page/register/page/registerpage3.dart';
import 'package:oftable_flutter/page/register/page/registerpage4.dart';


class StartOfTablePage extends StatefulWidget {
  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {
  PageController _pageController;
  int _pagenum = 0;

  List<Widget> Pages = [
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('로고'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (int pageNum){
                  setState(() {
                    _pagenum = pageNum;
                  });
                },
                controller: _pageController,
                  children: Pages,
              ),
            ),
            Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: 50,
              child: RegisterPageRouter(
                pageIndex: _pagenum,
                pageViewLength: Pages.length,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }


}
