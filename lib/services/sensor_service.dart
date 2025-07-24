import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/sensor_data.dart';

/// Custom Logger class for debugging
/// Logs messages only in debug mode
class SensorService {
  /// Stores the current sensor data

  SensorData sensorData = SensorData(temperature: 25.0, humidity: 50);

  /// Timers for sending temperature, humidity, and polling data

  Timer? _temperatureTimer;
  Timer? _humidityTimer;
  Timer? _pollingTimer;
  bool useWebSocket = false;

  /// Boolean to determine if WebSocket is used for communication

  WebSocketChannel? _webSocketChannel;

  /// Starts telemetry by initializing WebSocket or polling and sending data
  void startTelemetry() {
    _connectWebSocketIfNeeded();
    _sendTemperatureData();
    _sendHumidityData();
    if (!useWebSocket) _pollServerAttributes();
  }

  /// Connects to the WebSocket server if needed

  void _connectWebSocketIfNeeded() {
    if (useWebSocket && _webSocketChannel == null) {
      _webSocketChannel = WebSocketChannel.connect(
        Uri.parse('ws://127.0.0.1:1234'),
      );
      _webSocketChannel!.stream.listen(
        (message) {
          print('Received from server: $message');
          // Example : message = "Unit: °C)"
          if (message.startsWith('Unit: ')) {
            sensorData.temperatureUnit = message.split('Unit: ')[1];
          }
        },
        onDone: () => _webSocketChannel = null,
        onError: (error) => _webSocketChannel = null,
      );
    }
  }

  /// Sends temperature data periodically

  void _sendTemperatureData() {
    _temperatureTimer?.cancel();
    _temperatureTimer = Timer.periodic(
      Duration(seconds: sensorData.isActiveMode ? 10 : 20),
      (timer) async {
        final tempData =
            'Temperature: ${sensorData.temperature}${sensorData.temperatureUnit}';
        if (useWebSocket && _webSocketChannel != null) {
          _webSocketChannel!.sink.add(tempData);
        } else {
          print(tempData);
          // await http.post(...);
        }
      },
    );
  }

  /// Sends humidity data periodically

  void _sendHumidityData() {
    _humidityTimer?.cancel();
    _humidityTimer = Timer.periodic(
      Duration(seconds: sensorData.isActiveMode ? 20 : 50),
      (timer) async {
        final humData = 'Humidity: ${sensorData.humidity}%';
        if (useWebSocket && _webSocketChannel != null) {
          _webSocketChannel!.sink.add(humData);
        } else {
          print(humData);
          // await http.post(...);
        }
      },
    );
  }

  /// Polls the server periodically for attributes like temperature unit

  void _pollServerAttributes() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(
      Duration(seconds: sensorData.isActiveMode ? 10 : 20),
      (timer) async {
        print('Polling server attributes...');
        // Simulates receiving temperature unit from the server

        sensorData.temperatureUnit = '°C';
        // await http.get(...);
      },
    );
  }

  /// Toggles between active and passive modes and restarts telemetry

  void toggleMode() {
    sensorData.isActiveMode = !sensorData.isActiveMode;
    startTelemetry();
  }

  /// Toggles between WebSocket and HTTP communication

  void toggleConnectionType() {
    useWebSocket = !useWebSocket;
    if (!useWebSocket) {
      _webSocketChannel?.sink.close();
      _webSocketChannel = null;
    }
    startTelemetry();
  }

  /// Updates the temperature value and sends it to the server

  void setTemperature(double temp) {
    sensorData.temperature = double.parse(temp.toStringAsFixed(1));
    if (useWebSocket && _webSocketChannel != null) {
      _webSocketChannel!.sink.add('ClientAttr: Temp set to $temp');
    }
  }

  void setHumidity(int hum) {
    sensorData.humidity = hum.clamp(0, 100);
    if (useWebSocket && _webSocketChannel != null) {
      _webSocketChannel!.sink.add('ClientAttr: Humidity set to $hum');
    }
  }

  /// Disposes all resources to avoid memory leaks

  void dispose() {
    _temperatureTimer?.cancel();
    _humidityTimer?.cancel();
    _pollingTimer?.cancel();
    _webSocketChannel?.sink.close();
    _webSocketChannel = null;
  }
}
