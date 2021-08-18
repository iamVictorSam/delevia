import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/drawerScreen.dart';
import 'package:delevia_app/request/google_map_request.dart';
import 'package:delevia_app/screens/history/history.dart';
import 'package:delevia_app/screens/my_wallet/wallet.dart';
import 'package:delevia_app/screens/profile/profile.dart';
import 'package:delevia_app/screens/promotion/promotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locator;
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
      drawer: createDrawer(context),
      body: Map(),
      // Stack(
      //   children: [
      //     DrawerScreen(),
      //     Map(),
      //   ],
      // ),
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
  // static LatLng _initialPosition;
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  GoogleMapServices _googleMapServices = GoogleMapServices();
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _getUserLocation();
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  // bool isOpen = false;

  bool isTaped = false;
  @override
  Widget build(BuildContext context) {
    // return AnimatedContainer(
    //   transform: Matrix4.translationValues(xOffset, yOffset, 0)
    //     ..scale(scaleFactor),
    //   duration: Duration(milliseconds: 250),
    //   decoration: BoxDecoration(
    //       // boxShadow: [
    //       //  BoxShadow(
    //       //   color: Color(0xFF333335),
    //       //   offset: Offset(1.0, 5.0),
    //       //   blurRadius: 7,
    //       //   spreadRadius: 2,
    //       // ),
    //       // ],
    //       borderRadius: BorderRadius.circular(isOpen ? 40 : 0),
    //       color: Colors.grey[200]),
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child:
            // _initialPosition == null
            //     ? Container(
            //         alignment: Alignment.center,
            //         child: Center(child: CircularProgressIndicator()),
            //       )
            //     :
            Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialPosition, zoom: 10),
              onMapCreated: onCreate,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              markers: _markers,
              onCameraMove: onCameraMove,
              polylines: _polyLines,
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
              top: 20,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffdbdbdb),
                      blurRadius: 7,
                      offset: Offset(1, 1),
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: SvgPicture.asset("assets/icon/menu-line.svg"),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                    print('pressed');
                    // setState(() {
                    //   xOffset = 230;
                    //   yOffset = 150;
                    //   scaleFactor = 0.6;
                    //   // isOpen = true;
                    // });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTaped = !isTaped;
                    });
                  },
                  child: bottomModal(
                    context,
                    () {
                      setState(() {
                        isTaped = !isTaped;
                      });
                    },
                  )),
            ),
            isTaped
                ? Positioned(
                    bottom: 0,
                    child: searchModal(context),
                  )
                : Container(),

            isTaped
                ? Positioned(
                    top: 0,
                    child: buildTextField(
                        context,
                        () {
                          setState(() {
                            isTaped = !isTaped;
                          });
                        },
                        locationController: locationController,
                        destinationController: destinationController,
                        sendRequest: (value) {
                          sendRequest(value);
                        }),
                  )
                : Container(),
            // SizedBox(height: getScreenHeight(15)),
          ],
        ),
      ),
    );
  }

  void _addMarker(LatLng location, String address) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(
            _lastPosition.toString(),
          ),
          position: location,
          infoWindow: InfoWindow(title: address, snippet: 'go here'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  void createRoute(String encodedPolyline) {
    setState(() {
      _polyLines.add(
        Polyline(
          polylineId: PolylineId(
            _lastPosition.toString(),
          ),
          width: 10,
          color: kPrimaryColor,
          points: convertToLatLng(decodePoly(encodedPolyline)),
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

// this method will convert list of doubles into latlng
  List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (1 % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;

    // repeating untill all attribute are decoded

    do {
      var shift = 0;
      int result = 0;

      // for decoding values of one attritube

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);

      // if the value is negative then bitwise not the value
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    // adding previous value as done in encoding

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // List<Placemark> placeMark = await PlacemarkFromCordinates();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      // _initialPosition = LatLng(position.latitude, position.longitude);
      locationController.text = placemarks[0].name;
    });
  }

  void sendRequest(String intendedLocation) async {
    List<Location> placeMark = await locationFromAddress(intendedLocation);
    double latitude = placeMark[0].latitude;
    double longitude = placeMark[0].longitude;

    LatLng destination = LatLng(latitude, longitude);

    _addMarker(destination, intendedLocation);

    String route = await _googleMapServices.getRouteCordinate(
        _initialPosition, destination);

    createRoute(route);
  }
}

Widget createDrawer(BuildContext context) {
  Color color = Color(0xFFD5C6E6);
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        height: getScreenHeight(40),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 30),
        color: kPrimaryColor,
        child: Column(children: [
          SizedBox(
            height: getScreenHeight(12),
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xfffafafa),
            child: SvgPicture.asset('assets/icon/user-line.svg', height: 35),
          ),
          SizedBox(
            height: getScreenHeight(2.5),
          ),
          Text(
            'Irene Delevia',
            style: TextStyle(
              fontSize: getScreenHeight(2.8),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getScreenHeight(1),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ProfileScreen());
            },
            child: Text(
              'Edit profile',
              style: TextStyle(
                fontSize: getScreenHeight(2),
                color: color,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
      // Center(
      //   child: UserAccountsDrawerHeader(
      //     accountName: Text("Irene Delevia"),
      //     accountEmail: Text("Edit profile"),
      //     currentAccountPicture: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: SvgPicture.asset('assets/icon/user-line.svg'),
      //     ),
      //   ),
      // ),
      // Container(
      //   color: Theme.of(context).canvasColor,
      //   child: DrawerHeader(
      //     child: Text(
      //       'Navigation Drawer',
      //       style: TextStyle(
      //         fontSize: getScreenHeight(2.8),
      //       ),
      //     ),
      //   ),
      // ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(6.0)),
        child: Column(
          children: [
            ListTile(
                leading: SvgPicture.asset('assets/icon/bank-card-line.svg'),
                title: Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  // Get.to();
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/wallet-line.svg'),
                title: Text(
                  'My Wallet',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(WalletScreen());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/price-tag-3-line.svg'),
                title: Text(
                  'Promotions',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(PromotionScreen());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/history-line.svg'),
                title: Text(
                  'Ride history',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(HistoryScreen());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/car-line.svg'),
                title: Text(
                  'Own a car',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  // Get.to(Promotions());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/information-line.svg'),
                title: Text(
                  'Support',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  // Get.to(Promotions());
                }),
            SizedBox(
              height: getScreenHeight(2.8),
            ),
            DefaultButton(
              press: () {},
              text: 'Sign up to drive',
            ),
          ],
        ),
      ),
    ],
  ));
}

// void modalBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (builder) {
//         return bottomModal(context);
//       });
// }

Widget bottomModal(BuildContext context, Function press) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    height: getScreenHeight(37),
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
            GestureDetector(
              onTap: press,
              child: Container(
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
                        child: SvgPicture.asset("assets/icon/search-line.svg"),
                      ),
                      // SizedBox(width: getScreenWidth(4)),
                      Text('Where are you going?',
                          style: TextStyle(color: Color(0xff929292))),
                    ],
                  )),
            ),
            SizedBox(height: getScreenHeight(2)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: getScreenHeight(9),
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
              height: getScreenHeight(9),
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

Widget searchModal(
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: getScreenHeight(77),
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
            // SizedBox(height: getScreenHeight(2)),
            // Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10),
            //         ),
            //         color: kGrey2),
            //     height: getScreenHeight(7),
            //     width: double.infinity,
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding:
            //               EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
            //           child: Icon(Icons.search),
            //         ),
            //         // SizedBox(width: getScreenWidth(4)),
            //         Text('Where are you going?',
            //             style: TextStyle(color: Color(0xff929292))),
            //       ],
            //     )),
            SizedBox(height: getScreenHeight(5)),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home_outlined, color: Colors.grey[400]),
                radius: 15,
                backgroundColor: blueGrey,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              trailing: SvgPicture.asset(
                'assets/icon/edit-line.svg',
                // color: Colors.red,
                height: 25,
                width: 30,
                // fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getScreenWidth(16.5)),
              child: Divider(),
            ),
            ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset(
                  'assets/icon/briefcase.svg',
                  color: Colors.grey[400],
                  height: 15,
                  // width: 30,
                  // fit: BoxFit.fill,
                ),
                radius: 15,
                backgroundColor: blueGrey,
              ),
              title: Text(
                'Work',
                style: TextStyle(color: Colors.black),
              ),
              trailing: SvgPicture.asset(
                'assets/icon/edit-line.svg',
                // color: Colors.red,
                height: 25,
                width: 30,
                // fit: BoxFit.fill,
              ),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset('assets/icon/map-pin-line.svg'),
              title: Text('University of PortHarcourt'),
              subtitle: Text('Rivers State',
                  style: TextStyle(
                    color: blueGrey,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: getScreenWidth(16.5)),
              child: Divider(),
            ),
            ListTile(
              leading: SvgPicture.asset('assets/icon/map-pin-line.svg'),
              title: Text('Boys Lodge, Alakahia'),
              subtitle: Text('Rivers State',
                  style: TextStyle(
                    color: blueGrey,
                  )),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildTextField(
  BuildContext context,
  Function pressed, {
  TextEditingController locationController,
  TextEditingController destinationController,
  Function sendRequest,
}) {
  return Container(
      height: getScreenHeight(26.4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF3F3F5),
            offset: Offset(1.0, 5.0),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: getScreenWidth(2.5)),
                child: IconButton(
                  icon: Icon(Icons.close, size: getScreenHeight(5)),
                  onPressed: pressed,
                ),
              ),
              SizedBox(
                width: getScreenWidth(13),
              ),
              Text(
                'Enter destination',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenHeight(3),
                ),
              ),
            ],
          ),
          TextField(
            controller: locationController,
            autofocus: true,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'pick up',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15,
                top: 16,
              ),
              icon: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15),
                child: SvgPicture.asset(
                  'assets/icon/ic location.svg',
                  height: 25,
                  width: 30,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getScreenWidth(15),
              right: getScreenWidth(4),
            ),
            child: Divider(),
          ),
          TextField(
            controller: destinationController,
            cursorColor: kPrimaryColor,
            textInputAction: TextInputAction.go,
            onSubmitted: sendRequest,
            decoration: InputDecoration(
              hintText: 'destination?',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15,
                top: 16,
              ),
              icon: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  top: 5,
                ),
                width: getScreenWidth(1.3),
                height: getScreenHeight(
                  getScreenHeight(0.9),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 15),
                  child: SvgPicture.asset(
                    'assets/icon/map-pin-fill.svg',
                    color: Colors.red,
                    height: 25,
                    width: 30,
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
