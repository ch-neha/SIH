// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    Key? key,
    required this.name,
    required this.no,
    required this.type,
    required this.images,
    required this.address,
  }) : super(key: key);

  final String no;
  final String type;
  final String address;
  final List images;
  final String name;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    print(images);
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
      body: SingleChildScrollView(
        child: Container(
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
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: deviceHeight * 0.03,
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    Text(
                      type,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue, fontSize: deviceHeight * 0.03),
                    ),
                  ],
                )),
                // Expanded(
                //   child: ListView.builder(
                //       itemCount: images.length,
                //       itemBuilder: (context, index) {
                //         return
                //       }),
                // ),
                Image.network(
                  images[0]["url"],
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
                      'Contact No : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.025),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.005,
                    ),
                    Text(
                      no.toString(),
                      style: TextStyle(fontSize: deviceHeight * 0.025),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
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
                SizedBox(
                  height: deviceHeight * 0.02,
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
                      address,
                      style: TextStyle(fontSize: deviceHeight * 0.025),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
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
      ),
    );
  }
}
