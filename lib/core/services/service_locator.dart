import 'package:color_aap/core/services/hashing_service.dart';
import 'package:color_aap/core/services/shared_prefs_storage.dart';
import 'package:color_aap/features/auth/auth_logic.dart';
import 'package:color_aap/features/colors/color_logic.dart';

import 'package:get_it/get_it.dart';

/// Service locator
final serviceLocator = GetIt.instance;

/// Register dependencies
Future<void> registerDependencies() async {
  /// Register hashing service
  serviceLocator.registerLazySingleton<HashingService>(HashingService.new);

  /// Register shared prefs storage
  serviceLocator
      .registerLazySingleton<SharedPrefsStorage>(SharedPrefsStorage.new);

  serviceLocator.registerLazySingleton<AuthLogic>(
    () => AuthLogic(
      storageService: serviceLocator<SharedPrefsStorage>(),
      hashingService: serviceLocator<HashingService>(),
    ),
  );
  serviceLocator.registerFactoryParam<ColorLogic, String, void>(
    (email, _) => ColorLogic(
      storageService: serviceLocator<SharedPrefsStorage>(),
      email: email,
    ),
  );
}
