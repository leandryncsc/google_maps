import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:google_maps/app/data/domain/ui/pages/home/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = const CameraPosition(
    target: LatLng(39.307184, 22.938177),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
    );
    _markers[markerId] = marker;
    notifyListeners();
  }
}
