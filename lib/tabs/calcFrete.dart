import 'package:flutter/material.dart';
import 'package:hackathonccr/constants.dart';
import 'package:hackathonccr/utils/calcTextField.dart';

class CalcFrete extends StatefulWidget {
  @override
  _CalcFreteState createState() => _CalcFreteState();
}

class _CalcFreteState extends State<CalcFrete> {
  final CalcTextField km = CalcTextField(
    hintText: 'Distância em km',
    number: true,
  );
  final CalcTextField eixos = CalcTextField(
    hintText: 'Nº de eixos',
    number: true,
  );

  String valor = '';
  String tipo = "Carga Geral";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Calcule o frete mínimo de sua carga',
                  style: kBodyStyle,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: DropdownButton(
                    value: tipo,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String newValue) {
                      tipo = newValue;
                    },
                    items: <String>[
                      'Carga Geral',
                      'Carga Granel',
                      'Carga Neogranel',
                      'Carga Frigorificada',
                      'Carga Perigosa',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: km,
                    ),
                    Expanded(
                      child: eixos,
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  onPressed: () {
                    setState(() {
                      valor = calcCusto(tipo, int.parse(km.value()),
                          int.parse(eixos.value()));
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Visibility(
                  visible: (valor != ''),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'O valor mínimo a cobrar é',
                        style: kBodyStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        valor,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String calcCusto(String tipo, int km, int eixos) {
  double custo = 0;

  if (km > 0 && km <= 100) {
    custo = km * eixos * 2.19;
  } else if (km <= 200) {
    custo = km * eixos * 1.35;
  } else if (km <= 300) {
    custo = km * eixos * 1.18;
  } else if (km <= 400) {
    custo = km * eixos * 1.11;
  } else if (km <= 500) {
    custo = km * eixos * 1.07;
  } else if (km <= 600) {
    custo = km * eixos * 1.04;
  } else if (km <= 700) {
    custo = km * eixos * 1.02;
  } else if (km <= 800) {
    custo = km * eixos * 1.01;
  } else if (km <= 900) {
    custo = km * eixos * 1.00;
  } else if (km <= 1100) {
    custo = km * eixos * 0.99;
  } else if (km <= 1300) {
    custo = km * eixos * 0.98;
  } else if (km <= 1600) {
    custo = km * eixos * 0.97;
  } else if (km <= 2200) {
    custo = km * eixos * 0.96;
  } else {
    custo = km * eixos * 0.95;
  }

  String valor = custo.toStringAsFixed(2);

  return 'R\$$valor';
}
