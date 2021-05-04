import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oftable_flutter/page/main/controller/oh_que_page_controller.dart';

import 'wiget/oh_que_list.dart';

class OhQuePage extends StatefulWidget {
  final ScrollController scrollController;
  static final PageController pageController = PageController();
  const OhQuePage({this.scrollController});
  @override
  _OhQuePageState createState() => _OhQuePageState();
}
@override

class _OhQuePageState extends State<OhQuePage> {
  OhQuePageController _ohQueController =Get.put(OhQuePageController());
  void dispose() {
    _ohQueController.isLoading(true);
    super.dispose();
  }
  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages.addAll([
      OhQueList(listIdx: 1, scrollController: widget.scrollController,),
      OhQueList(listIdx: 2, scrollController: widget.scrollController,),
      OhQueList(listIdx: 3, scrollController: widget.scrollController,),
      OhQueList(listIdx: 4, scrollController: widget.scrollController,),
      OhQueList(listIdx: 5, scrollController: widget.scrollController,),
      OhQueList(listIdx: 6, scrollController: widget.scrollController,),
      OhQueList(listIdx: 7, scrollController: widget.scrollController,),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: OhQuePage.pageController,
        itemBuilder: (ctx, idx) => _pages[idx],
      itemCount: _pages.length,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

