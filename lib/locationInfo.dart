// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LocationInfo extends StatefulWidget {
  const LocationInfo({Key? key}) : super(key: key);

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Location Information'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.1, vertical: deviceHeight * 0.01),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Column(
                children: [
                  Text(
                    'PVR Forum Sujana Mall',
                    style: TextStyle(
                        color: Colors.blue, fontSize: deviceHeight * 0.03),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  Text(
                    'Cinema Theater',
                    style: TextStyle(
                        color: Colors.blue, fontSize: deviceHeight * 0.03),
                  ),
                ],
              )),
              Image.network(
                'https://www.localguidesconnect.com/t5/image/serverpage/image-id/284859i9764854481F94022/image-size/large?v=v2&px=999',
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.3,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact No :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceHeight * 0.025),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.005,
                  ),
                  Text(
                    ' +91 9515172100',
                    style: TextStyle(fontSize: deviceHeight * 0.025),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pincode :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceHeight * 0.025),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.005,
                  ),
                  Text(
                    ' 500085',
                    style: TextStyle(fontSize: deviceHeight * 0.025),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceHeight * 0.025),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.005,
                  ),
                  Text(
                    'Kukatpally Housing Board Rd, K P H B Phase 9, Kukatpally, Hyderabad, Telangana',
                    style: TextStyle(fontSize: deviceHeight * 0.025),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Services Provided :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceHeight * 0.025),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.005,
                  ),
                  Text(
                    '• Wheel Chair',
                    style: TextStyle(fontSize: deviceHeight * 0.025),
                  ),
                  Text(
                    '• Reserved Elivators',
                    style: TextStyle(fontSize: deviceHeight * 0.025),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
