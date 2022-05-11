class Appliance {
  final String name;
  final String iconPath;
  final String? imagePath;
  final String repairCost;
  final String setupCost;
  final String applianceLocation;
  Appliance({
    required this.name,
    required this.iconPath,
    this.imagePath,
    required this.repairCost,
    required this.setupCost,
    required this.applianceLocation,
  });
}
