import 'package:promolider_app/features/authentication/domain/entities/account_type.dart';
import 'package:promolider_app/features/authentication/domain/entities/role.dart';

class AppUser {
  final int id;
  final String username;
  final String email;
  final String statusUser;
  final DateTime? emailVerifiedAt;
  final String name;
  final String lastName;
  final DateTime dateBirth;
  final String phone;
  final int idCountry;
  final int idDocumentType;
  final String nroDocument;
  final int idAccountType;
  final int idReferrerSponsor;
  final String request;
  final DateTime expirationDate;
  final String position;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String photo;
  final String biography;
  final String statusPreference;
  final int userType;
  final int dailyQuizzStatus;
  final String city;
  final DateTime? expirationMembershipDate;
  final String? recoveryCode;
  final int recoveryAttempts;
  final String fullName;
  final int leftPoints;
  final int rightPoints;
  final bool active;
  final bool qualified;
  final String encid;
  final bool membershipActive;
  final List<Role> roles;
  final AccountType accountType;

  AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.statusUser,
    this.emailVerifiedAt, //Because is null
    required this.name,
    required this.lastName,
    required this.dateBirth,
    required this.phone,
    required this.idCountry,
    required this.idDocumentType,
    required this.nroDocument,
    required this.idAccountType,
    required this.idReferrerSponsor,
    required this.request,
    required this.expirationDate,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.photo,
    required this.biography,
    required this.statusPreference,
    required this.userType,
    required this.dailyQuizzStatus,
    required this.city,
    this.expirationMembershipDate, // Because is null
    this.recoveryCode, //Because is null
    required this.recoveryAttempts,
    required this.fullName,
    required this.leftPoints,
    required this.rightPoints,
    required this.active,
    required this.qualified,
    required this.encid,
    required this.membershipActive,
    required this.roles,
    required this.accountType,
  });
}
