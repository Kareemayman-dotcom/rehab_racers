part of 'plain_detection_cubit.dart';

abstract class PlainDetectionState  {
  const PlainDetectionState();

  @override
  List<Object> get props => [];
}

class PlainDetectionInitial extends PlainDetectionState {}

class PlainDetected extends PlainDetectionState {}
