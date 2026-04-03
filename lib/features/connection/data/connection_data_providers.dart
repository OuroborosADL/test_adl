import 'package:adl/core/directories/directories_provider.dart';
import 'package:adl/features/connection/data/connection_repository.dart';
import 'package:adl/features/profile/data/profile_data_providers.dart';
import 'package:adl/features/settings/data/config_option_data_providers.dart';
import 'package:adl/adlcore/adl_core_service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connection_data_providers.g.dart';

@Riverpod(keepAlive: true)
ConnectionRepository connectionRepository(Ref ref) {
  return ConnectionRepositoryImpl(
    ref: ref,
    directories: ref.watch(appDirectoriesProvider).requireValue,
    configOptionRepository: ref.watch(configOptionRepositoryProvider),
    singbox: ref.watch(adlCoreServiceProvider),
    profilePathResolver: ref.watch(profilePathResolverProvider),
  );
}
