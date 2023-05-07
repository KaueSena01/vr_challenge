import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:vr_challenge/app/layers/data/data_sources/admin_datasource.dart';
import 'package:vr_challenge/app/layers/domain/entities/admin_entity.dart';
import 'package:vr_challenge/core/configs/db/db.dart';
import 'package:vr_challenge/core/configs/db/services/admin_service.dart';

class AdminDataSourceImpl extends AdminDataSource {
  late Database db;

  @override
  Future<AdminEntity> signIn(AdminEntity adminEntity) async {
    db = await DatabaseProvider.instance.database;

    final admin = AdminService(database: db);
    try {
      final result = await admin.getAdmin(
        adminEntity.email,
        adminEntity.password,
      );

      return result;
    } catch (_) {
      log(_.toString());
      rethrow;
    }
  }
}
