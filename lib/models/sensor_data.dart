class SensorData {
  double temperature; // En Celsius par défaut
  int humidity; // En pourcentage
  bool isActiveMode;
  String temperatureUnit; // Unité reçue du serveur

  SensorData({
    required this.temperature,
    required this.humidity,
    this.isActiveMode = true,
    this.temperatureUnit = '°C', // Par défaut Celsius
  });
}
