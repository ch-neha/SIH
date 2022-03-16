// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:sih/locationInfo.dart';

class Map extends StatelessWidget {
  const Map({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: latLng.LatLng(17.5389, 78.3863),
              zoom: 12.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/nehachekuri/cl0t6d5zu00eu14qibq8vwlqv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmVoYWNoZWt1cmkiLCJhIjoiY2wwdDVnMGN3MGEzcDNjbHpibDB0azhuYiJ9.L8sXbuA3jW0iCl9_b5jG9g",
                  subdomains: [
                    'a',
                    'b',
                    'c'
                  ],
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoibmVoYWNoZWt1cmkiLCJhIjoiY2wwdDVnMGN3MGEzcDNjbHpibDB0azhuYiJ9.L8sXbuA3jW0iCl9_b5jG9g',
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(17.5389, 78.3863),
                    builder: (ctx) => Container(
                      child: GestureDetector(
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationInfo();
                            }))),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(17.54, 78.3863),
                    builder: (ctx) => Container(
                      child: GestureDetector(
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationInfo();
                            }))),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.wheelchair_pickup,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(17.29, 78.2358),
                    builder: (ctx) => Container(
                      child: GestureDetector(
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationInfo();
                            }))),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.wheelchair_pickup,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(17.5389, 78.4863),
                    builder: (ctx) => Container(
                      child: GestureDetector(
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationInfo();
                            }))),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.location_city,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(17.6389, 78.363),
                    builder: (ctx) => Container(
                      child: GestureDetector(
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationInfo();
                            }))),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(17.4, 78.33),
                    builder: (ctx) => Container(
                      child: GestureDetector(
                        onTap: (() => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationInfo();
                            }))),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.apartment,
                          color: Colors.red,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 35.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(200.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixIcon: Icon(Icons.search),
                labelText: "search",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
