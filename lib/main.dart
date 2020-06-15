import 'package:flutter/material.dart';
import 'package:hackathonccr/tabs/calcFrete.dart';
import 'package:hackathonccr/tabs/financeiro.dart';
import 'package:hackathonccr/tabs/maps.dart';
import 'package:hackathonccr/tabs/saude.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siga Bem',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xFF045484),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xFF045484),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeTabs();
  }
}

class HomeTabs extends StatefulWidget {
  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title:
                            Text('Usuário #zwe567 Emitiu Alerta de Segurança'),
                        content: Text(
                            """Ultima posição conhecida: -25.4412761, -49.2384853, 16z
HQ56+5F Jardim Botânico, Curitiba - PR"""),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.asset('assets/images/icons/perfilicon.png'),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: Color(0xFF045484),
            appBar: AppBar(
              title: Tab(
                icon: Image.asset('assets/images/icons/sigabemtitulo.png'),
              ),
              bottom: TabBar(
                labelColor: Color(0xFF045484),
                tabs: <Widget>[
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.asset('assets/images/icons/navegaçãoponto.png'),
                    ),
                  ),
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/icons/saudeicon.png'),
                    ),
                  ),
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/icons/clubeicon.png'),
                    ),
                  ),
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/icons/cuideicon.png'),
                    ),
                  ),
                  Tab(
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/icons/infoicon.png'),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                MapsForm(),
                SaudeCarousel(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      """Olá, esse é o nosso clube de vantagens. Utilizando nosso aplicativo, você garante vantagens em parceiros comercias equipados para suas demandas.
                      
Aqui você encontra toda uma rede postos, hotéis, restaurantes e lanchonetes, com a infra estrutura e alimentação que você precisa, sem deixar de ter aquele descontinho que todo mundo gosta ;)""",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                CalcFrete(),
                FinanceiroCarousel(),
              ],
            )),
      ),
    );
  }
}
