import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/main_screen.dart';

class InheritedCheckConnection extends InheritedWidget {
  const InheritedCheckConnection(
      {required this.isNetworkAvailable, required Widget child, super.key})
      : super(child: child);

  final bool isNetworkAvailable;
  @override
  bool updateShouldNotify(covariant InheritedCheckConnection oldWidget) {
    return oldWidget.isNetworkAvailable != isNetworkAvailable;
  }

  static InheritedCheckConnection? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedCheckConnection>();
}

class CheckConnection extends StatefulWidget {
  const CheckConnection({super.key});

  @override
  CheckConnectionState createState() => CheckConnectionState();
}

class CheckConnectionState extends State<CheckConnection> {
  bool isNetworkAvailable = false;
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    _checkConnectivity();
    super.initState();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  dispose() {
    super.dispose();

    _connectivitySubscription.cancel();
  }

  Future<void> _checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    setState(() {
      isNetworkAvailable = connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      isNetworkAvailable = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCheckConnection(
        isNetworkAvailable: isNetworkAvailable, child: const MainScreen());
  }
}
