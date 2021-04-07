import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopo/kopo.dart';
import 'package:oftable_flutter/colorsUtil.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';

class RegisterPage4 extends StatefulWidget {
  @override
  _RegisterPage4State createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  final homeTextFieldController = TextEditingController();
  final home2TextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final idTextFieldController = TextEditingController();
  final pwTextFieldController = TextEditingController();
  final pwReTextFieldController = TextEditingController();

  @override
  void dispose() {
    setState(() {
      Register().selectedHomeAdress = homeTextFieldController.text;
      Register().selectedHomeAdress2 = home2TextFieldController.text;
      Register().selectedPhone = phoneTextFieldController.text;
      Register().selectedName = emailTextFieldController.text;
      Register().selectedId = idTextFieldController.text;
      Register().selectedPw = pwTextFieldController.text;
    });
    homeTextFieldController.dispose();
    home2TextFieldController.dispose();
    phoneTextFieldController.dispose();
    emailTextFieldController.dispose();
    idTextFieldController.dispose();
    pwTextFieldController.dispose();
    pwReTextFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    homeTextFieldController.text = Register().selectedHomeAdress;
    home2TextFieldController.text = Register().selectedHomeAdress2;
    phoneTextFieldController.text = Register().selectedPhone;
    emailTextFieldController.text = Register().selectedName;
    idTextFieldController.text = Register().selectedId;
    pwTextFieldController.text = Register().selectedPw;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      child: Container(
        padding: EdgeInsets.only(right: Get.width * 0.05, left: Get.width * 0.05),
        child: ListView(
          children: [
            Row(
              children: [
                _buildTextField(
                  label: '아이디',
                  controller: idTextFieldController,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      minWidth: Get.width* 0.1,
                      height: Get.height * 0.04,
                      onPressed: (){},
                      child: Container(
                          child: Text('중복확인',
                            style: TextStyle(
                              fontFamily: 'NanumGothic',
                              fontSize: Get.height * 0.02,
                              color: Colors.white,
                            ),
                          )
                      ),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            _buildTextField(
              label: '비밀번호',
              labelChild: Icon(Icons.info_outline),
              controller: pwTextFieldController,
            ),
            _buildTextField(
              label: '비밀번호 확인',
              controller: pwReTextFieldController,
            ),
            _buildTextField(
              label: '이메일',
              controller: emailTextFieldController,
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              children: [
                _buildTextField(
                  label: '연락처',
                  controller: idTextFieldController,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      minWidth: Get.width* 0.1,
                      height: Get.height * 0.04,
                      onPressed: (){},
                      child: Container(
                          child: Text('본인인증',
                            style: TextStyle(
                              fontFamily: 'NanumGothic',
                              fontSize: Get.height * 0.02,
                              color: Colors.white,
                            ),
                          )
                      ),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            _buildTextField(
              label: '배송지',
              labelChild: CupertinoButton(child: Text('배송지 찾기', style: TextStyle(fontFamily: FontsUtil.nanumGothic),), onPressed: () => _findAdress()),
              controller: homeTextFieldController,
              width: Get.width,
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 5
                    )
                ),
              ),
              child: TextField(
                controller: home2TextFieldController,
              ),
            ),
          ],
          shrinkWrap: true,
        ),
      ),
    );
  }

  Widget _buildTextField({String label, Widget labelChild, TextEditingController controller, double width}){
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(label, style: TextStyle(fontSize: Get.height * 0.025, fontFamily: FontsUtil.nanumGothic, fontWeight: FontWeight.w800),),
                ),
                Container(
                  padding: EdgeInsets.only(left: 3),
                  child: labelChild ?? Padding(padding: EdgeInsets.zero),
                )
              ],
            ),
          ),
          Container(
            width: width ?? Get.width * 0.5,
            height: Get.height * 0.05,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 5
                  )
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  _findAdress() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => Kopo(),
      ),
    );
    setState(() {
      homeTextFieldController.text = model.address + ' ' + model.buildingName;
      home2TextFieldController.text = model.apartment == 'Y' ? '아파트' : '' + ' ' + model.zonecode;
    });
  }
}
