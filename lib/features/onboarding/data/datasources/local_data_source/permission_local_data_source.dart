import 'package:permission_handler/permission_handler.dart';

abstract class PermissionLocalDataSource {
  Future<Map<Permission, PermissionStatus>> requestPermissions(
    List<Permission> permissions,
  );

  Future<PermissionStatus> requestPermission(Permission permission);

  Future<bool> checkPermission(Permission permission);
}

class PermissionLocalDataSourceImpl implements PermissionLocalDataSource {
  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(
    List<Permission> permissions,
  ) async {
    final results = <Permission, PermissionStatus>{};
    for (final permission in permissions) {
      results[permission] = await permission.request();
    }
    return results;
  }

  @override
  Future<PermissionStatus> requestPermission(Permission permission) {
    return permission.request();
  }

  @override
  Future<bool> checkPermission(Permission permission) async {
    final permissionStatus = await permission.status;
    return switch (permissionStatus) {
      PermissionStatus.limited => true,
      PermissionStatus.granted => true,
      PermissionStatus.provisional => true,
      PermissionStatus.denied => false,
      PermissionStatus.permanentlyDenied => false,
      PermissionStatus.restricted => false,
    };
  }
}
