class UserModel {
  final String id;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final Map<String, dynamic>? additionalData;

  UserModel({
    required this.id,
    required this.email,
    this.displayName,
    this.phoneNumber,
    this.additionalData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'additionalData': additionalData,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? phoneNumber,
    Map<String, dynamic>? additionalData,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}
