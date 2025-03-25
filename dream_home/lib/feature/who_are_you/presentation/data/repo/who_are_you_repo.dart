import 'package:dartz/dartz.dart';

import '../../../../../core/network/error/failure.dart';

abstract class WhoAreYouRepo {
  Future<Either<Failure, bool>> isWorker({
    required bool isWorker,
  });
}
