class AppUser {
  final int id;
  final String email;
  String displayName;
  String firstName;
  String lastName;
  String? jwtToken;
  final String? profilePictureUrl;

  AppUser({
    required this.id,
    required this.email,
    required this.displayName,
    required this.firstName,
    required this.lastName,
    this.jwtToken,
    required this.profilePictureUrl,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profilePictureUrl: json['profilePicture'] != null
          ? 'http://159.65.15.249:1337${json['profilePicture']['url']}'
          : null,
    );
  }
}
