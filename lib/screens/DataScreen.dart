import 'package:flutter/material.dart';
import 'package:mydotastats/services/networking.dart';
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

class _DataScreenState extends State<DataScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  int wins = 0;
  int loses = 0;
  dynamic matchStuff;
  dynamic profileStuff;
  int matchID;
  bool radiantWin;
  int kills;
  int deaths;
  int assists;
  String iconAddress;
  String profileInfo;
  Color radiantColor = Colors.white;
  Color direColor = Colors.white;
  void reAcquireData() async {
    matchStuff = widget.matchInfo;
    bool isWaiting = true;
    if (isWaiting = true) {
      setState(() {
        matchStuff = null;
        direColor = Colors.white;
        radiantColor = Colors.white;
      });
      matchStuff = await GetData().getPlayerData();
      isWaiting = false;
      if (isWaiting == false) {
        setState(() {
          matchID = matchStuff[0]['match_id'];
          kills = matchStuff[0]['kills'];
          assists = matchStuff[0]['assists'];
          deaths = matchStuff[0]['deaths'];
          if (radiantWin == true) {
            radiantColor = Colors.green;
          } else if (radiantWin == false) {
            direColor = Colors.green;
          } else {
            direColor = Colors.white;
            radiantColor = Colors.white;
          }
        });
      }
    }
  }

  int getWinRate() {
    double winRate = (wins / (wins + loses)) * 100;
    return winRate.toInt();
  }

  Widget winLossCounter() {
    int x = 0;
    wins = 0;
    loses = 0;
    for (x = 1; x <= GetData.noOfMatches; x++) {
      if ((widget.matchInfo[x - 1]['player_slot'] <= 127 &&
              widget.matchInfo[x - 1]['radiant_win'] == true) ||
          (widget.matchInfo[x - 1]['player_slot'] >= 128 &&
              widget.matchInfo[x - 1]['radiant_win'] == false)) {
        wins = wins + 1;
      } else if ((widget.matchInfo[x - 1]['player_slot'] <= 127 &&
              widget.matchInfo[x - 1]['radiant_win'] == false) ||
          (widget.matchInfo[x - 1]['player_slot'] >= 128 &&
              widget.matchInfo[x - 1]['radiant_win'] == true)) {
        loses = loses + 1;
      }
    }
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(
            backgroundColor: Colors.green,
            flex: 2,
            textInfo: Text(
              'Wins',
              style: kLabelTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            cardChild: Text(
              wins.toString(),
              style: kNumberTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
          ),
          ReusableCard(
            backgroundColor: Colors.red,
            flex: 2,
            textInfo: Text(
              'Loses',
              style: kLabelTextStyle.copyWith(fontSize: 12),
            ),
            cardChild: Text(
              loses.toString(),
              style: kNumberTextStyle.copyWith(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Text winOrLose() {
    if ((widget.matchInfo[0]['player_slot'] <= 127 &&
            widget.matchInfo[0]['radiant_win'] == true) ||
        (widget.matchInfo[0]['player_slot'] >= 128 &&
            widget.matchInfo[0]['radiant_win'] == false)) {
      return Text('YOU WON!🐣',
          style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.green));
    } else if ((widget.matchInfo[0]['player_slot'] <= 127 &&
            widget.matchInfo[0]['radiant_win'] == false) ||
        (widget.matchInfo[0]['player_slot'] >= 128 &&
            widget.matchInfo[0]['radiant_win'] == true)) {
      return Text('YOU LOST!😔',
          style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.red));
    } else {
      return Text('Data not found :(');
    }
  }

  void updateUI() {
    setState(() {
      matchStuff = widget.matchInfo;
      profileStuff = widget.profileInfo;
      profileInfo = profileStuff['profile']['personaname'];
      iconAddress = profileStuff['profile']['avatarfull'];
      radiantWin = matchStuff[0]['radiant_win'];
      matchID = matchStuff[0]['match_id'];
      kills = matchStuff[0]['kills'];
      assists = matchStuff[0]['assists'];
      deaths = matchStuff[0]['deaths'];
      if (radiantWin == true) {
        radiantColor = Colors.green;
      } else if (radiantWin == false) {
        direColor = Colors.green;
      } else {
        direColor = Colors.white;
        radiantColor = Colors.white;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1, milliseconds: 80));
    animation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });

    widget.matchInfo != null ? updateUI() : print('No Data');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/dataScreenBackgroundImage.jpg'),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ReusableCard(
                              flex: 1,
                              textInfo: Text(
                                'Hello',
                                style: kLabelTextStyle,
                              ),
                              cardChild: Text(
                                profileInfo != null
                                    ? profileInfo
                                    : 'name goes here',
                                style: kLabelTextStyle.copyWith(fontSize: 15),
                              ),
                            ),
                            ReusableCard(
                                backgroundColor: Colors.grey,
                                flex: 1,
                                cardChild: Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Winrate: ${wins == 0 ? 'nll' : getWinRate()}%',
                                      style: kLabelTextStyle.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                textInfo: Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Welcome to Dota Analyzer!',
                                    style: kLabelTextStyle,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      iconAddress != null
                          ? IconCard(
                              flex: 4,
                              cardChild: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  iconAddress,
                                ),
                              ))
                          : ReusableCard(
                              textInfo: Expanded(flex: 1, child: Text('')),
                              cardChild: Expanded(
                                flex: 5,
                                child: Image.asset(
                                  'images/404.jpg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: matchStuff != null
                          ? winLossCounter()
                          : Container(child: Text('You are offline')),
                    )),
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
                                matchStuff != null
                                    ? matchID.toString()
                                    : 'waiting',
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
                          child: matchStuff != null
                              ? winOrLose()
                              : Text('Waiting'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: radiantColor,
                                    border: Border.all(
                                        color: Colors.black, width: 0.4),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'RADIANT',
                                    style: kLabelTextStyle,
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: direColor,
                                    border: Border.all(
                                        color: Colors.black, width: 0.4),
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
                                cardChild: Text(
                                    matchStuff != null
                                        ? kills.toString()
                                        : 'waiting',
                                    style: kNumberTextStyle),
                                textInfo: Text('KILLS', style: kLabelTextStyle),
                              ),
                              ReusableCard(
                                flex: 3,
                                cardChild: Text(
                                  matchStuff != null
                                      ? deaths.toString()
                                      : 'waiting',
                                  style: kNumberTextStyle,
                                ),
                                textInfo:
                                    Text('DEATHS', style: kLabelTextStyle),
                              ),
                              ReusableCard(
                                flex: 3,
                                cardChild: Text(
                                  matchStuff != null
                                      ? assists.toString()
                                      : 'waiting',
                                  style: kNumberTextStyle,
                                ),
                                textInfo:
                                    Text('ASSISTS', style: kLabelTextStyle),
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
                  flex: 2,
                  cardChild: Expanded(
                    flex: 1000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              'More:',
                              style: kLabelTextStyle,
                            ),
                          ),
                        ),
                        ReusableCard(
                          flex: 3,
                          functionality: () {
                            setState(() {
                              print('ReAcquire button pressed');
                              reAcquireData();
                            });
                          },
                          cardChild: Text(
                            'ReAcquire Data',
                            style: kNumberTextStyle,
                          ),
                          textInfo: Text('Option 2', style: kLabelTextStyle),
                        ),
                        ReusableCard(
                          flex: 3,
                          functionality: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MatchScreen(matchStuff);
                            }));
                          },
                          cardChild: Center(
                            child: Text(
                              'View Recent Matches',
                              style: kNumberTextStyle,
                            ),
                          ),
                          textInfo: Text('Option 3', style: kLabelTextStyle),
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
      ),
    );
  }
}
