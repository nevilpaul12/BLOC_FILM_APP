class PersonModel {
  final String id;
  final String gender;
  final String name;
  final String profilePath;
  final String knowForDepartment;
  final String popularity;

  PersonModel(
      {required this.id,
       required this.gender,
       required this.name,
        required this.profilePath,
       required this.knowForDepartment,
       required this.popularity});

  factory PersonModel.fromJson(dynamic json) {
    return PersonModel(
        id: json['id'].toString(),
    gender: json['gender']?.toString() ?? "", // Check for null and provide a default value if it's null
    name: json['name']?.toString() ?? "",
    profilePath: json['profile_path']?.toString() ?? "",
    knowForDepartment: json['known_for_department']?.toString() ?? "",
    popularity: json['popularity']?.toString() ?? "");
  }
}