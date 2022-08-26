class LooCafe {
  String name;
  double lat, long;
  double? dist;
  LooCafe(
      {required this.name, required this.lat, required this.long, this.dist});
}

var data = [
  LooCafe(name: "RCOEM Museum", lat: 21.17635, long: 79.06192),
  LooCafe(name: "Central Museum Nagpur", lat: 21.19082, long: 79.1001299),
  LooCafe(
      name: "Dr. Babasaheb Ambedkar Memorial Museum",
      lat: 18.5242,
      long: 73.8300),
  // LooCafe(
  //     name: "Surendrapuri", lat: 17.565130688960146, long: 78.94524303932843),
  // LooCafe(name: " Loocafe Pan shop", lat: 17.442537, long: 78.371631),
  // LooCafe(name: " Loocafe mobile shop", lat: 17.495233, long: 78.322881),
  // LooCafe(name: " loocafe mobileshop", lat: 17.495259, long: 78.319931),
  // LooCafe(name: " loocafe mobile", lat: 17.495003, long: 78.320401),
  // LooCafe(name: " loocafe KBR park", lat: 17.4237311, long: 78.4247392),
  // LooCafe(name: " loocafe Shiparamam", lat: 17.453848, long: 78.379611),
  // LooCafe(name: " loocafe Necklace Road", lat: 17.411851, long: 78.471165),
  // LooCafe(name: " loocafe Sangareddy", lat: 17.619588, long: 78.081671),
  // LooCafe(name: " loocafe Banjarahills", lat: 17.422514, long: 78.449153),
];
