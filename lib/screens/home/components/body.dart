import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/request/google_map_request.dart';
import 'package:delevia_app/screens/add_card/add_card.dart';
import 'package:delevia_app/screens/history/history.dart';
import 'package:delevia_app/screens/home/components/drawer.dart';
import 'package:delevia_app/screens/home/components/search.dart';
import 'package:delevia_app/screens/home/components/textfieldArea.dart';
import 'package:delevia_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  GoogleMapController mapController;
  // static const _initialPosition = LatLng(4.8875368, 6.9218589);
  static LatLng _initialPosition;
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

    _getUserLocation();
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool contactDriver = false;

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
        child: _initialPosition == null
            ? Container(
                alignment: Alignment.center,
                child: Center(child: CircularProgressIndicator()),
              )
            : Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: _initialPosition, zoom: 25),
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
                  // ),
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
                        // child: contactDriver
                        //     ? SelectCar(
                        //         carType: 'E',
                        //         rideTime: '4',
                        //         rideType: 'e',
                        //         price: '400')
                        // :
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
                                setState(() {
                                  isTaped = !isTaped;
                                  contactDriver = true;
                                });
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
      _polyLines.clear();
      _polyLines.add(
        Polyline(
          polylineId: PolylineId(
            _lastPosition.toString(),
          ),
          width: 3,
          color: kPrimaryColor,
          points: _convertToLatLng(decodePoly(encodedPolyline)),
        ),
      );
      // // _polylines.
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
  // List<LatLng> convertToLatLng(List points) {
  //   List<LatLng> result = <LatLng>[];
  //   for (int i = 0; i < points.length; i++) {
  //     if (1 % 2 != 0) {
  //       result.add(LatLng(points[i - 1], points[i]));
  //     }
  //   }
  //   return result;
  // }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
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
      _initialPosition = LatLng(position.latitude, position.longitude);
      locationController.text = placemarks[0].name;
    });
  }

  void sendRequest(String intendedLocation) async {
    List placeMark = await locationFromAddress(intendedLocation);
    double latitude = placeMark[0].latitude;
    double longitude = placeMark[0].longitude;

    LatLng destination = LatLng(latitude, longitude);

    _addMarker(destination, intendedLocation);

    String route = await _googleMapServices.getRouteCordinate(
        _initialPosition, destination);

    createRoute(route);
  }
}

