import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:mydotastats/utilities/constants.dart';

class GetData {
  GetData({this.playerID});
  String playerID;
  dynamic myPlayerData;
  dynamic profileData;
  static int noOfMatches = 100;

  Future<dynamic> getPlayerData() async {
    print('starting connection');
    http.Response response = await http.get(
        'https://api.opendota.com/api/players/${playerID == null ? mySteamID : playerID}/matches?limit=$noOfMatches');
    if (response.statusCode == 200) {
      myPlayerData = convert.jsonDecode(response.body);
      print('Match Data obtained');
      print(myPlayerData[0]['kills']);
      return myPlayerData;
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<dynamic> getPlayerProfileData() async {
    print('Player Profile call started');
    http.Response response = await http.get(
        'https://api.opendota.com/api/players/${playerID == null ? mySteamID : playerID}');
    if (response.statusCode == 200) {
      profileData = convert.jsonDecode(response.body);
      print('Profile Data obtained');
      return profileData;
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
