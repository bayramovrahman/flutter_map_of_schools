// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  // Just empty column

  // final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  late bool _isConnected;

  /* Future<bool> connectionLiveInternet() async {
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (event) {
        _isConnected = event.contains((ConnectivityResult.none));
      },
    );
    return _isConnected;
  } */

  Future<bool> connectionInternet() async {
    final List<ConnectivityResult> _connectivityResult = await (Connectivity().checkConnectivity());
    _isConnected = _connectivityResult.contains(ConnectivityResult.none);
    return _isConnected;
  }

  // Just empty column
}
