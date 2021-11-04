import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'info2.dart';
import 'package:share/share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Info extends StatelessWidget {
  double largura;

  Widget build(BuildContext context) {
    //Ajuste da largura dos botões
    if (MediaQuery.of(context).size.width <= 320) {
      largura = 200;
    } else if (MediaQuery.of(context).size.width <= 360) {
      largura = 250;
    } else {
      largura = 300;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF77dd77),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).info,
                              style: Theme.of(context).textTheme.headline6,
                            ),

                            //equipe
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Info2(
                                                        index: 1,
                                                      )));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.people,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .time,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),

                            //bibliografia
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Info2(
                                                        index: 2,
                                                      )));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.book,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .bibliografia,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),

                            //contato
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          final Email email = Email(
                                            subject: 'BovCria',
                                            recipients: ['tecbovapp@gmail.com'],
                                            isHTML: false,
                                          );
                                          FlutterEmailSender.send(email);
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.email,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .contato,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),

                            //compartilhar app
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 90,
                                    width: largura,
                                    child: FlatButton(
                                        color: Colors.lightGreen,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        splashColor: Colors.lightGreenAccent,
                                        onPressed: () {
                                          Share.share(
                                              AppLocalizations.of(context)
                                                  .share);
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.share,
                                                size: 28,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)
                                                    .share2,
                                                style:
                                                    TextStyle(fontSize: 22.0),
                                              )
                                            ],
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
