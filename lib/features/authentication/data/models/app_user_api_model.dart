class AppUserApiModel {
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
  final List<RoleApi> roles;
  final AccountTypeApi accountType;

  AppUserApiModel({
    required this.id,
    required this.username,
    required this.email,
    required this.statusUser,
    this.emailVerifiedAt,
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
    this.expirationMembershipDate,
    this.recoveryCode,
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

  factory AppUserApiModel.fromJson(Map<String, dynamic> json) {
    return AppUserApiModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      statusUser: json['statusUser'],
      emailVerifiedAt: json['emailVerifiedAt'] != null
          ? DateTime.parse(json['emailVerifiedAt'])
          : null,
      name: json['name'],
      lastName: json['lastName'],
      dateBirth: DateTime.parse(json['dateBirth']),
      phone: json['phone'],
      idCountry: json['idCountry'],
      idDocumentType: json['idDocumentType'],
      nroDocument: json['nroDocument'],
      idAccountType: json['idAccountType'],
      idReferrerSponsor: json['idReferrerSponsor'],
      request: json['request'],
      expirationDate: DateTime.parse(json['expirationDate']),
      position: json['position'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      photo: json['photo'],
      biography: json['biography'],
      statusPreference: json['statusPreference'],
      userType: json['userType'],
      dailyQuizzStatus: json['dailyQuizzStatus'],
      city: json['city'],
      expirationMembershipDate: json['expirationMembershipDate'] != null
          ? DateTime.parse(json['expirationMembershipDate'])
          : null,
      recoveryCode: json['recoveryCode'],
      recoveryAttempts: json['recoveryAttempts'],
      fullName: json['fullName'],
      leftPoints: json['LeftPoints'],
      rightPoints: json['RightPoints'],
      active: json['active'],
      qualified: json['qualified'],
      encid: json['encid'],
      membershipActive: json['membershipActive'],
      roles: (json['roles'] as List)
          .map((role) => RoleApi.fromJson(role))
          .toList(),
      accountType: AccountTypeApi.fromJson(json['accountType']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'statusUser': statusUser,
      'emailVerifiedAt': emailVerifiedAt?.toIso8601String(),
      'name': name,
      'lastName': lastName,
      'dateBirth': dateBirth.toIso8601String(),
      'phone': phone,
      'idCountry': idCountry,
      'idDocumentType': idDocumentType,
      'nroDocument': nroDocument,
      'idAccountType': idAccountType,
      'idReferrerSponsor': idReferrerSponsor,
      'request': request,
      'expirationDate': expirationDate.toIso8601String(),
      'position': position,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'photo': photo,
      'biography': biography,
      'statusPreference': statusPreference,
      'userType': userType,
      'dailyQuizzStatus': dailyQuizzStatus,
      'city': city,
      'expirationMembershipDate': expirationMembershipDate?.toIso8601String(),
      'recoveryCode': recoveryCode,
      'recoveryAttempts': recoveryAttempts,
      'fullName': fullName,
      'leftPoints': leftPoints,
      'rightPoints': rightPoints,
      'active': active,
      'qualified': qualified,
      'encid': encid,
      'membershipActive': membershipActive,
      'roles': roles.map((role) => role.toJson()).toList(),
      'accountType': accountType.toJson(),
    };
  }
}

class RoleApi {
  final int id;
  final String name;
  final String guardName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PivotApi pivot;

  RoleApi({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory RoleApi.fromJson(Map<String, dynamic> json) {
    return RoleApi(
      id: json['id'],
      name: json['name'],
      guardName: json['guardName'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      pivot: PivotApi.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'guardName': guardName,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'pivot': pivot.toJson(),
    };
  }
}

class PivotApi {
  final int modelId;
  final int roleId;
  final String modelType;

  PivotApi({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  factory PivotApi.fromJson(Map<String, dynamic> json) {
    return PivotApi(
      modelId: json['model_id'],
      roleId: json['role_id'],
      modelType: json['model_type'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'model_id': modelId,
      'role_id': roleId,
      'model_type': modelType,
    };
  }
}

class AccountTypeApi {
  final int id;
  final String account;
  final double price;
  final double iva;
  final double fastCashBonus;
  final double discPurchasesCourse;
  final double payInBinary;
  final double profitOnPurchases;
  final double profitOnPurchases2;
  final double comission;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int enrollmentDuration;
  final double discPurchasesCertificates;

  AccountTypeApi({
    required this.id,
    required this.account,
    required this.price,
    required this.iva,
    required this.fastCashBonus,
    required this.discPurchasesCourse,
    required this.payInBinary,
    required this.profitOnPurchases,
    required this.profitOnPurchases2,
    required this.comission,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.enrollmentDuration,
    required this.discPurchasesCertificates,
  });

  factory AccountTypeApi.fromJson(Map<String, dynamic> json) {
    return AccountTypeApi(
      id: json['id'],
      account: json['account'],
      price: json['price'].toDouble(),
      iva: json['iva'].toDouble(),
      fastCashBonus: json['fastCashBonus'].toDouble(),
      discPurchasesCourse: json['discPurchasesCourse'].toDouble(),
      payInBinary: json['payInBinary'].toDouble(),
      profitOnPurchases: json['profitOnPurchases'].toDouble(),
      profitOnPurchases2: json['profitOnPurchases2'].toDouble(),
      comission: json['comission'].toDouble(),
      status: json['status'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      enrollmentDuration: json['enrollmentDuration'],
      discPurchasesCertificates: json['discPurchasesCertificates'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'price': price,
      'iva': iva,
      'fastCashBonus': fastCashBonus,
      'discPurchasesCourse': discPurchasesCourse,
      'payInBinary': payInBinary,
      'profitOnPurchases': profitOnPurchases,
      'profitOnPurchases2': profitOnPurchases2,
      'comission': comission,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'enrollmentDuration': enrollmentDuration,
      'discPurchasesCertificates': discPurchasesCertificates,
    };
  }
}
