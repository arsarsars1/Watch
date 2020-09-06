import 'package:flutter/material.dart';
import 'package:watch/main.dart';

class MapWatch extends StatefulWidget {
  @override
  _MapWatchState createState() => _MapWatchState();
}

class _MapWatchState extends State<MapWatch> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('F3F3F3'),
      key: _scaffoldKey,
      drawer: drawer(
        context,
      ),
      body: ListView(
        children: [
          appBar(_scaffoldKey),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  30,
                ),
                bottomRight: Radius.circular(
                  30,
                ),
              ),
              color: HexColor(
                '5DB131',
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(
                        'assets/bg.jpeg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Arturo Navarro',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '76 Años',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Madrid',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: InteractiveViewer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: Image.asset(
                    'assets/map.jpg',

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
