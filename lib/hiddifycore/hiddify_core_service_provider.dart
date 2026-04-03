import 'package:adl/core/directories/directories_provider.dart';
import 'package:adl/core/notification/in_app_notification_controller.dart';
import 'package:adl/core/preferences/general_preferences.dart';
import 'package:adl/adlcore/adl_core_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'adl_core_service_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [AppDirectories, DebugModeNotifier, inAppNotificationController])
ADLCoreService adlCoreService(Ref ref) {
  return ADLCoreService(ref);
}
