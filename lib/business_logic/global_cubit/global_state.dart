

abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

/// Starting app states
class StartingState extends GlobalState {}
class SuccessConfirmingState extends GlobalState {}
class ErrorConfirmingState extends GlobalState {}


/// Getting Effects States
class LoadingEffectsState extends GlobalState {}
class SuccessGetEffectsState extends GlobalState {}
class ErrorGetEffectsState extends GlobalState {}



class EffectButtonPressed extends GlobalState {}

class CancelButtonPressed extends GlobalState {}













// class ForwardButtonPressedState extends GlobalState {}
//
// class BackButtonPressedState extends GlobalState {}
//
// class CameraButtonPressed extends GlobalState {}
//
// class FlashButtonPressed extends GlobalState {}
//
// class FaceMaskButtonPressed extends GlobalState {}
//
// class FilterButtonPressed extends GlobalState {}
//
// class CameraSwitchButtonPressed extends GlobalState {}
/// record Button States
// class RecordButtonPressedState extends GlobalState {}
// class StartRecordingModeState extends GlobalState {}
// class StopRecordingModeState extends GlobalState {}
/// Getting Next Effect states
// class LoadingNextEffectState extends GlobalState {}
// class SuccessGetNextEffectState extends GlobalState {}
/// Getting Previous Effect states
// class LoadingPreviousEffectState extends GlobalState {}
// class SuccessGetPreviousEffectState extends GlobalState {}
/// Getting Next Mask states
// class LoadingNextMaskState extends GlobalState {}
// class SuccessGetNextMaskState extends GlobalState {}
/// Getting Previous Mask states
// class LoadingPreviousMaskState extends GlobalState {}
// class SuccessGetPreviousMaskState extends GlobalState {}
/// Getting Next Filter states
// class LoadingNextFilterState extends GlobalState {}
// class SuccessGetNextFilterState extends GlobalState {}
/// Getting Previous Filter states
// class LoadingPreviousFilterState extends GlobalState {}
// class SuccessGetPreviousFilterState extends GlobalState {}
