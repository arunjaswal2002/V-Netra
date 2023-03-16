import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var location = "";
  var phoneNumber = "8558964950";
  void getMyCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      location =
          "Latitude : ${position.latitude}, \nLongitude : ${position.longitude}";
    });
  }

  Future<void> _openMap(String location) async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    MapsLauncher.launchCoordinates(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Location'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.location_on,
                size: 46,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Get my Location',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                location,
              ),
              TextButton(
                  onPressed: getMyCurrentLocation,
                  child: const Text("Get Current location")),
              ElevatedButton(
                  onPressed: () {
                    _openMap(location);
                  },
                  child: Text('Open on map')),
              ElevatedButton(
                onPressed: () async {
                  var position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  launch(
                      "https://wa.me/$phoneNumber?text=My%20live%20location:%20https://www.google.com/maps?q=$position,$position");
                },
                child: const Text('Share Location with family'),
              )
            ],
          ),
        ));
  }
}
