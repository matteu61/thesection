import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:thesection/src/constants/enums.dart';

part 'internet_state_state.dart';

class InternetStateCubit extends Cubit<InternetStateState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetStateCubit({
    required this.connectivity,
  }) : super(LoadingState()) {
    monitorConnectivity();
  }

  StreamSubscription<ConnectivityResult> monitorConnectivity() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == InternetConnectionType.mobile) {
        emitInternetConnected(InternetConnectionType.mobile);
      } else if (connectivityResult == InternetConnectionType.wifi) {
        emitInternetConnected(InternetConnectionType.wifi);
      } else {
        emitInternetDisconnected();
      }
    });
  }

//stream emit methods
  void emitInternetConnected(InternetConnectionType _netType) {
    return emit(InternetConnected(connectionType: _netType));
  }

  void emitInternetDisconnected() {
    return emit(InternetDisconnected());
  }

  //close methods
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
