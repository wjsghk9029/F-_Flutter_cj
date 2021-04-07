import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/page/home_page.dart';
import 'package:oftable_flutter/page/main/page/megazine_page.dart';
import 'package:oftable_flutter/page/main/page/my_page.dart';
import 'package:oftable_flutter/page/main/page/oh_que_page.dart';
import 'package:oftable_flutter/page/main/page/shop_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _listViewScrollController;
  bool _isVisible = true;
  int _pageNum = 2;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _listViewScrollController = ScrollController();
    _listViewScrollController.addListener(() {
      if (_listViewScrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible)
          setState(() {
            _isVisible = false;
          });
      }
      if (_listViewScrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible)
          setState(() {
            _isVisible = true;
          });
      }
    });
    _pages.addAll([
    HomePage(),
    ShopPage(),
    OhQuePage(scrollController: _listViewScrollController,),
    MegazinePage(),
    MyPage(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavi(),
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/logo_white.png',
            fit: BoxFit.cover,
            height: Get.height * 0.075,),
        ),
        automaticallyImplyLeading: false,
        actions: [

        ],
      ),
      body: _pages[_pageNum],
    );
  }

  _buildBottomNavi() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      height: _isVisible ? 56.0 : 0.0,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Wrap(
        children: <Widget>[
          BottomNavigationBar(
            currentIndex: _pageNum,
            onTap: (idx){
              setState(() {
                _pageNum = idx;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.blueAccent,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: '숍',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: '오큐',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_add),
                label: '매거진',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: '마이페이지',
              ),
            ],
          ),
        ],
      ),
    );
  } 
}
