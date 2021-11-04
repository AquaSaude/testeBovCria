import 'package:bovcria/voce_sabia.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'dicas.dart';

class Taxas_Calculos_2 extends StatefulWidget {
  final index;

  const Taxas_Calculos_2({Key key, this.index}) : super(key: key);

  @override
  _Taxas_Calculos_2State createState() => _Taxas_Calculos_2State();
}

class _Taxas_Calculos_2State extends State<Taxas_Calculos_2> {
  //Variáveis uteis
  TextEditingController _animaisMortosController = TextEditingController();
  TextEditingController _inicialAnimaisController = TextEditingController();
  TextEditingController _bezerrosNascidosController = TextEditingController();
  TextEditingController _bezerrosDesmamadosController = TextEditingController();
  TextEditingController _femeasGestantesController = TextEditingController();
  TextEditingController _pesoBezerroController = TextEditingController();
  TextEditingController _pesoFemeaController = TextEditingController();
  TextEditingController _intervaloDiasController = TextEditingController();
  TextEditingController _areaPropriedadeController = TextEditingController();
  String _myActivity = "";
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

  //-----------------------------------------------------------

  Card taxas(index, context) {
    //1 - Taxa geral de mortalidade anual de rebanho
    //2 - Taxa anual de mortalidade de bezerros até desmama
    //3 - Taxa de desmame
    //4 - Relação vaca/bezerro (desmame ideal)
    //5 - Produção Real de kg de bezerro desmamado/fêmea/ano
    //6 - Produção real de Kg de bezerro desmamado por área

    if (index == 1) {
      void _resultado(String categoria) {
        String animaisMortosFormatado = "";
        String inicialAnimaisFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_animaisMortosController.text.contains(",")) {
          animaisMortosFormatado =
              _animaisMortosController.text.replaceAll(",", ".");
        } else {
          animaisMortosFormatado = _animaisMortosController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_pesoBezerroController.text.contains(",")) {
          inicialAnimaisFormatado =
              _inicialAnimaisController.text.replaceAll(",", ".");
        } else {
          inicialAnimaisFormatado = _inicialAnimaisController.text;
        }

        int animaisMortos = int.tryParse(animaisMortosFormatado);
        int inicialAnimais = int.tryParse(inicialAnimaisFormatado);

        if (animaisMortos == null ||
            animaisMortos < 0 ||
            inicialAnimais == null ||
            inicialAnimais <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (animaisMortos == null || animaisMortos < 0) {
            mensagem = mensagem +
                "\n• Número de animais mortos: Utilize valores maiores ou iguais a zero e números inteiros.";
          }
          if (inicialAnimais == null || inicialAnimais <= 0) {
            mensagem = mensagem +
                "\n• Número inicial de animais no rebanho: Utilize valores maiores que 0 e números inteiros.";
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
          //Fórmula:  N° de animais mortos x 100/número inicial de animais

          double resultado = (animaisMortos * 100) / inicialAnimais;
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
                          "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 2 - Índices gerais do rebanho de cria.\n"
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
                      "TAXA GERAL DE MORTALIDADE ANUAL DE REBANHO",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "Esta taxa permite avaliar se os manejos nutricional e sanitário em todas as categorias do rebanho e  o gerenciamento geral da propriedade estão sendo eficientes. A morte de qualquer animal  implica em perda econômica.",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nEsta taxa também poder ser calculada por categoria, assim  possibilita avaliar qual destas  necessitam uma maior atenção, portanto o produtor poderá escolher a categoria para comparar o resultado obtido na fazenda com a meta da TABELA 2 - Índices gerais do rebanho de cria.",
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
                      "\nInforme o número de animais mortos:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de animais mortos:"),
                      controller: _animaisMortosController,
                    ),
                    Text(
                      "\nInforme o número inicial de animais no rebanho:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número inicial de animais no rebanho:"),
                      controller: _inicialAnimaisController,
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
    } else if (index == 2) {
      void _resultado(String categoria) {
        String bezerrosNascidosFormatado = "";
        String bezerrosDesmamadosFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_bezerrosNascidosController.text.contains(",")) {
          bezerrosNascidosFormatado =
              _bezerrosNascidosController.text.replaceAll(",", ".");
        } else {
          bezerrosNascidosFormatado = _bezerrosNascidosController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_pesoBezerroController.text.contains(",")) {
          bezerrosDesmamadosFormatado =
              _bezerrosDesmamadosController.text.replaceAll(",", ".");
        } else {
          bezerrosDesmamadosFormatado = _bezerrosDesmamadosController.text;
        }

        int bezerrosNascidos = int.tryParse(bezerrosNascidosFormatado);
        int bezerrosDesmamados = int.tryParse(bezerrosDesmamadosFormatado);

        if (bezerrosDesmamados == null ||
            bezerrosDesmamados < 0 ||
            bezerrosNascidos == null ||
            bezerrosNascidos <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (bezerrosDesmamados == null || bezerrosDesmamados < 0) {
            mensagem = mensagem +
                "\n• Número de bezerros desmamados: Utilize valores maiores ou iguais a zero e números inteiros.";
          }
          if (bezerrosNascidos == null || bezerrosNascidos <= 0) {
            mensagem = mensagem +
                "\n• Número de bezerros nascidos: Utilize valores maiores que 0 e números inteiros.";
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
          //Fórmula:  N° de BEZERROS NASCIDOS -  N° DE BEZERROS DESMAMADOS x 100/ N° DE BEZERROS NASCIDOS

          double resultado = ((bezerrosNascidos - bezerrosDesmamados) * 100) /
              bezerrosNascidos;
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
                          "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 2 - Índices gerais do rebanho de cria.\n"
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
                      "TAXA ANUAL DE MORTALIDADE DE BEZERROS ATÉ DESMAMA",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "Esta taxa permite avaliar a habilidade materna das fêmeas e todas as estratégias de manejo do rebanho de cria. A perda de um terneiro reflete negativamente no empenho em fazer uma fêmea conceber e gera perdas econômicas.",
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
                      "\nInforme o número de bezerros nascidos:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de bezerros nascidos:"),
                      controller: _bezerrosNascidosController,
                    ),
                    Text(
                      "\nInforme o número de bezerros desmamados:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de bezerros desmamados:"),
                      controller: _bezerrosDesmamadosController,
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
    } else if (index == 3) {
      void _resultado(String categoria) {
        String femeasGestantesFormatado = "";
        String bezerrosDesmamadosFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_femeasGestantesController.text.contains(",")) {
          femeasGestantesFormatado =
              _femeasGestantesController.text.replaceAll(",", ".");
        } else {
          femeasGestantesFormatado = _femeasGestantesController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_pesoBezerroController.text.contains(",")) {
          bezerrosDesmamadosFormatado =
              _bezerrosDesmamadosController.text.replaceAll(",", ".");
        } else {
          bezerrosDesmamadosFormatado = _bezerrosDesmamadosController.text;
        }

        int femeasGestantes = int.tryParse(femeasGestantesFormatado);
        int bezerrosDesmamados = int.tryParse(bezerrosDesmamadosFormatado);

        if (bezerrosDesmamados == null ||
            bezerrosDesmamados < 0 ||
            femeasGestantes == null ||
            femeasGestantes <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (bezerrosDesmamados == null || bezerrosDesmamados < 0) {
            mensagem = mensagem +
                "\n• Número de bezerros desmamados: Utilize valores maiores ou iguais a zero e números inteiros.";
          }
          if (femeasGestantes == null || femeasGestantes <= 0) {
            mensagem = mensagem +
                "\n• Número de fêmeas gestantes: Utilize valores maiores que 0 e números inteiros.";
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
          //Fórmula: Nº de bezerros desmamados x 100/  Nº de fêmeas gestantes

          double resultado = (bezerrosDesmamados * 100) / femeasGestantes;
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
                          "• Veja orientações em dicas de manejo e “você sabia  que…”,  para melhorar o desempenho.",
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
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VoceSabia()));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.question_answer),
                                  Flexible(
                                    child: Text(
                                      "Você sabia que...",
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
                      "TAXA DE DESMAME",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "As fêmeas do seu rebanho têm uma boa habilidade materna? Como estão o manejo do  recém-nascido e os demais manejos sanitários dos animais jovens?",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nVocê pode avaliar o desempenho do rebanho calculando a taxa de desmame.",
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
                      "\nInforme o número de bezerros desmamados:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de bezerros desmamados:"),
                      controller: _bezerrosDesmamadosController,
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
    } else if (index == 4) {
      void _resultado(String categoria) {
        String pesoFemeaFormatado = "";
        String pesoBezerroFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_pesoFemeaController.text.contains(",")) {
          pesoFemeaFormatado = _pesoFemeaController.text.replaceAll(",", ".");
        } else {
          pesoFemeaFormatado = _pesoFemeaController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_pesoBezerroController.text.contains(",")) {
          pesoBezerroFormatado =
              _pesoBezerroController.text.replaceAll(",", ".");
        } else {
          pesoBezerroFormatado = _pesoBezerroController.text;
        }

        double pesoFemea = double.tryParse(pesoFemeaFormatado);
        double pesoBezerro = double.tryParse(pesoBezerroFormatado);

        if (pesoBezerro == null ||
            pesoBezerro < 0 ||
            pesoFemea == null ||
            pesoFemea <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (pesoBezerro == null || pesoBezerro < 0) {
            mensagem = mensagem +
                "\n• Peso do Bezerro: Utilize valores maiores ou iguais a zero.";
          }
          if (pesoFemea == null || pesoFemea <= 0) {
            mensagem =
                mensagem + "\n• Peso da mãe: Utilize valores maiores que zero.";
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
          //Fórmula: Peso do bezerro desmamado x 100/ peso de sua mãe

          double resultado = (pesoBezerro * 100) / pesoFemea;
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
                          "• Veja orientações em dicas de manejo e “você sabia  que…”,  para melhorar o desempenho.",
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
                        FlatButton(
                          color: Colors.lightGreen,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VoceSabia()));
                          },
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.question_answer),
                                  Flexible(
                                    child: Text(
                                      "Você sabia que...",
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
                      "RELAÇÃO VACA/BEZERRO (DESMAME IDEAL)",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "A sua fêmea é uma boa mãe? Qual  percentual do peso vivo da vaca é convertido em kg de peso do bezerro à desmama em um mesmo grupo de manejo?",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nVocê pode avaliar a habilidade materna de suas fêmeas, assim como o manejo nutricional das matrizes e de seus bezerros calculando a relação vaca/bezerro.",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nEsta taxa pode ser calculada conforme a categoria de animais, portanto o produtor poderá escolher a categoria para comparar o resultado obtido na fazenda com a meta da TABELA 1 - Metas para os índices reprodutivos conforme categoria animal.",
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
                      "\nInforme o peso do bezerro desmamado em Kg",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso do bezerro desmamado em Kg:"),
                      controller: _pesoBezerroController,
                    ),
                    Text(
                      "\nInforme o peso da mãe em Kg:",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: "Peso da mãe em Kg:"),
                      controller: _pesoFemeaController,
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
        String pesoBezerroFormatado = "";
        String intervaloDiasFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_pesoBezerroController.text.contains(",")) {
          pesoBezerroFormatado =
              _pesoBezerroController.text.replaceAll(",", ".");
        } else {
          pesoBezerroFormatado = _pesoBezerroController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_intervaloDiasController.text.contains(",")) {
          intervaloDiasFormatado =
              _intervaloDiasController.text.replaceAll(",", ".");
        } else {
          intervaloDiasFormatado = _intervaloDiasController.text;
        }

        double pesoBezerro = double.tryParse(pesoBezerroFormatado);
        int intervaloDias = int.tryParse(intervaloDiasFormatado);

        if (pesoBezerro == null ||
            pesoBezerro <= 0 ||
            intervaloDias == null ||
            intervaloDias <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (pesoBezerro == null || pesoBezerro <= 0) {
            mensagem = mensagem +
                "\n• Peso do Bezerro: Utilize valores maiores que zero.";
          }
          if (intervaloDias == null || intervaloDias <= 0) {
            mensagem = mensagem +
                "\n• Intervalo entre partos da fêmea em dias: Utilize valores inteiros e maiores que zero.";
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
          //Fórmula: peso do bezerro desmamado x 365/ intervalo entre partos da fêmea em dias

          double resultado = (pesoBezerro * 365) / intervaloDias;
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
                              " Kg\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Categoria selecionada: " + cat + "\n",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Verifique se o seu resultado está acima ou abaixo de 170 kg.  \n"
                          "• Caso seu resultado esteja abaixo deste valor, veja:\n",
                          textAlign: TextAlign.justify,
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
                      "PRODUÇÃO REAL DE KG DE BEZERRO DESMAMADO/FÊMEA/ANO",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "O seu rebanho de cria é eficiente? \n\nA eficiência do rebanho de cria é avaliada pela produção real de kg de bezerro desmamado por fêmea anualmente.",
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
                      "\nInforme o peso do bezerro desmamado em Kg",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso do bezerro desmamado em Kg:"),
                      controller: _pesoBezerroController,
                    ),
                    Text(
                      "\nInforme o intervalo entre partos da fêmea em dias",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText:
                              "Intervalo entre partos da fêmea em dias:"),
                      controller: _intervaloDiasController,
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
      void _resultado(String categoria) {
        //_pesoBezerroController, _intervaloDiasController, _areaPropriedadeController
        String pesoBezerroFormatado = "";
        String intervaloDiasFormatado = "";
        String areaPropriedadeFormatado = "";

        //Remove vírgula e substitui por ponto
        if (_pesoBezerroController.text.contains(",")) {
          pesoBezerroFormatado =
              _pesoBezerroController.text.replaceAll(",", ".");
        } else {
          pesoBezerroFormatado = _pesoBezerroController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_intervaloDiasController.text.contains(",")) {
          intervaloDiasFormatado =
              _intervaloDiasController.text.replaceAll(",", ".");
        } else {
          intervaloDiasFormatado = _intervaloDiasController.text;
        }
        //Remove vírgula e substitui por ponto
        if (_areaPropriedadeController.text.contains(",")) {
          areaPropriedadeFormatado =
              _areaPropriedadeController.text.replaceAll(",", ".");
        } else {
          areaPropriedadeFormatado = _areaPropriedadeController.text;
        }

        double pesoBezerro = double.tryParse(pesoBezerroFormatado);
        int intervaloDias = int.tryParse(intervaloDiasFormatado);
        double areaPropriedade = double.tryParse(areaPropriedadeFormatado);

        if (pesoBezerro == null ||
            pesoBezerro <= 0 ||
            intervaloDias == null ||
            intervaloDias <= 0 ||
            areaPropriedade == null ||
            areaPropriedade <= 0 ||
            categoria == "") {
          String mensagem = "ERRO!\n";
          if (pesoBezerro == null || pesoBezerro <= 0) {
            mensagem = mensagem +
                "\n• Peso do Bezerro: Utilize valores maiores que zero.";
          }
          if (intervaloDias == null || intervaloDias <= 0) {
            mensagem = mensagem +
                "\n• Intervalo entre partos da fêmea em dias: Utilize valores inteiros e maiores que zero.";
          }
          if (areaPropriedade == null || areaPropriedade <= 0) {
            mensagem = mensagem +
                "\n• Área da propriedade em ha utilizada para produção do rebanho de cria: Utilize valores maiores que zero.";
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
          //Fórmula: ((peso do bezerro desmamado x 365)/ intervalo entre partos da fêmea em dias) / área utilizada em ha

          double resultado =
              ((pesoBezerro * 356) / intervaloDias) / areaPropriedade;
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
                              " Kg/ha\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Categoria selecionada: " + cat + "\n",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "• Verifique se o seu resultado está acima ou abaixo de  20 kg/ha.  \n"
                          "• Caso seu resultado esteja abaixo deste valor, veja:\n",
                          textAlign: TextAlign.justify,
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
                      "PRODUÇÃO REAL DE KG DE BEZERRO DESMAMADO POR ÁREA",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "O seu rebanho de cria é eficiente? \n\nA eficiência do rebanho de cria é avaliada pela produção real de kg de bezerro desmamado por fêmea anualmente por área utilizada (ha).",
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
                      "\nInforme o peso do bezerro desmamado em Kg",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso do bezerro desmamado em Kg:"),
                      controller: _pesoBezerroController,
                    ),
                    Text(
                      "\nInforme o intervalo entre partos da fêmea em dias",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText:
                              "Intervalo entre partos da fêmea em dias:"),
                      controller: _intervaloDiasController,
                    ),
                    Text(
                      "\nInforme a área da propriedade em ha (hectares) utilizada para produção do rebanho de cria",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Área da propriedade em ha:"),
                      controller: _areaPropriedadeController,
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
