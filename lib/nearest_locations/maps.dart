import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:museum/nearest_locations/data.dart';

import 'package:url_launcher/url_launcher.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? mapController;
  Location currentLocation = Location();
  final LatLng _center = const LatLng(17.447369, 78.353196);

  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers[MarkerId("home")] = Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getLocation();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.clear();
      for (final office in data) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.long),
          infoWindow: InfoWindow(
            title: office.name,
            snippet:
                "FCI Employees Cooperative Housing Society, Indira Nagar, Gachibowli, Hyderabad,",
          ),
          onTap: () {},
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        );
        _markers[marker.markerId] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      liteModeEnabled: false,
      onMapCreated: _onMapCreated,
      markers: _markers.values.toSet(),
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 12.0,
      ),
    );
  }
}

class Location2 {
  double lat, long;
  Location2({required this.lat, required this.long});
}

class MapUtils {
  static Future<void> openmap(Location2 destination) async {
    String url =
        "https://www.google.com/maps/dir/?api=1&destination=${destination.lat},${destination.long}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not open';
    }
  }
}
