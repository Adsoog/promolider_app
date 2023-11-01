//import 'package:faker/faker.dart';
import 'package:promolider_app/features/auth/domain/entities/account_type.dart';
import 'package:promolider_app/features/auth/domain/entities/app_user.dart';
import 'package:promolider_app/features/auth/domain/entities/pivot.dart';
import 'package:promolider_app/features/auth/domain/entities/role.dart';
import 'package:promolider_app/features/auth/infrastructure/models/promolider_api/app_user_api_model.dart';
//import 'package:promolider_app/features/auth/infrastructure/models/fake_store_api/fake_store_user_model.dart';

// class AppUserMapper {
//   final faker = Faker();

//   AppUser fakeStoreUserToEntity(FakeStoreUserModel userModel) {
//     return AppUser(
//       name: userModel.name.firstname,
//       lastName: userModel.name.lastname,
//       username: userModel.username,
//       email: userModel.email,
//       bio: faker.lorem.sentence(),
//       status: faker.randomGenerator.boolean(),
//       role: 'Producer',
//       dni: faker.randomGenerator.integer(99999999, min: 11111111).toString(),
//       phone: userModel.phone,
//       birthday: faker.date.dateTime(),
//       country: faker.address.country(),
//       city: userModel.address.city,
//     );
//   }
// }

class AppUserMapper {
  // Convertir de AppUserApiModel a User (entidad)
  AppUser fromModelToEntity(AppUserApiModel model) {
    return AppUser(
      id: model.id,
      username: model.username,
      email: model.email,
      statusUser: model.statusUser,
      emailVerifiedAt: model.emailVerifiedAt,
      name: model.name,
      lastName: model.lastName,
      dateBirth: model.dateBirth,
      phone: model.phone,
      idCountry: model.idCountry,
      idDocumentType: model.idDocumentType,
      nroDocument: model.nroDocument,
      idAccountType: model.idAccountType,
      idReferrerSponsor: model.idReferrerSponsor,
      request: model.request,
      expirationDate: model.expirationDate,
      position: model.position,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      photo: model.photo,
      biography: model.biography,
      statusPreference: model.statusPreference,
      userType: model.userType,
      dailyQuizzStatus: model.dailyQuizzStatus,
      city: model.city,
      expirationMembershipDate: model.expirationMembershipDate,
      recoveryCode: model.recoveryCode,
      recoveryAttempts: model.recoveryAttempts,
      fullName: model.fullName,
      leftPoints: model.leftPoints,
      rightPoints: model.rightPoints,
      active: model.active,
      qualified: model.qualified,
      encid: model.encid,
      membershipActive: model.membershipActive,
      roles: model.roles
          .map((roleModel) => Role(
                id: roleModel.id,
                name: roleModel.name,
                guardName: roleModel.guardName,
                createdAt: roleModel.createdAt,
                updatedAt: roleModel.updatedAt,
                pivot: Pivot(
                  modelId: roleModel.pivot.modelId,
                  roleId: roleModel.pivot.roleId,
                  modelType: roleModel.pivot.modelType,
                ),
              ))
          .toList(),
      accountType: AccountType(
        id: model.accountType.id,
        account: model.accountType.account,
        price: model.accountType.price,
        iva: model.accountType.iva,
        fastCashBonus: model.accountType.fastCashBonus,
        discPurchasesCourse: model.accountType.discPurchasesCourse,
        payInBinary: model.accountType.payInBinary,
        profitOnPurchases: model.accountType.profitOnPurchases,
        profitOnPurchases2: model.accountType.profitOnPurchases2,
        comission: model.accountType.comission,
        status: model.accountType.status,
        createdAt: model.accountType.createdAt,
        updatedAt: model.accountType.updatedAt,
        enrollmentDuration: model.accountType.enrollmentDuration,
        discPurchasesCertificates: model.accountType.discPurchasesCertificates,
      ),
    );
  }

  // Convertir de User (entidad) a AppUserApiModel
  AppUserApiModel fromEntityToModel(AppUser entity) {
    return AppUserApiModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      statusUser: entity.statusUser,
      emailVerifiedAt: entity.emailVerifiedAt,
      name: entity.name,
      lastName: entity.lastName,
      dateBirth: entity.dateBirth,
      phone: entity.phone,
      idCountry: entity.idCountry,
      idDocumentType: entity.idDocumentType,
      nroDocument: entity.nroDocument,
      idAccountType: entity.idAccountType,
      idReferrerSponsor: entity.idReferrerSponsor,
      request: entity.request,
      expirationDate: entity.expirationDate,
      position: entity.position,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      photo: entity.photo,
      biography: entity.biography,
      statusPreference: entity.statusPreference,
      userType: entity.userType,
      dailyQuizzStatus: entity.dailyQuizzStatus,
      city: entity.city,
      expirationMembershipDate: entity.expirationMembershipDate,
      recoveryCode: entity.recoveryCode,
      recoveryAttempts: entity.recoveryAttempts,
      fullName: entity.fullName,
      leftPoints: entity.leftPoints,
      rightPoints: entity.rightPoints,
      active: entity.active,
      qualified: entity.qualified,
      encid: entity.encid,
      membershipActive: entity.membershipActive,
      roles: entity.roles
          .map((roleEntity) => RoleApi(
                id: roleEntity.id,
                name: roleEntity.name,
                guardName: roleEntity.guardName,
                createdAt: roleEntity.createdAt,
                updatedAt: roleEntity.updatedAt,
                pivot: PivotApi(
                  modelId: roleEntity.pivot.modelId,
                  roleId: roleEntity.pivot.roleId,
                  modelType: roleEntity.pivot.modelType,
                ),
              ))
          .toList(),
      accountType: AccountTypeApi(
        id: entity.accountType.id,
        account: entity.accountType.account,
        price: entity.accountType.price,
        iva: entity.accountType.iva,
        fastCashBonus: entity.accountType.fastCashBonus,
        discPurchasesCourse: entity.accountType.discPurchasesCourse,
        payInBinary: entity.accountType.payInBinary,
        profitOnPurchases: entity.accountType.profitOnPurchases,
        profitOnPurchases2: entity.accountType.profitOnPurchases2,
        comission: entity.accountType.comission,
        status: entity.accountType.status,
        createdAt: entity.accountType.createdAt,
        updatedAt: entity.accountType.updatedAt,
        enrollmentDuration: entity.accountType.enrollmentDuration,
        discPurchasesCertificates: entity.accountType.discPurchasesCertificates,
      ),
    );
  }
}
