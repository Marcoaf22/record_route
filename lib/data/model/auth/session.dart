class Session {
  Session({
    required this.token,
    this.expiresIn = 86400,
    this.tokenType,
    this.createdAt,
  });

  String? token;
  String? tokenType;
  String? createdAt;
  int expiresIn;

  Session copyWith({
    int? branchDefault,
    String? token,
    String? tokenType,
    bool? requestBranch,
  }) {
    return Session(token: token ?? this.token);
  }

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      token: json["token"] ?? "",
      expiresIn: json["expiresIn"] ?? 86400,
      tokenType: json["tokenType"] ?? "",
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiresIn": expiresIn,
        "createdAt": createdAt,
        "tokenType": tokenType
      };
}
