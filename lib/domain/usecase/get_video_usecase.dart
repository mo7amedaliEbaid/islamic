import 'package:dartz/dartz.dart';

import '../models/video/video.dart';

abstract class GetVideosUseCase {
  Future<Either<Exception, List<Video>>> execute();
}