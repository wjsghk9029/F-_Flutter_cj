import 'package:flutter/material.dart';
import 'package:oftable_flutter/page/register/Widget/icon_checkbox.dart';
import 'package:oftable_flutter/page/register/Widget/string_checkbox.dart';
import 'package:oftable_flutter/page/register/singleton/register_singleton.dart';
import 'package:oftable_flutter/page/register/singleton/register_utility.dart';


class RegisterPage3 extends StatefulWidget {

  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  RegisterPage3Utility _util;
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  final pwReTextFieldController = TextEditingController();

  @override
  void dispose() {
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
    pwReTextFieldController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _util = RegisterPage3Utility();
   // _util.insertMapText();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: ListView(
        children: [
          _tableCuration(),
          Padding(padding: EdgeInsets.only(top: 10)),
          _keyword(),
          Padding(padding: EdgeInsets.only(top: 10)),
          _registerId(),
          Padding(padding: EdgeInsets.only(top: 10)),
          _registerPw(),
        ],
      ),
    );
  }
//#region 테이블큐레이션
  _tableCuration() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('주 몇번의 테이블 큐레이션이 필요하세요', style: TextStyle(fontSize: 20),),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Register().tableCurationList.length,
                childAspectRatio: 1.0,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount:Register().tableCurationList.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return _buildTableCuration(context, index);
              }
          ),
        ],
      ),
    );
  }

  _buildTableCuration(BuildContext context, int index) {
    return IconCheckBox(
      size: 40,
      iconSize: 30,
      isChecked: Register().tableCurationList[index].isChecked,
      iconAppear: true,
      onPressed: (){
        setState(() {
          _util.resetCheckBox(Register().tableCurationList);
          Register().tableCurationList[index].isChecked = !Register().tableCurationList[index].isChecked;
          Register().selectedTableCuration = Register().tableCurationList[index].registerCheckBoxData;
        });
      },
    );
  }

  //#endregion

  //#region 키워드
  _keyword() {
    return Container(
      child: Column(
        children: [
          Register().outputTableList.length > 0 ? _keyword1Child() :
          Padding(padding: EdgeInsets.only(top: 10)),
          Register().outputTableList.length > 1 ? _keyword2Child() :
          Padding(padding: EdgeInsets.only(top: 10)),

        ],
      ),
    );
  }


  _keyword1Child() {
    var data = Register().outputTableList[0];
    var name = data.itemName;
    var itemId = data.itemId;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            alignment: Alignment.centerLeft,
            child: Text('$name의 세부 관심 키워드를 골라주세요', style: TextStyle(fontSize: 20),),
          ),
          Container(
            width: 300,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: _util.keywordMap[itemId].length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return _buildKeyword(context, index, itemId);
                }
            ),
          ),
        ],
      ),
    );
  }

  _buildKeyword(BuildContext context, int index, int itemId) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: _util.keywordMap[itemId][index].isChecked,
      text: Text(_util.keywordMap[itemId][index].registerCheckBoxData.itemName, style: TextStyle(fontSize: 15, color: Colors.white), ),
      onPressed: (){
        setState(() {
          if(_util.keywordMap[itemId][index].isChecked) {
            Register().selectedKeyword1.remove(_util.keywordMap[itemId][index].registerCheckBoxData);
          } else {
            Register().selectedKeyword1.add(_util.keywordMap[itemId][index].registerCheckBoxData);
          }
          _util.keywordMap[itemId][index].isChecked = !_util.keywordMap[itemId][index].isChecked;
        });
      },
      borderRadius: BorderRadius.circular(10),
    );
  }

  _keyword2Child() {
    var data = Register().outputTableList[1];
    var name = data.itemName;
    var itemId = data.itemId;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            alignment: Alignment.centerLeft,
            child: Text('$name의 세부 관심 키워드를 골라주세요', style: TextStyle(fontSize: 20),),
          ),
          Container(
            width: 300,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: _util.keywordMap[itemId].length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return _buildKeyword2(context, index, itemId);
                }
            ),
          ),
        ],
      ),
    );
  }

  _buildKeyword2(BuildContext context, int index, int itemId) {
    return StringCheckBox(
      iconAppear: true,
      isChecked: _util.keywordMap[itemId][index].isChecked,
      text: Text(_util.keywordMap[itemId][index].registerCheckBoxData.itemName, style: TextStyle(fontSize: 15, color: Colors.white), ),
      onPressed: (){
        setState(() {
          if(_util.keywordMap[itemId][index].isChecked) {
            Register().selectedKeyword2.remove(_util.keywordMap[itemId][index].registerCheckBoxData);
          } else {
            Register().selectedKeyword2.add(_util.keywordMap[itemId][index].registerCheckBoxData);
          }
          _util.keywordMap[itemId][index].isChecked = !_util.keywordMap[itemId][index].isChecked;
        });
      },
      borderRadius: BorderRadius.circular(10),
    );
  }
  //#endregion

  _registerId() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('아이디', style: TextStyle(fontSize: 20),),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: idTextFieldController,
              decoration: InputDecoration(
                hintText: '아이디',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _registerPw() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('비밀번호', style: TextStyle(fontSize: 20),),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: pwTextFieldController,
              decoration: InputDecoration(
                hintText: '비밀번호',
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: pwReTextFieldController,
              decoration: InputDecoration(
                hintText: '비밀번호 확인',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }



}
