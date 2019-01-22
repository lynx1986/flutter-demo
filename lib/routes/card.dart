import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';

class CardDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Demo')),
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.black12,
        ),
        child: buideWidgetItems(context)
      )
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, i) => Divider(),
      itemCount: Constants.PLAYERS.length,
      itemBuilder: (context, i) {
        return Card(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 184.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(child: Image.asset(Constants.PLAYERS[i]['background'], fit: BoxFit.fill)),
                    Positioned(
                      bottom: 16.0, left: 16.0, right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown, alignment: Alignment.bottomLeft,
                        child: Text(Constants.PLAYERS[i]['name'], style: TextStyle(color: Colors.white, fontSize: 20))
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  child: DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          width: 40.0,
                          height: 40.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Image.asset(Constants.PLAYERS[i]['headimg'], fit: BoxFit.fill),
                          )
                        ),
                        Text(Constants.PLAYERS[i]['desc'])
                      ],
                    )
                  )
                  
                )
              ),
              Divider(color: Colors.grey),
              ButtonTheme.bar(
                child: ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      child: Text('分享'),
                      textColor: Colors.blue,
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('发现'),
                      textColor: Colors.blue,
                      onPressed: () {},
                    )
                  ],
                )
              )
            ]
          ),
        );
      },
    );
  }
}