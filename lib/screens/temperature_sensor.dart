import 'package:flutter/material.dart';
import '../services/sensor_service.dart';

/// This is the TemperatureSensor widget
/// It manages the temperature and humidity sensor data and updates the UI
class TemperatureSensor extends StatefulWidget {
  const TemperatureSensor({super.key});

  @override
  State<TemperatureSensor> createState() => _TemperatureSensorState();
}

class _TemperatureSensorState extends State<TemperatureSensor> {
  /// Service to handle sensor data
  final SensorService _sensorService = SensorService();
  final TextEditingController _tempController = TextEditingController();
  final TextEditingController _humController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// Starts the telemetry service to fetch sensor data
    _sensorService.startTelemetry();
    _tempController.text = _sensorService.sensorData.temperature.toString();
    _humController.text = _sensorService.sensorData.humidity.toString();

    /// Updates the UI immediately after the widget is built
    Future.delayed(Duration.zero, () {
      setState(() {}); // Initial render
    });

    /// Periodically updates the UI every second to reflect new sensor data
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) setState(() {});
      return mounted;
    });
  }

  @override
  void dispose() {
    /// Disposes the sensor service to free
    _sensorService.dispose();

    /// Disposes the text controllers to avoid memory leaks
    _tempController.dispose();
    _humController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          
        ],
      ),
    );
  }
}
