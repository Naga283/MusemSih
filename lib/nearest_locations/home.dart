import 'dart:math';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:museum/models/appColor.dart';
import 'package:museum/nearest_locations/screen1.dart';

import 'data.dart';
import 'maps.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Location2 distanceData = Location2(lat: 28.6119, long: 77.2193);
  Location currentLocation = Location();

  void getLocation() async {
    var location = await currentLocation.getLocation();
    var k = {};
    for (var i in data) {
      k[calculateDistance(
              location.latitude!, location.longitude!, i.lat, i.long)] =
          data.indexOf(i);
    }
    var d = k.keys.toList();
    d.sort();
    distanceData = Location2(lat: data[d[0]].lat, long: data[d[0]].long);
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  List<Widget> getAllCafes(BuildContext context) {
    var l = <Widget>[];
    Size size = MediaQuery.of(context).size;
    List pics = [
      "RCOEM.jpeg",
      "Natural History Museum.jpg",
      "Central Museum Nagpur.jpeg"
    ];
    for (var i in data) {
      l.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            // setState(() {
            //                     MapUtils.openmap(Location2(
            //                         lat: data[id].lat, long: data[id].long));
            //                   });
            // setState(() {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
                    // builder: (context) => Screen1(
            //               id: data.indexOf(i),
            //               pic: 'assets/images/' + pics[data.indexOf(i)],
            //             )),
            //   );
            // });
          },
          child: Container(
            height: size.height * 0.25,
            width: size.width * 0.46,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.blue.withAlpha(40),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      i.name,
                      style: TextStyle(
                          fontSize: size.height * 0.015,
                          fontWeight: FontWeight.bold),
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/' + pics[data.indexOf(i)])),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.appBarColor,
            centerTitle: true,
            title: const Text("Nearest Musems"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Stack(children: [
                  SizedBox(
                    height: size.height * 0.5,
                    child: MapsScreen(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Colors.white),
                                height: size.height * 0.05,
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6.0, right: 6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.navigation,
                                        size: size.height * 0.025,
                                      ),
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: size.width * 0.9,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.green.withAlpha(40)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Center(
                                  child: GestureDetector(
                                onTap: () {
                                  MapUtils.openmap(distanceData);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Navigate to nearest museums',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.navigate_next,
                                    )
                                  ],
                                ),
                              )),
                            )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: getAllCafes(context),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
