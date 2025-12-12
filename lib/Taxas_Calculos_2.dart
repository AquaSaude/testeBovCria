import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'dicas.dart';

class Taxas_Calculos_2 extends StatefulWidget {
  final int? index;

  const Taxas_Calculos_2({Key? key, this.index}) : super(key: key);

  @override
  _Taxas_Calculos_2State createState() => _Taxas_Calculos_2State();
}

class _Taxas_Calculos_2State extends State<Taxas_Calculos_2> {
  // Variáveis uteis
  TextEditingController _animaisMortosController = TextEditingController();
  TextEditingController _inicialAnimaisController = TextEditingController();
  TextEditingController _bezerrosNascidosController = TextEditingController();
  TextEditingController _bezerrosDesmamadosController = TextEditingController();
  TextEditingController _femeasGestantesController = TextEditingController();
  TextEditingController _pesoBezerroController = TextEditingController();
  TextEditingController _pesoFemeaController = TextEditingController();
  TextEditingController _intervaloDiasController = TextEditingController();
  TextEditingController _areaPropriedadeController = TextEditingController();
  String? _myActivity;
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

  // Fonte de dados para o Dropdown
  final List<Map<String, String>> _categories = [
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
  ];

  // Função auxiliar para parsear e formatar a entrada de texto
  String _parseInput(String text) {
    return text.contains(",") ? text.replaceAll(",", ".") : text;
  }

  // Métodos de cálculo para cada índice
  void _calcularTaxa1() {
    String animaisMortosFormatado = _parseInput(_animaisMortosController.text);
    String inicialAnimaisFormatado = _parseInput(_inicialAnimaisController.text);

    int? animaisMortos = int.tryParse(animaisMortosFormatado);
    int? inicialAnimais = int.tryParse(inicialAnimaisFormatado);

    if (animaisMortos == null ||
        inicialAnimais == null ||
        animaisMortos < 0 ||
        inicialAnimais <= 0 ||
        _myActivity == null) {
      String mensagem = "ERRO!\n";
      if (animaisMortos == null || animaisMortos < 0) {
        mensagem +=
        "\n• Número de animais mortos: Utilize valores maiores ou iguais a zero e números inteiros.";
      }
      if (inicialAnimais == null || inicialAnimais <= 0) {
        mensagem +=
        "\n• Número inicial de animais no rebanho: Utilize valores maiores que 0 e números inteiros.";
      }
      if (_myActivity == null) {
        mensagem += "\n• Categoria: Selecione uma das categorias listadas acima!";
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
      // Fórmula: N° de animais mortos x 100/número inicial de animais
      double resultado = (animaisMortos * 100) / inicialAnimais;
      String cat = "";

      if (_myActivity == "1") {
        cat = "Novilhas de 13-24 meses";
      } else if (_myActivity == "2") {
        cat = "Novilhas de 25-36 meses";
      } else if (_myActivity == "3") {
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
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "• O seu resultado é: " +
                          resultado.toStringAsPrecision(4) +
                          "%\n",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabelasMetas(index: 2)));
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dicas()));
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

  void _calcularTaxa2() {
    String bezerrosNascidosFormatado =
    _parseInput(_bezerrosNascidosController.text);
    String bezerrosDesmamadosFormatado =
    _parseInput(_bezerrosDesmamadosController.text);

    int? bezerrosNascidos = int.tryParse(bezerrosNascidosFormatado);
    int? bezerrosDesmamados = int.tryParse(bezerrosDesmamadosFormatado);

    if (bezerrosDesmamados == null ||
        bezerrosNascidos == null ||
        bezerrosDesmamados < 0 ||
        bezerrosNascidos <= 0 ||
        _myActivity == null) {
      String mensagem = "ERRO!\n";
      if (bezerrosDesmamados == null || bezerrosDesmamados < 0) {
        mensagem +=
        "\n• Número de bezerros desmamados: Utilize valores maiores ou iguais a zero e números inteiros.";
      }
      if (bezerrosNascidos == null || bezerrosNascidos <= 0) {
        mensagem +=
        "\n• Número de bezerros nascidos: Utilize valores maiores que 0 e números inteiros.";
      }
      if (_myActivity == null) {
        mensagem += "\n• Categoria: Selecione uma das categorias listadas acima!";
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
      // Fórmula: N° de BEZERROS NASCIDOS - N° DE BEZERROS DESMAMADOS x 100/ N° DE BEZERROS NASCIDOS
      double resultado =
          ((bezerrosNascidos - bezerrosDesmamados) * 100) / bezerrosNascidos;
      String cat = "";

      if (_myActivity == "1") {
        cat = "Novilhas de 13-24 meses";
      } else if (_myActivity == "2") {
        cat = "Novilhas de 25-36 meses";
      } else if (_myActivity == "3") {
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
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "• O seu resultado é: " +
                          resultado.toStringAsPrecision(4) +
                          "%\n",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabelasMetas(index: 2)));
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dicas()));
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

  void _calcularTaxa3() {
    String femeasGestantesFormatado =
    _parseInput(_femeasGestantesController.text);
    String bezerrosDesmamadosFormatado =
    _parseInput(_bezerrosDesmamadosController.text);

    int? femeasGestantes = int.tryParse(femeasGestantesFormatado);
    int? bezerrosDesmamados = int.tryParse(bezerrosDesmamadosFormatado);

    if (bezerrosDesmamados == null ||
        femeasGestantes == null ||
        bezerrosDesmamados < 0 ||
        femeasGestantes <= 0 ||
        _myActivity == null) {
      String mensagem = "ERRO!\n";
      if (bezerrosDesmamados == null || bezerrosDesmamados < 0) {
        mensagem +=
        "\n• Número de bezerros desmamados: Utilize valores maiores ou iguais a zero e números inteiros.";
      }
      if (femeasGestantes == null || femeasGestantes <= 0) {
        mensagem +=
        "\n• Número de fêmeas gestantes: Utilize valores maiores que 0 e números inteiros.";
      }
      if (_myActivity == null) {
        mensagem += "\n• Categoria: Selecione uma das categorias listadas acima!";
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
      // Fórmula: Nº de bezerros desmamados x 100/ Nº de fêmeas gestantes
      double resultado = (bezerrosDesmamados * 100) / femeasGestantes;
      String cat = "";

      if (_myActivity == "1") {
        cat = "Novilhas de 13-24 meses";
      } else if (_myActivity == "2") {
        cat = "Novilhas de 25-36 meses";
      } else if (_myActivity == "3") {
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
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "• O seu resultado é: " +
                          resultado.toStringAsPrecision(4) +
                          "%\n",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "• Categoria selecionada: " + cat + "\n",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "• Verifique se o seu resultado está acima ou abaixo da taxa ideal na TABELA 1 - Metas para os índices reprodutivos conforme categoria animal.\n"
                          "• Veja orientações em dicas de manejo e “você sabia que…”, para melhorar o desempenho.",
                      textAlign: TextAlign.justify,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabelasMetas(index: 1)));
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
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dicas()));
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

  Card taxas(int? index, BuildContext context) {
    if (index == 1) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "TAXA GERAL DE MORTALIDADE ANUAL DE REBANHO",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "Esta taxa permite avaliar se os manejos nutricional e sanitário em todas as categorias do rebanho e o gerenciamento geral da propriedade estão sendo eficientes. A morte de qualquer animal implica em perda econômica.",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nEsta taxa também poder ser calculada por categoria, assim possibilita avaliar qual destas necessitam uma maior atenção, portanto o produtor poderá escolher a categoria para comparar o resultado obtido na fazenda com a meta da TABELA 2 - Índices gerais do rebanho de cria.",
                      textAlign: TextAlign.justify,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "\nSelecione uma das categorias abaixo:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Categoria',
                        hintText: 'Selecione uma das categorias',
                      ),
                      initialValue: _myActivity,
                      onChanged: (String? newValue) {
                        setState(() {
                          _myActivity = newValue;
                        });
                      },
                      items: _categories.map((Map<String, String> category) {
                        return DropdownMenuItem<String>(
                          value: category['value'],
                          child: Text(category['display']!),
                        );
                      }).toList(),
                    ),
                    Text(
                      "\nInforme o número de animais mortos:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de animais mortos:"),
                      controller: _animaisMortosController,
                    ),
                    Text(
                      "\nInforme o número inicial de animais no rebanho:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número inicial de animais no rebanho:"),
                      controller: _inicialAnimaisController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.green,
                      ),
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
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _calcularTaxa1();
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
                      "TAXA ANUAL DE MORTALIDADE DE BEZERROS ATÉ DESMAMA",
                      style: Theme.of(context).textTheme.titleLarge,
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
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Categoria',
                        hintText: 'Selecione uma das categorias',
                      ),
                      initialValue: _myActivity,
                      onChanged: (String? newValue) {
                        setState(() {
                          _myActivity = newValue;
                        });
                      },
                      items: _categories.map((Map<String, String> category) {
                        return DropdownMenuItem<String>(
                          value: category['value'],
                          child: Text(category['display']!),
                        );
                      }).toList(),
                    ),
                    Text(
                      "\nInforme o número de bezerros nascidos:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de bezerros nascidos:"),
                      controller: _bezerrosNascidosController,
                    ),
                    Text(
                      "\nInforme o número de bezerros desmamados:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de bezerros desmamados:"),
                      controller: _bezerrosDesmamadosController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.green,
                      ),
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
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _calcularTaxa2();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: _cardResultado,
                    )
                  ])));
    } else if (index == 3) {
      return Card(
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "TAXA DE DESMAME",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                      "Este é o principal índice para avaliar o desempenho reprodutivo de um rebanho de cria. Um bom desempenho reprodutivo é o resultado de uma interação positiva entre fatores como genética, ambiente e manejo.",
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      "\nSelecione uma das categorias abaixo:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Categoria',
                        hintText: 'Selecione uma das categorias',
                      ),
                      initialValue: _myActivity,
                      onChanged: (String? newValue) {
                        setState(() {
                          _myActivity = newValue;
                        });
                      },
                      items: _categories.map((Map<String, String> category) {
                        return DropdownMenuItem<String>(
                          value: category['value'],
                          child: Text(category['display']!),
                        );
                      }).toList(),
                    ),
                    Text(
                      "\nInforme o número de fêmeas gestantes:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de fêmeas gestantes:"),
                      controller: _femeasGestantesController,
                    ),
                    Text(
                      "\nInforme o número de bezerros desmamados:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Número de bezerros desmamados:"),
                      controller: _bezerrosDesmamadosController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.green,
                      ),
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
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _calcularTaxa3();
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: _cardResultado,
                    )
                  ])));
    } else {
      return Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Text("Cálculo para este índice não implementado."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: taxas(widget.index, context),
    );
  }
}
