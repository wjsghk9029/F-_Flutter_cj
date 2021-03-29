import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/widget/register_page_router.dart';

class OhQuePage extends StatefulWidget {
  final ScrollController scrollController;

  const OhQuePage({this.scrollController});
  @override
  _OhQuePageState createState() => _OhQuePageState();
}

class _OhQuePageState extends State<OhQuePage> {
  PageController _bannerController;
  int _bannerPageNum = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        controller: widget.scrollController,
        itemCount: 10,
          itemBuilder: (ctx, idx) => idx == 0 ? _buildBanner() : _buildList()),
    );
  }

  _buildList() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Container(
        child: Container(
          color: Colors.black12,
          width: 350,
            child: ListTile(
              leading: Container(
                color: Colors.yellowAccent,
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                    ),
                    child: Center(child: Text('레시피')),
                ),
              ),
              title: Container(
                  child: Text('타이틀'),
              ),
              subtitle: Text('서브 설명'),
        )),
      ),
    );
  }

  _buildBanner() {
    return Stack(
      children: [
        Container(
          height: 75,
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 40,
            child: PageRouterWithCircle(
              pageViewLength: 5,
              pageIndex: _bannerPageNum,
            ),
          ),
        ),
        Container(
          color: Colors.black12,
          child: LimitedBox(
            maxHeight: 75,
            child: PageView.builder(
              onPageChanged: (idx){
                setState(() {
                  _bannerPageNum = idx;
                });
              },
              controller: _bannerController,
              itemCount: 5,
              itemBuilder: (ctx, idx) => Center(
                child: Text('$idx'),
              ),)
          ),
        ),
      ],
    );
  }
}
