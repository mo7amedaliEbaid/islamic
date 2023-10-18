import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../di/di.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker =
      instance<InternetConnectionChecker>();

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
