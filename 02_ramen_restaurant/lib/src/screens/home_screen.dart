import 'package:flutter/material.dart';
import 'package:ramen_restaurant/src/data/constants.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Color(0xFFf2e8da),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
        title: Text(
          'TODAY\'S SPECIAL',
          style: TextStyle(fontSize: 18.0, letterSpacing: 1.0),
        ),
      ),
      body: Stack(
        children: <Widget>[
          //main background
          Column(children: [
            Expanded(
              child: Container(
                color: Color(0xFFf2e8da),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xFFffffff),
              ),
            ),
          ]),

          Center(
            child: new ItemCard(),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: [
        //===============================
        //shadow
        //===============================
        Container(
          padding: EdgeInsets.only(top: 60.0),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.9,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(0.0, 40.0),
                spreadRadius: 15.0,
                blurRadius: 40.0,
              )
            ],
          ),
        ),
        //====================================================
        //Card
        //=================================================
        buildCard(context),
        Positioned(
          // transform: Matrix4.identity()..translate(0.0, 30.0),
          child: buildButton(),
          bottom: -30.0,
        ),

        Transform(
          child: Image.asset(
            "assets/images/jollof.png",
            height: 100.0,
          ),
          transform: Matrix4.identity()..translate(0.0, -50.0),
        ),
        //buttton
      ],
    );
  }

  Widget buildCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.0),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 150.0,
            child: Column(
              children: <Widget>[
                Text(
                  "JOLLOF",
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, height: 1.5),
                ),
                Text(
                  "RICE",
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, height: 1.5),
                ),
              ],
            ),
          ),
          Container(
            width: 90.0,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: 7.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30.0)),
            child: Text(
              "10",
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {},
              ),
              Container(
                alignment: Alignment.center,
                height: 60.0,
                width: 85.0,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.symmetric(
                  vertical: 7.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.grey, width: 2.0),
                  color: Colors.transparent,
                ),
                child: Text(
                  "100",
                  style: TextStyle(fontSize: 18.0, color: Colors.grey.shade900),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton() {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        print("Mona");
      },
      child: Container(
        height: 60.0,
        width: 85.0,
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
