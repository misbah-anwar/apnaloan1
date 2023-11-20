import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<Map<String, dynamic>> fetchLoanSeekersData() async {
    final url = Uri.parse(
        'https://flutter-prep-851bd-default-rtdb.firebaseio.com/ApnaLoan/Gowramma\'s%20Passbook.json');
    var response = await http.get(url);
    var loanSeekersData = jsonDecode(response.body);
    print(loanSeekersData);

    return loanSeekersData;
  }

  static Future<Map<String, dynamic>> fetchLoanGiversData() async {
    final url = Uri.parse(
        'https://flutter-prep-851bd-default-rtdb.firebaseio.com/ApnaLoan/Shetty\'s%20Passbook.json');
    var response = await http.get(url);
    var loanGiversData = jsonDecode(response.body);
    print(loanGiversData);

    return loanGiversData;
  }
}
