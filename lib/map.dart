// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:sih/locationInfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  Set providers = new Set();
  bool matchfound = false;
  List<Marker> markers = [];
  // List<double> loc;
  List<List> locations = [];
  List<List> search = [];
  List data = [];
  Set loc = new Set();
  TextEditingController emailController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  void filter(String s) {
    print(s);
    markers = [];
    var f = 0;

    FirebaseFirestore.instance
        .collection('Provider')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // providers.add(doc["name"]);
        // print(doc["name"]);

        if (s == doc["type"]) {
          markers.add(
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng.LatLng(doc["location"][1], doc["location"][0]),
              builder: (ctx) => Container(
                child: GestureDetector(
                  onTap: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LocationInfo(
                          address: doc["address"],
                          type: doc["type"],
                          name: doc["name"],
                          images: doc["images"],
                          no: doc["mobile"].toString(),
                        );
                      }))),
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          );
          f = 1;
          setState(() {});
          return;
        }
        // search=doc.id;
        // data.add(doc.id);
        // print("hey");
        // print(doc.id);
        // loc.add(doc["location"]);
        // setState(() {});
        // print(loc);
        // locations.add(loc);

        // setState(() {});
        // print("here");
        // print(data);
        // print(search);
      });
    });

    // if (f == 0) {
    //   FirebaseFirestore.instance
    //       .collection('Provider')
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       markers.add(
    //         Marker(
    //           width: 80.0,
    //           height: 80.0,
    //           point: latLng.LatLng(doc["location"][1], doc["location"][0]),
    //           builder: (ctx) => Container(
    //             child: GestureDetector(
    //               onTap: (() => Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) {
    //                     return LocationInfo(
    //                       address: doc["address"],
    //                       type: doc["type"],
    //                       name: doc["name"],
    //                       no: doc["mobile"].toString(),
    //                     );
    //                   }))),
    //               // ignore: prefer_const_constructors
    //               child: Icon(
    //                 Icons.location_on,
    //                 color: Colors.red,
    //                 size: 50.0,
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     });
    //   });
    //   setState(() {});
    // }

    // this.search.forEach((element) {

    //   // if (element[0] == s) {
    //   //   print("Found Match hjvbkgjvtycghgvjyvgvkjvg");
    //   //   setState(() {
    //   //     matchfound = true;
    //   //   });

    //   //   // markers.add(
    //   //   //   Marker(
    //   //   //     width: 80.0,
    //   //   //     height: 80.0,
    //   //   //     point: latLng.LatLng(doc["location"][1], doc["location"][0]),
    //   //   //     builder: (ctx) => Container(
    //   //   //       child: GestureDetector(
    //   //   //         onTap: (() => Navigator.push(context,
    //   //   //                 MaterialPageRoute(builder: (context) {
    //   //   //               return LocationInfo(
    //   //   //                 address: doc["address"],
    //   //   //                 type: doc["type"],
    //   //   //                 name: doc["name"],
    //   //   //                 no: doc["mobile"].toString(),
    //   //   //               );
    //   //   //             }))),
    //   //   //         // ignore: prefer_const_constructors
    //   //   //         child: Icon(
    //   //   //           Icons.location_on,
    //   //   //           color: Colors.blue,
    //   //   //           size: 50.0,
    //   //   //         ),
    //   //   //       ),
    //   //   //     ),
    //   //   //   ),
    //   //   // );
    //   // } else {
    //   //   setState(() {
    //   //     matchfound = false;
    //   //   });
    //   // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (markers.isEmpty) {
      FirebaseFirestore.instance
          .collection('Provider')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // providers.add(doc["name"]);
          // print(doc["name"]);
          if (data.length == 0) {
            data.add(doc["type"]);
            data.add(doc["location"]);
            search.add(data);
            // search=doc.id;
          }

          markers.add(
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng.LatLng(doc["location"][1], doc["location"][0]),
              builder: (ctx) => Container(
                child: GestureDetector(
                  onTap: (() => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LocationInfo(
                          address: doc["address"],
                          type: doc["type"],
                          name: doc["name"],
                          images: doc["images"],
                          no: doc["mobile"].toString(),
                        );
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
          );

          setState(() {});
          print("here");
          print(data);
          print(search);
        });
        // print(providers);
        // print(locations);
      });
    }

    print("here");
    print(loc);
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
                markers: markers,
                // [

                // Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: latLng.LatLng(loc[0][0], 78),
                //   builder: (ctx) => ListView.builder(
                //     itemCount: providers.length,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         child: GestureDetector(
                //           onTap: (() => Navigator.push(context,
                //                   MaterialPageRoute(builder: (context) {
                //                 return LocationInfo();
                //               }))),
                //           // ignore: prefer_const_constructors
                //           child: Icon(
                //             Icons.location_on,
                //             color: Colors.red,
                //             size: 50.0,
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: latLng.LatLng(17.54, 78.3863),
                //   builder: (ctx) => Container(
                //     child: GestureDetector(
                //       onTap: (() => Navigator.push(context,
                //               MaterialPageRoute(builder: (context) {
                //             return LocationInfo();
                //           }))),
                //       // ignore: prefer_const_constructors
                //       child: Icon(
                //         Icons.wheelchair_pickup,
                //         color: Colors.red,
                //         size: 50.0,
                //       ),
                //     ),
                //   ),
                // ),
                // Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: latLng.LatLng(17.29, 78.2358),
                //   builder: (ctx) => Container(
                //     child: GestureDetector(
                //       onTap: (() => Navigator.push(context,
                //               MaterialPageRoute(builder: (context) {
                //             return LocationInfo();
                //           }))),
                //       // ignore: prefer_const_constructors
                //       child: Icon(
                //         Icons.wheelchair_pickup,
                //         color: Colors.red,
                //         size: 50.0,
                //       ),
                //     ),
                //   ),
                // ),
                // Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: latLng.LatLng(17.5389, 78.4863),
                //   builder: (ctx) => Container(
                //     child: GestureDetector(
                //       onTap: (() => Navigator.push(context,
                //               MaterialPageRoute(builder: (context) {
                //             return LocationInfo();
                //           }))),
                //       // ignore: prefer_const_constructors
                //       child: Icon(
                //         Icons.location_city,
                //         color: Colors.red,
                //         size: 50.0,
                //       ),
                //     ),
                //   ),
                // ),
                // Marker(
                //   width: 80.0,
                //   height: 80.0,
                //   point: latLng.LatLng(17.6389, 78.363),
                //   builder: (ctx) => Container(
                //     child: GestureDetector(
                //       onTap: (() => Navigator.push(context,
                //               MaterialPageRoute(builder: (context) {
                //             return LocationInfo();
                //           }))),
                //       // ignore: prefer_const_constructors
                //       child: Icon(
                //         Icons.restaurant,
                //         color: Colors.red,
                //         size: 50.0,
                //       ),
                //     ),
                //   ),
                // ),
                // Marker(
                //     width: 80.0,
                //     height: 80.0,
                //     point: latLng.LatLng(17.4, 78.33),
                //     builder: (ctx) => Container(
                //       child: GestureDetector(
                //         onTap: (() => Navigator.push(context,
                //                 MaterialPageRoute(builder: (context) {
                //               return LocationInfo();
                //             }))),
                //         // ignore: prefer_const_constructors
                //         child: Icon(
                //           Icons.apartment,
                //           color: Colors.red,
                //           size: 50.0,
                //         ),
                //       ),
                //     ),
                //   ),
                // ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 35.0),
            child: TextField(
              controller: emailController,
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
              onChanged: (s) => filter(s),
            ),
          ),
        ],
      ),
    );
  }
}
