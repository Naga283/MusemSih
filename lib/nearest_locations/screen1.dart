import 'package:flutter/material.dart';
import 'package:museum/nearest_locations/data.dart';
import 'package:museum/nearest_locations/maps.dart';


class Screen1 extends StatefulWidget {
  int id;
  String pic;
  Screen1({Key? key, required int this.id, required String this.pic})
      : super(key: key);

  @override
  _Screen1State createState() => _Screen1State(id: this.id, pic: this.pic);
}

class _Screen1State extends State<Screen1> {
  int id;
  String pic;
  _Screen1State({required int this.id, required String this.pic});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                CircleAvatar(
                  foregroundImage: AssetImage('assets/suit.svg.png'),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Expanded(
                  child: Text(
                    'About' + data[id].name + ' LooCafe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.brown,
                          foregroundImage: AssetImage('assets/wifi.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('wifi')
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          foregroundImage: AssetImage('assets/san.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Sanatized')
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                          foregroundImage: AssetImage('assets/taxi.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Hygenic')
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          foregroundImage: AssetImage('assets/suit.svg.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Eco Run')
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.brown,
                          foregroundImage: AssetImage('assets/carrot.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('M/F')
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          foregroundImage: AssetImage('assets/card.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Free')
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                          foregroundImage: AssetImage('assets/gift.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Highly Rated')
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          foregroundImage: AssetImage('assets/burger.png'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Food')
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('Feedback'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(40),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Reviews'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {},
                    child: const Text('Gallery'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.25,
                  width: size.width * 0.88,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          fit: BoxFit.contain, image: AssetImage(this.pic))),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Navigate to ${data[id].name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withAlpha(80),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              //TODO: add location objects
                              setState(() {
                                MapUtils.openmap(Location2(
                                    lat: data[id].lat, long: data[id].long));
                              });
                            },
                            child: Icon(Icons.navigate_next)),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.red.withAlpha(40)),
              height: size.height * 0.1,
              width: size.width * 0.88,
            )
          ],
        ),
      ),
    );
  }
}
