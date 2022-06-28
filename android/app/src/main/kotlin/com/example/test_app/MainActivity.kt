package com.example.test_app
import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("512461f0-9bae-4314-8b5e-f6ac5e4ead30")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}