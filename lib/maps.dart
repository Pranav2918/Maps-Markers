import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter_map/plugin_api.dart';
import 'package:maps/details.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  MapsState createState() => MapsState();
}

class MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(21.5222, 70.4579),
            zoom: 13.0,
          ),
          layers: <LayerOptions>[
            TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/prnv1812/cktmma72ba6vf17p95jl5dbz8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHJudjE4MTIiLCJhIjoiY2t0bWtpZHFvMjZiMDJ6cW53MjJxZjBrNiJ9.Rqq9rS8RPT2FIPjoUYnR5A",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoicHJudjE4MTIiLCJhIjoiY2t0bWtpZHFvMjZiMDJ6cW53MjJxZjBrNiJ9.Rqq9rS8RPT2FIPjoUYnR5A',
                'id': 'mapbox.streets',
              },
            ),
            MarkerLayerOptions(
                markers: info.map((model) {
              return Marker(
                builder: (BuildContext context) {
                  return SimpleTooltip(
                    // backgroundColor: Colors.grey,
                    borderColor: Colors.black,
                    borderWidth: 1,
                    minHeight: 50,
                    maxHeight: 100,
                    minWidth: 100,
                    maxWidth: 350,
                    show: true,
                    animationDuration: const Duration(seconds: 2),
                    content: Material(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.place,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          model.phone.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          model.web,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/marker2.png"))),
                    ),
                  );
                },
                point: latLng.LatLng(model.latitude, model.longitude),
              );
            }).toList())
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {},
            child: const Icon(Icons.call, color: Colors.white),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {},
            child: const Icon(Icons.mail_outline, color: Colors.white),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () async {},
            child: const Icon(Icons.open_in_browser_sharp, color: Colors.white),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {},
            child: const Icon(Icons.alt_route_outlined, color: Colors.white),
          )
        ]));
  }
}
