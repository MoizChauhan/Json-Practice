import 'package:SaturnCube/Model/party.dart';
import 'package:http/http.dart';

class PartyList {
  bool isdataFound;
  List<Party> partyList = [];
  int getlenght() {
    return partyList.length;
  }

  dynamic list;

  // ignore: missing_return
  Future<List<Party>> getList() async {
    String url = 'https://jsonplaceholder.typicode.com/users';

    try {
      Response response = await get(url);
      print('prdouct response $response');
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        isdataFound = true;
        print(response.body);
        partyList = partyFromJson(response.body);
        print(partyList);
        return partyList;
      } else {
        isdataFound = false;
        return partyList;
      }
    } catch (e) {
      print(e);
    }
  }
}
