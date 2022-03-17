part of 'internet_state_cubit.dart';

@immutable
abstract class InternetStateState {}

class LoadingState extends InternetStateState {}

class InternetConnected extends InternetStateState {
  final InternetConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetStateState {}
