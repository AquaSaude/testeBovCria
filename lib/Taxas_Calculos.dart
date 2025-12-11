import 'package:bovcria/Taxas_Calculos_2.dart';
import 'package:bovcria/dicas.dart';
import 'package:bovcria/dicas2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'TabelasMetas.dart';
import 'package:bovcria/l10n/app_localizations.dart';

class Taxas_Calculos extends StatefulWidget {
  final int index;

  const Taxas_Calculos({Key? key, required this.index}) : super(key: key);

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
  DateTime? _ultimoParto;
  DateTime? _partoAnterior;
  String _ultimoPartoFormatado = "";
  String _partoAnteriorFormatado = "";
  late Card _cardResultado;

  @override
  void initState() {
    super.initState();
    _cardResultado = Card(
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
      ),
    );
  }

  //Função que retorna o card com a taxa selecionada na tela anterior.
  Widget taxas(int index, BuildContext context) {
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

        double? idade = double.tryParse(idadeFormatado);

        if (idade != null) {
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
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
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
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
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
                                        AppLocalizations.of(context)!.dicasManejo,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
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
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
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
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dicas2()));
                            },
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(MdiIcons.lightbulbOnOutline),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)!.dicasManejo,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
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
                            AppLocalizations.of(context)!.alerta,
                            style: TextStyle(
                                color: Colors.red.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                          ),
                          Text("\nVeja orientações em:"),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
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
                                        AppLocalizations.of(context)!.indicesGeraisRebCria,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
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
                                        AppLocalizations.of(context)!.dicasManejo,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
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
                      AppLocalizations.of(context)!.idade,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 0,
                    ),
                    Text(
                        "Um dos  principais fatores de desempenho das fêmeas no rebanho de cria é a idade ao primeiro parto."),
                    Text(
                      "\nQual é a idade (em meses) do primeiro parto de suas fêmeas?",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Idade em meses"),
                      controller: _idadePrimeiroPartoController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
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
                        AppLocalizations.of(context)!.motalidade,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        thickness: 0,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
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
                                    AppLocalizations.of(context)!.taxaGeralMortAnualRabanho,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
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
            if (_ultimoParto == null || _partoAnterior == null) {
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
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            thickness: 0,
                          ),
                          Text(
                            "\nERRO: Por favor, selecione as duas datas para o cálculo.",
                            style: TextStyle(
                                color: Colors.red.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                        ]),
                  ),
                );
              });
              return;
            }

            final differenceInDays = _ultimoParto!.difference(_partoAnterior!).inDays;

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
                            style: Theme.of(context).textTheme.titleLarge,
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
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                            ),
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

          return Card(
              color: Colors.white,
              child: Container(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "INTERVALO ENTRE PARTOS",
                          style: Theme.of(context).textTheme.titleLarge,
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
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Categoria',
                            hintText: 'Selecione uma das categorias',
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _myActivity.isNotEmpty ? _myActivity : null,
                          onChanged: (value) {
                            setState(() {
                              _myActivity = value!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: "1",
                              child: Text("Novilhas de 13-24 meses"),
                            ),
                            DropdownMenuItem(
                              value: "2",
                              child: Text("Novilhas de 25-36 meses"),
                            ),
                            DropdownMenuItem(
                              value: "3",
                              child: Text("Vacas > 36 meses"),
                            ),
                            DropdownMenuItem(
                              value: "4",
                              child: Text("Cálculo geral"),
                            ),
                          ],
                        ),
                        Text("\nSelecione a data do ultimo parto"),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            foregroundColor: Colors.white,
                          ),
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
                                initialDate: _ultimoParto ?? DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100))
                                .then((date) {
                              if (date != null) {
                                setState(() {
                                  _ultimoParto = date;
                                  _ultimoPartoFormatado =
                                      DateFormat('dd/MM/yyyy').format(_ultimoParto!);
                                });
                              }
                            });
                          },
                        ),
                        Text("Selecione a data do parto anterior"),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            foregroundColor: Colors.white,
                          ),
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
                              initialDate: _partoAnterior ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((date) {
                              if (date != null) {
                                setState(() {
                                  _partoAnterior = date;
                                  _partoAnteriorFormatado =
                                      DateFormat('dd/MM/yyyy').format(_partoAnterior!);
                                });
                              }
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
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

              int? femeasGestantes = int.tryParse(femeasGestantesFormatado);
              int? femeasInseminadas = int.tryParse(femeasInseminadasFormatado);

              if (femeasGestantes == null || femeasInseminadas == null || femeasGestantes < 0 ||
                  femeasInseminadas <= 0 || categoria == "") {
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
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                                  foregroundColor: WidgetStateProperty.all(Colors.white),
                                ),
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
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                                  foregroundColor: WidgetStateProperty.all(Colors.white),
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
                                            AppLocalizations.of(context)!.dicasManejo,
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
                            AppLocalizations.of(context)!.concepcao,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            thickness: 0,
                          ),
                          Text(
                            "\nA taxa de concepção é a capacidade que a fêmea tem em conceber um bezerro a cada inseminação ou monta natural. Sua meta é obter 60% de concepção ou mais.",
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
                              border: OutlineInputBorder(),
                            ),
                            initialValue: _myActivity.isNotEmpty ? _myActivity : null,
                            onChanged: (value) {
                              setState(() {
                                _myActivity = value!;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text("Novilhas de 13-24 meses"),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text("Novilhas de 25-36 meses"),
                              ),
                              DropdownMenuItem(
                                value: "3",
                                child: Text("Vacas > 36 meses"),
                              ),
                              DropdownMenuItem(
                                value: "4",
                                child: Text("Cálculo geral"),
                              ),
                            ],
                          ),
                          Text(
                            "\nNúmero de fêmeas gestantes (no diagnóstico de gestação):",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Número de fêmeas gestantes"),
                            controller: _femeasGestantesController,
                          ),
                          Text(
                            "\nNúmero de fêmeas inseminadas ou acasaladas:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Número de fêmeas inseminadas"),
                            controller: _femeasInseminadasController,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
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
                              _resultado(_myActivity);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: _cardResultado,
                          )
                        ])));
            }
                return Container();
          }

  @override
  Widget build(BuildContext context) {
    //Variaveis
    var title = 'BovCria';

    return Scaffold(
      backgroundColor: Color(0xFF77dd77),
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          taxas(widget.index, context),
                          //Back Button
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(StadiumBorder()),
                                backgroundColor: WidgetStateProperty.all(Colors.lightGreen),
                                foregroundColor: WidgetStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back),
                                      Text(AppLocalizations.of(context)!.voltar),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
