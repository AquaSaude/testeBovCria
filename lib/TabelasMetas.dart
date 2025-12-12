import 'package:flutter/material.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class TabelasMetas extends StatelessWidget {
  TabelasMetas({this.index});

  final index;

  Card? tabela(index, context) {
    if (index == 1) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 20, 5.0, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.tabelasmetas1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.categoriataxas,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.novilhameses,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.novilhameses1,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.vacamaior,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.taxaconcept,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("85-90%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("90-95%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("90-95%"),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.taxaParto,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("83-88%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("85-93%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("85-93%"),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.taxaDesmame,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("86%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("91%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text("91%"),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .relacaoVacaBezerro,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(">40%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(">40%"),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(">40%"),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ])));
    } else if (index == 2) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 20, 5.0, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.indicesGeraisRebanho,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.caractTaxas,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "Ideal",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.satisfatorio,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.alerta,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .idadePrimeiroParto,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .vinteQuatroMeses,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .vinteCincoTrintaSeis,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .acimaDeTrintaSeis,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.intervalo,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .trezentosSessentaCincoDias,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .trezentosSessCincoTrezNovCinco,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .acimaTrezSessCinco,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .taxaAnualMortGeral,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "5%",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.ateOito,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.acimaOito,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .taxaAnualMorteBezerros,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "2%",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "-",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.acimaDois,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.distocias,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "5%%",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    "-",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.acimaCinco,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ])));
    } else if (index == 3) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 20, 5.0, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.tabela3,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Table(
                      columnWidths: {0: FractionColumnWidth(.27)},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      children: [
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.caractReprod,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "USA",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "Amplitude",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    AppLocalizations.of(context)!.alvoIndustrial,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    AppLocalizations.of(context)!.br,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "Amplitude",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    AppLocalizations.of(context)!.alvoIndustrial,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.novilhasIdade,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    AppLocalizations.of(context)!.mediaQuatorze,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    AppLocalizations.of(context)!.mediaDezoito,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.idadePub,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "12-16",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "14",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "12-18",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "16",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.pesoPub,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "272-362",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "317",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "260-360",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "300",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .escoreTratoRepro,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "4-5",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "5",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "4-5",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "5",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .machosPeriodoEsc,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "32-40",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "36",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "26-40",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "32",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .pesoNascBezerro,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.filhosVacas,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "34-43",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "38",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "25-40",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "32",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .bezerroNovilhas,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "27-36",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "32",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "23-38",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "30",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.condCorpParto,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "4-6",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "5",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "(1-5) 3-4",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "3.5",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.intPosParto,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "55-95",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "75",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "55-95",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "75",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.duracaoEstacao,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "45-90",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "65",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "45-120",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "75",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    AppLocalizations.of(context)!.longVaca,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "9-15",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "12",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                          TableCell(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                    "6-20",
                                    textAlign: TextAlign.center,
                                  )),
                                  Flexible(
                                      child: Text(
                                    "12",
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            ],
                          )),
                        ]),
                      ],
                    ),
                  ])));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF77dd77),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Center(
                child: Column(
                  children:[
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.metasRebanho,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            tabela(this.index, context)!,
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                                foregroundColor: WidgetStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back),
                                      Text(AppLocalizations.of(context)!.voltar),
                                    ],
                                  )
                                ],
                              ),
                            )

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
