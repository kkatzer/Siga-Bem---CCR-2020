import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathonccr/utils/calcTextField.dart';
import 'package:hackathonccr/constants.dart';
import 'package:hackathonccr/utils/utils.dart';
import 'dart:async';

class MapsForm extends StatefulWidget {
  @override
  _MapsFormState createState() => _MapsFormState();
}

class _MapsFormState extends State<MapsForm> {
  CalcTextField origin = CalcTextField(
    hintText: 'De',
    number: false,
  );

  CalcTextField destination = CalcTextField(
    hintText: 'Para',
    number: false,
  );

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
                  'Insira aqui o seu destino',
                  style: kBodyStyle,
                ),
                origin,
                destination,
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CalcTextField(
                        hintText: 'CEP',
                        number: false,
                      ),
                    ),
                    Expanded(
                      child: CalcTextField(
                        hintText: 'Nº',
                        number: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Prazo final de entrega',
                  style: kBodyStyle,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CalcTextField(
                        hintText: 'Data',
                        number: false,
                      ),
                    ),
                    Expanded(
                      child: CalcTextField(
                        hintText: 'Hora',
                        number: false,
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Maps(originPlace: origin.value(), destinationPlace: destination.value(),),),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Maps extends StatefulWidget {
  final String originPlace;
  final String destinationPlace;

  Maps({this.originPlace, this.destinationPlace});

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-23.5283214, -46.6637067),
    zoom: 14.4746,
  );

  void _launchMapsUrl() {
    String originPlaceId = 'Jardim%20Bot%C3%A2nico%20de%20Curitiba';
    String destinationPlaceId = widget.destinationPlace;
    String mapOptions = [
      'saddr=$originPlaceId',
      'daddr=$destinationPlaceId',
    ].join('&');

    final url = 'comgooglemaps://?$mapOptions';
    print(url);
    launchURLUnsafe(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.directions),
        onPressed: () {
          _launchMapsUrl();
        },
      ),
      appBar: AppBar(
        title: Tab(
          icon: Image.asset('assets/images/icons/sigabemtitulo.png'),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
