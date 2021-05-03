import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oftable_flutter/page/login/model/loginclass.dart';
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

class RegisterUtil{

  static Future<bool> idDuplicateCheck(String id) async {
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/check_id'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
        'check_id' : id,
      }
    );
    if (response.statusCode == 200) {
      var data = false;
      jsonDecode(response.body)['error'] == 0 ? data = true : data = false;
      return data;
    }else {
      throw Exception('${response.request.url} ${response.body} = Failed to Post idCheck');
    }
  }

  static String _listToString(List<RegisterCheckBoxData> reg) {
    String str = '';
    for(int i = 0; i < reg.length; i++){
      var text = reg[i].itemId;
      if(reg.last.itemId == reg[i].itemId){
        str += '$text';
        break;
      }
      str += '$text' + '#';
    }
    return str;
  }

  static Future<Login> doRegister({String id, String pw, String name, String phone, String address, String email}) async {
    final response = await http.post(
      Uri.http('210.93.86.79:8080', '/join'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: (<String, String>{
        'id' : id,
        'pw' : pw,
        'name' : name,
        'phone' : phone,
        'address' : address,
        'email' : email,
        'pop' : '${Register().selectedMember.itemId}',
        'spicy_degree' : '${Register().selectedSpicy.itemId}',
        'prefer_flavor' : '${Register().selectedTaste.itemId}',
        'allergy_list' : _listToString(Register().outputAllergyList),
        'taste_list' : _listToString(Register().selectedKeyword),
        'curation' : '${Register().selectedTableCuration.itemId}',
      }),
    );
    print(_listToString(Register().outputAllergyList));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('${response.body} = Failed to post doRegister');
    }
  }

}