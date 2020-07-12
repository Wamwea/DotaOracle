import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.cardChild,
      this.textInfo,
      this.flex,
      this.functionality,
      this.backgroundColor});
  final Widget cardChild;
  final Widget textInfo;
  final int flex;
  final Function functionality;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: functionality,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.orangeAccent, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textInfo != null ? textInfo : null,
              cardChild != null
                  ? cardChild
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  IconCard({
    @required this.cardChild,
    this.flex,
  });
  final Widget cardChild;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: cardChild,
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  NumberCard(this.cardData);
  final String cardData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            cardData,
            style: kNumberTextStyle.copyWith(color: Colors.deepOrangeAccent),
          ),
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  DataCard({
    this.functionality,
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.flex,
  });
  final int flex;
  final String data1;
  final String data2;
  final String data3;
  final String data4;
  final Function functionality;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NumberCard(data1),
          NumberCard(data2),
          NumberCard(data3),
          NumberCard(data4)
        ],
      ),
    );
  }
}
