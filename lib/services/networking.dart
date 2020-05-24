import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const mySteamID = 286066396;

class GetResponse {
  dynamic myPlayerData;
  dynamic myLatestMatchData;
  dynamic profileData;
  Future<dynamic> getPlayerData() async {
    http.Response response = await http
        .get('https://api.opendota.com/api/players/$mySteamID/recentMatches');
    if (response.statusCode == 200) {
      print('call successful');
      myPlayerData = convert.jsonDecode(response.body);
      return myPlayerData;
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<dynamic> getPlayerProfileData() async {
    http.Response response =
        await http.get('https://api.opendota.com/api/players/$mySteamID');
    if (response.statusCode == 200) {
      print('profile found successfully');
      profileData = convert.jsonDecode(response.body);
      return profileData;
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
