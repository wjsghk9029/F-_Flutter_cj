import 'package:double_back_to_close_app/double_back_to_close_app.dart';
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

  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/register_background.jpg'), context);
  }

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
    ShopPage(),
    OhQuePage(scrollController: _listViewScrollController,),
    HomePage(scrollController: _listViewScrollController,),
    MegazinePage(),
    MyPage(scrollController: _listViewScrollController,),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavi(),
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('나가고 싶다면 한번 더 누르시오'),
          ),
          child: _pages[_pageNum]
      ),
    );
  }



  _buildBottomNavi() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      height: _isVisible ? Get.height * 0.08 : 0.0,
      child: Wrap(
        children: <Widget>[
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _pageNum,
            onTap: (idx){
              setState(() {
                _pageNum = idx;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/F#_shop.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F#_shop_HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '숍',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/F# curation.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F#_curation_HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '오큐',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white,),
                activeIcon: Icon(Icons.home_outlined, color: Colors.red,),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/F# magazine.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F# magazine HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '매거진',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/F# my page.png', fit: BoxFit.cover, height: Get.height * 0.045,),
                activeIcon : Image.asset('assets/F# my page HP.png', fit: BoxFit.fill, height: Get.height * 0.045,),
                label: '마이페이지',
              ),
            ],
          ),
        ],
      ),
    );
  } 
}
