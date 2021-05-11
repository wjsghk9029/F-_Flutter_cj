import 'package:http/http.dart' as http;
import 'package:oftable_flutter/page/register/controller/register_singleton.dart';
import 'package:oftable_flutter/page/register/model/register_class.dart';

class RegisterUtil{

  static Future<http.Response> idDuplicateCheck(String id) async {
    return await http.post(
      Uri.http('210.93.86.79:8080', '/check_id'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
        'check_id' : id,
      }
    );
  }

  static String listToString(List<RegisterCheckBoxData> reg) {
    String str = '';
    for(int i = 0; i < reg.length; i++){
      if(reg.last.itemId == reg[i].itemId){
        str += '${reg[i].itemId}';
        break;
      }
      str += '${reg[i].itemId}' + '#';
    }
    return str;
  }

  static Future<http.Response> doRegister({String id, String pw, String name, String phone, String address, String email}) async {
    return http.post(
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
        'allergy_list' : listToString(Register().outputAllergyList),
        'taste_list' : listToString(Register().selectedKeyword),
        'curation' : '${Register().selectedTableCuration.itemId}',
      }),
    );
  }

}