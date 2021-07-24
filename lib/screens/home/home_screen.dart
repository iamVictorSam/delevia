import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../SizeConfig.dart';
import '../../SizeConfig.dart';
import '../../SizeConfig.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Map(),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  static const _initialPosition = LatLng(4.8875368, 6.9218589);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration(seconds: 1), () {
    //   showModalBottomSheet(
    //       context: context,
    //       builder: (builder) {
    //         return bottomModal(context);
    //       });
    // });

    // modalBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: modalBottomSheet(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialPosition, zoom: 20),
            onMapCreated: onCreate,
            myLocationEnabled: true,
            mapType: MapType.satellite,
            compassEnabled: true,
            markers: _markers,
            onCameraMove: onCameraMove,
          ),

          // Positioned(
          //   top: 40,
          //   right: 10,
          //   child: FloatingActionButton(
          //     onPressed: _onAddMarkerPressed,
          //     tooltip: 'Add Location',
          //     backgroundColor: kPrimaryColor,
          //     child: Icon(
          //       Icons.add_location,
          //       color: Colors.white,
          //     ),
          //   ),
          // )
          Positioned(
            bottom: 0,
            child: bottomModal(context),
          ),
          // SizedBox(height: getScreenHeight(15)),
        ],
      ),
    );
  }

  void _onAddMarkerPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(
            _lastPosition.toString(),
          ),
          position: _lastPosition,
          infoWindow:
              InfoWindow(title: 'remember here', snippet: 'Found somewhere'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  void onCreate(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition = position.target;
    });
  }
}

// void modalBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (builder) {
//         return bottomModal(context);
//       });
// }

Widget bottomModal(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    height: getScreenHeight(34),
    width: MediaQuery.of(context).size.width,
    // color: Colors.white,
    child: GestureDetector(
      onTap: () {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => RegSelection()),
        //     (route) => false);
      },
      // Navigator.pushAndRemoveUntil(
      //   context,
      // MaterialPageRoute(builder: (context) => RegSelection()),
      // ),

      // Get.off(RegSelection(), transition: Transition.cupertino),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: getScreenHeight(3)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: kGrey),
              height: getScreenHeight(0.7),
              width: getScreenWidth(10),
            ),
            SizedBox(height: getScreenHeight(2)),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: kGrey2),
                height: getScreenHeight(7),
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
                      child: Icon(Icons.search),
                    ),
                    // SizedBox(width: getScreenWidth(4)),
                    Text('Where are you going?',
                        style: TextStyle(color: Color(0xff929292))),
                  ],
                )),
            SizedBox(height: getScreenHeight(2)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: getScreenHeight(8),
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.location_on,
                        size: getScreenHeight(3.7),
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: blueGrey,
                    ),
                  ),
                  // SizedBox(width: getScreenWidth(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenHeight(1.5),
                      ),
                      Text(
                        'River State University',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'River',
                        style: TextStyle(color: blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getScreenWidth(16.5)),
              child: Divider(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: getScreenHeight(8),
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.location_on,
                        size: getScreenHeight(3.7),
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: blueGrey,
                    ),
                  ),
                  // SizedBox(width: getScreenWidth(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenHeight(1.5),
                      ),
                      Text(
                        'UniPort',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Port-Harcourt Nigeria',
                        style: TextStyle(color: blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
