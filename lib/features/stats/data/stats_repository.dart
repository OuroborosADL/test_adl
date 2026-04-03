import 'package:fpdart/fpdart.dart';
import 'package:adl/core/utils/exception_handler.dart';
import 'package:adl/features/stats/model/stats_failure.dart';
import 'package:adl/adlcore/generated/v2/hcore/hcore.pb.dart';
import 'package:adl/adlcore/adl_core_service.dart';
import 'package:adl/utils/custom_loggers.dart';

abstract interface class StatsRepository {
  Stream<Either<StatsFailure, SystemInfo>> watchStats();
}

class StatsRepositoryImpl with ExceptionHandler, InfraLogger implements StatsRepository {
  StatsRepositoryImpl({required this.singbox});

  final ADLCoreService singbox;

  @override
  Stream<Either<StatsFailure, SystemInfo>> watchStats() {
    return singbox.watchStats().handleExceptions(StatsUnexpectedFailure.new);
  }
}
