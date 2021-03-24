import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _listViewScrollController;
  bool _isVisible = true;

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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavi(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('로고'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: (){}),
          IconButton(icon: Icon(Icons.search), onPressed: (){}),

        ],
      ),
      body: _buildBody(),
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

  _buildBody() {
    return ListView.builder(
      controller: _listViewScrollController,
      itemCount: 100,
      itemBuilder: (ctx, idx){
        return Text('$idx');
      },
    );
  }
}
