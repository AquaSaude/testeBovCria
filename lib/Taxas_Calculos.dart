import 'package:bovcria/Taxas_Calculos_2.dart';
import 'package:bovcria/dicas.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Taxas_Calculos extends StatefulWidget {
  final index;

  const Taxas_Calculos({Key key, this.index}) : super(key: key);

  @override
  _Taxas_CalculosState createState() => _Taxas_CalculosState();
}

class _Taxas_CalculosState extends State<Taxas_Calculos> {
  //Variáveis uteis
  TextEditingController _idadePrimeiroPartoController = TextEditingController();
  TextEditingController _femeasGestantesController = TextEditingController();
  TextEditingController _femeasInseminadasController = TextEditingController();
  TextEditingController _femeasParidasController = TextEditingController();
  String _myActivity = "";
  DateTime _ultimoParto;
  DateTime _partoAnterior;
  String _ultimoPartoFormatado = "";
  String _partoAnteriorFormatado = "";
  Card _cardResultado = Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "RESULTADO",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Divider(
                thickness: 0,
              ),
              Text("Aguardando parâmetros para cálculo.")
            ]),
      ));

  //Função que retorna o card com a taxa selecionada na tela anterior.
  Card taxas(index, context) {
    //1 - Idade do primeiro parto
    //2 - Taxas de mortalidade
    //3 - Intervalo entre partos
    //4 - Taxa de concepção
    //5 - Taxa de parição
    //6 - Taxas de desmame
    //7 - Taxas de produção

    if (index == 1) {
      void _resultado() {
        String idadeFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_idadePrimeiroPartoController.text.contains(",")) {
          idadeFormatado =
              _idadePrimeiroPartoController.text.replaceAll(",", ".");
        } else {
          idadeFormatado = _idadePrimeiroPartoController.text;
        }

        double idade = double.tryParse(idadeFormatado);

        if (idade == null) {
          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(AppLocalizations.of(context).erroInformeValor)
                      ]),
                ));
          });
        } else {
          if (idade <= 24) {
            setState(() {
              _cardResultado = Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("IDADE IDEAL PARA SISTEMAS INTENSIVOS"),
                          Text("\nVeja orientações em:"),
                          FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TabelasMetas(index: 2)));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.tableLarge),
                                    Flexible(
                                      child: Text(
                                        "Índices gerais do rebanho de cria",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dicas()));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.lightbulbOnOutline),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .dicasManejo,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                  ));
            });
          } else if (idade <= 36) {
            setState(() {
              _cardResultado = Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("IDADE SATISFATÓRIA"),
                          Text("\nVeja orientações em:"),
                          FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TabelasMetas(index: 2)));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.tableLarge),
                                    Flexible(
                                      child: Text(
                                        "Índices gerais do rebanho de cria",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dicas()));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.lightbulbOnOutline),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .dicasManejo,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                  ));
            });
          } else {
            setState(() {
              _cardResultado = Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).alerta,
                            style: TextStyle(
                                color: Colors.red.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                          ),
                          Text("\nVeja orientações em:"),
                          FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TabelasMetas(index: 2)));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.tableLarge),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .indicesGeraisRebCria,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dicas()));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.lightbulbOnOutline),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .dicasManejo,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                  ));
            });
          }
        }
      }

      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).idade,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                        "Um dos  principais fatores de desempenho das fêmeas no rebanho de cria é a idade ao primeiro parto."),
                    Text(
                      "\nQual é a idade (em meses) do primeiro parto de suas fêmeas?",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Idade em meses"),
                      /*onSubmitted: (String e){
                        print("Texto digitado: "+e);
                      },*/
                      controller: _idadePrimeiroPartoController,
                    ),
                    RaisedButton(
                      shape: StadiumBorder(),
                      child: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.send),
                            Text(" Enviar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _resultado();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: _cardResultado,
                    )
                  ])));
    } else if (index == 2) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).motalidade,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    FlatButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taxas_Calculos_2(
                                      index: 1,
                                    )));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.chartLine),
                              Flexible(
                                child: Text(
                                  AppLocalizations.of(context)
                                      .taxaGeralMortAnualRabanho,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taxas_Calculos_2(
                                      index: 2,
                                    )));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.chartLine),
                              Flexible(
                                child: Text(
                                  "Taxa anual de mortalidade de bezerros até desmama",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ])));
    } else if (index == 3) {
      void _resultado() {
        if (_partoAnterior == null || _ultimoParto == null) {
          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "ERRO!:",
                          style: TextStyle(
                              color: Colors.red.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "\n• Você deve informar a data do último parto e do parto anterior para obter o resultado!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ]),
                ));
          });
        } else {
          final differenceInDays =
              _ultimoParto.difference(_partoAnterior).inDays;

          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "RESULTADO:",
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "\n• Seu resultado é " +
                              differenceInDays.toString() +
                              " dias.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "\n• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 2 - Índices gerais do rebanho de cria.",
                          textAlign: TextAlign.justify,
                        ),
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TabelasMetas(index: 2)));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(MdiIcons.tableLarge),
                                  Flexible(
                                    child: Text(
                                      "Índices gerais do rebanho de cria",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                ));
          });
        }
      }

      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "INTERVALO ENTRE PARTOS",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "\nO intervalo entre partos é uma importante ferramenta para avaliar o desempenho do seu rebanho de cria, incluíndo seleção genética, manejos nutricional e sanitário e o gerenciamento geral da propriedade. A meta é que a fêmea tenha um bezerro por ano, ou seja repita cria todos os anos.",
                      textAlign: TextAlign.justify,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "\nSelecione uma das categorias abaixo:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    DropDownFormField(
                      titleText: 'Categoria',
                      hintText: 'Selecione uma das categorias',
                      required: true,
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Novilhas de 13-24 meses",
                          "value": "1",
                        },
                        {
                          "display": "Novilhas de 25-36 meses",
                          "value": "2",
                        },
                        {
                          "display": "Vacas > 36 meses",
                          "value": "3",
                        },
                        {
                          "display": "Cálculo geral",
                          "value": "4",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                    Text("\nSelecione a data do ultimo parto"),
                    RaisedButton(
                      color: Colors.lightGreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text(_ultimoPartoFormatado == ""
                              ? 'Selecione uma data'
                              : _ultimoPartoFormatado),
                        ],
                      ),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: _ultimoParto == null
                                    ? DateTime.now()
                                    : _ultimoParto,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100))
                            .then((date) {
                          setState(() {
                            _ultimoParto = date;
                            _ultimoPartoFormatado =
                                DateFormat('dd/MM/yyyy').format(_ultimoParto);
                          });
                        });
                      },
                    ),
                    Text("Selecione a data do parto anterior"),
                    RaisedButton(
                      color: Colors.lightGreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text(_partoAnteriorFormatado == ""
                              ? 'Selecione uma data'
                              : _partoAnteriorFormatado),
                        ],
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: _partoAnterior == null
                              ? _ultimoParto
                              : DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: _partoAnterior == null
                              ? _ultimoParto
                              : DateTime.now(),
                        ).then((date) {
                          setState(() {
                            _partoAnterior = date;
                            _partoAnteriorFormatado =
                                DateFormat('dd/MM/yyyy').format(_partoAnterior);
                          });
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    RaisedButton(
                      shape: StadiumBorder(),
                      child: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.send),
                            Text(" Enviar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        _resultado();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: _cardResultado,
                    )
                  ])));
    } else if (index == 4) {
      void _resultado(String categoria) {
        String femeasGestantesFormatado = "";
        String femeasInseminadasFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_femeasGestantesController.text.contains(",")) {
          femeasGestantesFormatado =
              _femeasGestantesController.text.replaceAll(",", ".");
        } else {
          femeasGestantesFormatado = _femeasGestantesController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_femeasInseminadasController.text.contains(",")) {
          femeasInseminadasFormatado =
              _femeasInseminadasController.text.replaceAll(",", ".");
        } else {
          femeasInseminadasFormatado = _femeasInseminadasController.text;
        }

        int femeasGestantes = int.tryParse(femeasGestantesFormatado);
        int femeasInseminadas = int.tryParse(femeasInseminadasFormatado);

        if (femeasGestantes == null ||
            femeasGestantes < 0 ||
            femeasInseminadas == null ||
            femeasInseminadas <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (femeasGestantes == null || femeasGestantes < 0) {
            mensagem = mensagem +
                "\n• Número de fêmeas gestantes: Utilize valores maiores ou iguais a zero e números inteiros.";
          }
          if (femeasInseminadas == null || femeasInseminadas <= 0) {
            mensagem = mensagem +
                "\n• Número de fêmeas inseminadas ou acasaladas: Utilize valores maiores que 0 e números inteiros.";
          }
          if (categoria == "") {
            mensagem = mensagem +
                "\n• Categoria: Selecione uma das categorias listadas acima!";
          }

          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          mensagem,
                          style: TextStyle(
                              color: Colors.red.withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ]),
                ));
          });
        } else {
          //Fórmula:  Nº de fêmeas gestantes x 100 Nº fêmeas inseminadas ou cobertas

          double resultado = (femeasGestantes * 100) / femeasInseminadas;
          String cat = "";

          if (categoria == "1") {
            cat = "Novilhas de 13-24 meses";
          } else if (categoria == "2") {
            cat = "Novilhas de 25-36 meses";
          } else if (categoria == "3") {
            cat = "Vacas > 36 meses";
          } else {
            cat = "Cálculo geral";
          }

          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Resultado",
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "• O seu resultado é: " +
                              resultado.toStringAsPrecision(4) +
                              "%\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Categoria selecionada: " + cat + "\n",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 1 - Metas para os índices reprodutivos conforme categoria animal.\n"
                          "• Veja dicas de manejo para melhorar o desempenho.",
                          textAlign: TextAlign.justify,
                        ),
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TabelasMetas(index: 1)));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(MdiIcons.tableLarge),
                                  Flexible(
                                    child: Text(
                                      "Metas para os índices reprodutivos conforme categoria animal",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dicas()));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(MdiIcons.lightbulbOnOutline),
                                  Flexible(
                                    child: Text(
                                      "Dicas de manejo",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                ));
          });
        }
      }

      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "TAXA DE CONCEPÇÃO",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "Esta taxa representa o resultado da adoção de técnicas relacionadas com fertilidade das fêmeas, manejos nutricionais e sanitários e gerenciamento geral da propriedade.",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nÉ importante que você calcule as taxas por categoria de fêmeas, assim será possível identificar qual delas necessita  melhores ajustes de manejo",
                      textAlign: TextAlign.justify,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "\nSelecione uma das categorias abaixo:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    DropDownFormField(
                      titleText: 'Categoria',
                      hintText: 'Selecione uma das categorias',
                      required: true,
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Novilhas de 13-24 meses",
                          "value": "1",
                        },
                        {
                          "display": "Novilhas de 25-36 meses",
                          "value": "2",
                        },
                        {
                          "display": "Vacas > 36 meses",
                          "value": "3",
                        },
                        {
                          "display": "Cálculo geral",
                          "value": "4",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                    Text(
                      "\nInforme o número de fêmeas gestantes:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de fêmeas gestantes:"),
                      controller: _femeasGestantesController,
                    ),
                    Text(
                      "\nInforme o número de fêmeas inseminadas ou acasaladas:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText:
                              "Número de fêmeas inseminadas ou acasaladas:"),
                      controller: _femeasInseminadasController,
                    ),
                    RaisedButton(
                      shape: StadiumBorder(),
                      child: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.send),
                            Text(" Enviar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _resultado(_myActivity);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: _cardResultado,
                    )
                  ])));
    } else if (index == 5) {
      void _resultado(String categoria) {
        String femeasGestantesFormatado = "";
        String femeasParidasFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_femeasGestantesController.text.contains(",")) {
          femeasGestantesFormatado =
              _femeasGestantesController.text.replaceAll(",", ".");
        } else {
          femeasGestantesFormatado = _femeasGestantesController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_femeasParidasController.text.contains(",")) {
          femeasParidasFormatado =
              _femeasParidasController.text.replaceAll(",", ".");
        } else {
          femeasParidasFormatado = _femeasParidasController.text;
        }

        int femeasGestantes = int.tryParse(femeasGestantesFormatado);
        int femeasParidas = int.tryParse(femeasParidasFormatado);

        if (femeasParidas == null ||
            femeasParidas < 0 ||
            femeasGestantes == null ||
            femeasGestantes <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (femeasParidas == null || femeasParidas < 0) {
            mensagem = mensagem +
                "\n• Número de fêmeas paridas: Utilize valores maiores ou iguais a zero e números inteiros (sem ponto ou vírgula).";
          }
          if (femeasGestantes == null || femeasGestantes <= 0) {
            mensagem = mensagem +
                "\n• Número de fêmeas gestantes: Utilize valores maiores que 0 e números inteiros (sem ponto ou vírgula).";
          }
          if (categoria == "") {
            mensagem = mensagem +
                "\n• Categoria: Selecione uma das categorias listadas acima!";
          }

          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          mensagem,
                          style: TextStyle(
                              color: Colors.red.withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ]),
                ));
          });
        } else {
          //Fórmula:  Nº de fêmeas PARIDAS  100 /número de fêmeas gestantes

          double resultado = (femeasParidas * 100) / femeasGestantes;
          String cat = "";

          if (categoria == "1") {
            cat = "Novilhas de 13-24 meses";
          } else if (categoria == "2") {
            cat = "Novilhas de 25-36 meses";
          } else if (categoria == "3") {
            cat = "Vacas > 36 meses";
          } else {
            cat = "Cálculo geral";
          }

          setState(() {
            _cardResultado = Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Resultado",
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          thickness: 0,
                        ),
                        Text(
                          "• O seu resultado é: " +
                              resultado.toStringAsPrecision(4) +
                              "%\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Categoria selecionada: " + cat + "\n",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 1 - Metas para os índices reprodutivos conforme categoria animal.\n"
                          "• Veja dicas de manejo para melhorar o desempenho.",
                          textAlign: TextAlign.justify,
                        ),
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TabelasMetas(index: 1)));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(MdiIcons.tableLarge),
                                  Flexible(
                                    child: Text(
                                      "Metas para os índices reprodutivos conforme categoria animal",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dicas()));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(MdiIcons.lightbulbOnOutline),
                                  Flexible(
                                    child: Text(
                                      "Dicas de manejo",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ]),
                ));
          });
        }
      }

      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "TAXA DE PARIÇÃO",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "A propriedade está com problemas de perdas gestacionais? Como está o manejo das fêmeas gestantes?",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nVocê poderá avaliar o status sanitário e o manejo do rebanho calculando a taxa de parição.",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nEsta taxa se diferencia conforme a categoria de animais, portanto o produtor poderá escolher a categoria para comparar o resultado obtido na fazenda com as metas da TABELA 1 - Metas para os índices reprodutivos conforme categoria animal.",
                      textAlign: TextAlign.justify,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "\nSelecione uma das categorias abaixo:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    DropDownFormField(
                      titleText: 'Categoria',
                      hintText: 'Selecione uma das categorias',
                      required: true,
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Novilhas de 13-24 meses",
                          "value": "1",
                        },
                        {
                          "display": "Novilhas de 25-36 meses",
                          "value": "2",
                        },
                        {
                          "display": "Vacas > 36 meses",
                          "value": "3",
                        },
                        {
                          "display": "Cálculo geral",
                          "value": "4",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                    Text(
                      "\nInforme o número de fêmeas paridas:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de fêmeas paridas:"),
                      controller: _femeasParidasController,
                    ),
                    Text(
                      "\nInforme o número de fêmeas gestantes:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de fêmeas gestantes:"),
                      controller: _femeasGestantesController,
                    ),
                    RaisedButton(
                      shape: StadiumBorder(),
                      child: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.send),
                            Text(" Enviar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _resultado(_myActivity);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: _cardResultado,
                    )
                  ])));
    } else if (index == 6) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "TAXAS DE DESMAME",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    FlatButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taxas_Calculos_2(
                                      index: 3,
                                    )));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.chartLine),
                              Flexible(
                                child: Text(
                                  "Taxa de desmame",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taxas_Calculos_2(
                                      index: 4,
                                    )));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.chartLine),
                              Flexible(
                                child: Text(
                                  "Relação vaca/bezerro (desmame ideal)",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ])));
    } else if (index == 7) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "TAXAS DE PRODUÇÃO",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    FlatButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taxas_Calculos_2(
                                      index: 5,
                                    )));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.chartLine),
                              Flexible(
                                child: Text(
                                  "Produção Real de kg de bezerro desmamado/fêmea/ano",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    /*FlatButton(
                      color: Colors.lightGreen,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taxas_Calculos_2(
                                  index: 6,
                                )));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.chartLine),
                              Flexible(
                                child: Text(
                                  "Produção real de Kg de bezerro desmamado por área",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )*/
                  ])));
    }
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
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            taxas(widget.index, context),
                            FlatButton(
                              shape: StadiumBorder(),
                              color: Colors.lightGreen,
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back),
                                      Text("Voltar"),
                                    ],
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
