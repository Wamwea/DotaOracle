import 'package:flutter/material.dart';
import 'package:mydotastats/screens/ProfileScreen.dart';
import 'package:mydotastats/utilities/Cards.dart';
import '../utilities/constants.dart';
import 'package:mydotastats/screens/MatchScreen.dart';

class DataScreen extends StatefulWidget {
  DataScreen({this.matchInfo, this.profileInfo});
  final dynamic matchInfo;
  final dynamic profileInfo;
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  dynamic matchStuff;
  dynamic profileStuff;
  int matchID;
  bool radiantWin;
  int kills;
  int deaths;
  int assists;
  String iconAddress;
  String profileName;
  Color radiantColor = kCardColor;
  Color direColor = kCardColor;
  void updateUI() {
    setState(() {
      profileStuff = widget.profileInfo;
      matchStuff = widget.matchInfo;
      profileName = profileStuff['profile']['personaname'];
      iconAddress = profileStuff['profile']['avatarfull'];
      radiantWin = matchStuff[0]['radiant_win'];
      matchID = matchStuff[0]['match_id'];
      kills = matchStuff[0]['kills'];
      assists = matchStuff[0]['assists'];
      deaths = matchStuff[0]['deaths'];
      if (radiantWin == true) {
        radiantColor = Colors.green;
      } else {
        direColor = Colors.green;
      }
    });
  }

  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCardColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ReusableCard(
                              flex: 2,
                              cardChild: Text(
                                ' $profileName',
                                style: kNumberTextStyle,
                              ),
                              textInfo: Text(
                                'HELLO!',
                                style: kLabelTextStyle,
                              )),
                          ReusableCard(
                              flex: 1,
                              cardChild: Text(''),
                              textInfo: Text(
                                'Welcome to Dota Analyzer!',
                                style: kLabelTextStyle,
                              )),
                        ],
                      ),
                    ),
                    ReusableCard(
                      flex: 4,
                      cardChild: Image(
                        image: NetworkImage(iconAddress),
                        fit: BoxFit.fill,
                      ),
                      textInfo: Text(
                        'ICON:',
                        style: kLabelTextStyle,
                      ),
                    )
                  ],
                ),
              ),
              ReusableCard(
                flex: 3,
                cardChild: Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'RECENT MATCH STATS',
                          style: kLabelTextStyle,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'MATCH ID: ',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              '$matchID',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: radiantColor,
                                  border: Border.all(
                                      color: Colors.white, width: 0.8),
                                ),
                                child: Center(
                                    child: Text(
                                  'RADIANT',
                                  style: kLabelTextStyle,
                                )),
                              ),
                            ),
                            VerticalDivider(
                              width: 5,
                              thickness: 100,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: direColor,
                                  border: Border.all(
                                      color: Colors.white, width: 0.8),
                                ),
                                child: Center(
                                    child: Text(
                                  'DIRE',
                                  style: kLabelTextStyle,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableCard(
                              flex: 3,
                              cardChild:
                                  Text('$kills', style: kNumberTextStyle),
                              textInfo: Text('KILLS', style: kLabelTextStyle),
                            ),
                            ReusableCard(
                              flex: 3,
                              cardChild: Text(
                                '$deaths',
                                style: kNumberTextStyle,
                              ),
                              textInfo: Text('DEATHS', style: kLabelTextStyle),
                            ),
                            ReusableCard(
                              flex: 3,
                              cardChild: Text(
                                '$assists',
                                style: kNumberTextStyle,
                              ),
                              textInfo: Text('ASSISTS', style: kLabelTextStyle),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                textInfo: Expanded(
                  flex: 1,
                  child: Text(
                    '',
                    style: kLabelTextStyle,
                  ),
                ),
              ),
              ReusableCard(
                flex: 3,
                cardChild: Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'More:',
                          style: kLabelTextStyle,
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Row(
                          children: <Widget>[
                            ReusableCard(
                              functionality: () {
                                setState(() {
                                  deaths = 0;
                                });
                              },
                              flex: 1,
                              cardChild: Text(
                                'Reset values',
                                style: kNumberTextStyle,
                              ),
                              textInfo:
                                  Text('Option 1:', style: kLabelTextStyle),
                            ),
                            ReusableCard(
                              flex: 1,
                              functionality: () {
                                setState(() {
                                  updateUI();
                                });
                              },
                              cardChild: Text(
                                'ReAcquire Data',
                                style: kNumberTextStyle,
                              ),
                              textInfo:
                                  Text('Option 2', style: kLabelTextStyle),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Row(
                          children: <Widget>[
                            ReusableCard(
                              flex: 1,
                              functionality: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfileScreen();
                                }));
                              },
                              cardChild: Center(
                                child: Text(
                                  'Profile Info',
                                  style: kNumberTextStyle,
                                ),
                              ),
                              textInfo:
                                  Text('Option 3', style: kLabelTextStyle),
                            ),
                            ReusableCard(
                              flex: 1,
                              functionality: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MatchScreen();
                                }));
                              },
                              cardChild: Center(
                                child: Text(
                                  'Recent Matches',
                                  style: kNumberTextStyle,
                                ),
                              ),
                              textInfo:
                                  Text('Option 4', style: kLabelTextStyle),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                textInfo: Expanded(
                  flex: 1,
                  child: Text(
                    '',
                    style: kLabelTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
