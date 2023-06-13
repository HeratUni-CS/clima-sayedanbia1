import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';

class location{

  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;

    } catch (e) {
      print(e);
    }
  }
}