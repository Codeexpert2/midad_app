// To parse this JSON data, do
//
//     final journalModel = journalModelFromJson(jsonString);

import 'dart:convert';

JournalModel journalModelFromJson(String str) =>
    JournalModel.fromJson(json.decode(str));

String journalModelToJson(JournalModel data) => json.encode(data.toJson());

class JournalModel {
  JournalModel({
    // this.meta,
    this.data,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) => JournalModel(
        // meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
        data: json['data'] == null
            ? []
            : List<Journal>.from(json['data']!.map((x) => Journal.fromJson(x))),
      );
  // Meta? meta;
  List<Journal>? data;

  Map<String, dynamic> toJson() => {
        // 'meta': meta?.toJson(),
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Journal {
  Journal({
    this.id,
    this.title,
    this.body,
    this.slug,
    this.url,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        slug: json['slug'],
        url: json['url'],
        userId: json['user_id'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        user: json['user'] == null ? null : User.fromJson(json['user']),
      );
  int? id;
  String? title;
  String? body;
  String? slug;
  String? url;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'slug': slug,
        'url': url,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.userType,
    this.image,
    this.phone,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.googleId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        lastName: json['last_name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at']),
        twoFactorSecret: json['two_factor_secret'],
        twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
        twoFactorConfirmedAt: json['two_factor_confirmed_at'],
        userType: json['user_type'],
        image: json['image'],
        phone: json['phone'],
        isBlocked: json['is_blocked'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        googleId: json['google_id'],
      );
  int? id;
  String? name;
  String? lastName;
  String? email;
  DateTime? emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  String? userType;
  dynamic image;
  dynamic phone;
  int? isBlocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic googleId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'last_name': lastName,
        'email': email,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'two_factor_secret': twoFactorSecret,
        'two_factor_recovery_codes': twoFactorRecoveryCodes,
        'two_factor_confirmed_at': twoFactorConfirmedAt,
        'user_type': userType,
        'image': image,
        'phone': phone,
        'is_blocked': isBlocked,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'google_id': googleId,
      };
}

// class Meta {
//   Meta({
//     this.currentPage,
//     this.lastPage,
//     this.perPage,
//     this.total,
//     this.hasMore,
//     this.hasPrev,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json['current_page'],
//         lastPage: json['last_page'],
//         perPage: json['per_page'],
//         total: json['total'],
//         hasMore: json['has_more'],
//         hasPrev: json['has_prev'],
//       );
//   int? currentPage;
//   int? lastPage;
//   int? perPage;
//   int? total;
//   bool? hasMore;
//   bool? hasPrev;

//   Map<String, dynamic> toJson() => {
//         'current_page': currentPage,
//         'last_page': lastPage,
//         'per_page': perPage,
//         'total': total,
//         'has_more': hasMore,
//         'has_prev': hasPrev,
//       };
// }
