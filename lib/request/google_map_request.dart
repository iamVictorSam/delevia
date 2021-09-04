import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = "AIzaSyCWmG9Ea98O1RgB1j-oUR8AtlQCcTueTwM";

class GoogleMapServices {
  Future<String> getRouteCordinate(LatLng l1, LatLng l2) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    Map value = jsonDecode(response.body);

    return value["routes"][0]["overview_polyline"]["points"];
  }
}
