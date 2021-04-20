import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pre_prismetic/utils/widget/app_scaffold_wrapper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng latLng;
  final String text;

  const MapScreen({Key? key, required this.latLng, required this.text})
      : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final MarkerId markerId = MarkerId(widget.text);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: widget.latLng,
      infoWindow: InfoWindow(title: widget.text, snippet: '*'),
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWrapper(
        child: Scaffold(
      body: Container(
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: widget.latLng, zoom: 14),
          markers: Set<Marker>.of(markers.values), // YOUR MARKS IN MAP
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    ));
  }
}
