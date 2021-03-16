import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage1.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage2.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage3.dart';
import 'package:oftable_flutter/page/start_oftable/page/registerpage4.dart';

class StartOfTablePage extends StatefulWidget {
  @override
  _StartOfTablePageState createState() => _StartOfTablePageState();
}

class _StartOfTablePageState extends State<StartOfTablePage> {
  PageController _pageController;
  int _pagenum = 0;

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
                  children: [
                    RegisterPage1(),
                    RegisterPage2(),
                    RegisterPage3(),
                    RegisterPage4(),
                  ],
              ),
            ),
            Text('$_pagenum'),
          ],
        ),
      ),
    );
  }


}
