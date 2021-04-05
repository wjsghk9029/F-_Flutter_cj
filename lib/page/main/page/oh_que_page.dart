import 'package:flutter/material.dart';

import 'oh_que/oh_que_list.dart';

class OhQuePage extends StatefulWidget {
  final ScrollController scrollController;
  const OhQuePage({this.scrollController});
  @override
  _OhQuePageState createState() => _OhQuePageState();
}

class _OhQuePageState extends State<OhQuePage> {
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
        itemBuilder: (ctx, idx) => _pages[idx],
      itemCount: _pages.length,
    );
  }
}

