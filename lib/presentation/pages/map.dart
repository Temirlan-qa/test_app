import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<YandexMapController> _completer = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: YandexMap(
              onMapCreated: _onMapCreated,
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: _zoomIn,
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: _zoomOut,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(YandexMapController controller) {
    _completer.complete(controller);
    controller.moveCamera(
      CameraUpdate.newBounds(
        const BoundingBox(
          northEast: Point(
            latitude: 43.2389,
            longitude: 76.8897,
          ),
           southWest: Point(
            latitude: 43.2389,
            longitude: 76.8897,
          ),
        ),
      ),
    );
  }

  Future<void> _zoomIn() async {
    YandexMapController controller = await _completer.future;
    controller.moveCamera(CameraUpdate.zoomIn());
  }

  Future<void> _zoomOut() async {
    YandexMapController controller = await _completer.future;
    controller.moveCamera(CameraUpdate.zoomOut());
  }
}
