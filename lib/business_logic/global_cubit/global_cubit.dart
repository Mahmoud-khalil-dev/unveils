import 'dart:convert';
import 'dart:io';

import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import '../../constants/license_keys.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  late final DeepArController dARController;

  void startingApp() {
    emit(StartingState());
    dARController = DeepArController();
    dARController
        .initialize(
          androidLicenseKey:
          androidLicenseKey,
          iosLicenseKey:
          iosLicenseKey,
          resolution: Resolution.high,
        )
        .then((value) => emit(SuccessConfirmingState()))
        .catchError((error) {
          emit(ErrorConfirmingState());
      print('Error is $error');
          startingApp();
    });
  }

  final String assetEffectsPath = 'assets/effects/';

  final List<String> effectsList = [];
  final List<String> maskList = [];
  final List<String> filterList = [];
  int effectIndex = 0;
  int maskIndex = 0;
  int filterIndex = 0;
  bool isFaceMask = false;
  bool isFilter = false;

  void initEffects(context) {
    // Either get all effects
    emit(LoadingEffectsState());
    getEffectsFromAssets(context).then((values) {

      effectsList.clear();
      effectsList.addAll(values);

      maskList.clear();
      maskList.add(assetEffectsPath + 'flower_face.deepar');
      maskList.add(assetEffectsPath + 'viking_helmet.deepar');

      filterList.clear();
      filterList.add(assetEffectsPath + 'burning_effect.deepar');
      filterList.add(assetEffectsPath + 'Hope.deepar');

      effectsList.removeWhere((element) => maskList.contains(element));

      effectsList.removeWhere((element) => filterList.contains(element));
      emit(SuccessGetEffectsState());
    }).catchError((error){
      emit(ErrorGetEffectsState());
      print('Error is $error');
      initEffects(context);
    });

    // OR

    // Only add specific effects
    // _effectsList.add(_assetEffectsPath+'burning_effect.deepar');
    // _effectsList.add(_assetEffectsPath+'flower_face.deepar');
    // _effectsList.add(_assetEffectsPath+'Hope.deepar');
    // _effectsList.add(_assetEffectsPath+'viking_helmet.deepar');
  }

  ///get all Effects

  Future<List<String>> getEffectsFromAssets(context) async {
    final manifestContent =
    await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final filePaths = manifestMap.keys
        .where((path) => path.startsWith(assetEffectsPath))
        .toList();
    return filePaths;
  }


  /// Get next effect
  String getNextEffect() {
    emit(LoadingNextEffectState());
    if(effectIndex < effectsList.length){
       effectIndex++;
    }else {effectIndex = 0;}
    emit(SuccessGetNextEffectState());
    return effectsList[effectIndex];
  }

  /// Get previous effect
  String getPrevEffect() {
    emit(LoadingPreviousEffectState());
    if(effectIndex > effectsList.length){
      effectIndex--;
    }else {effectIndex = effectsList.length-1;}
    emit(SuccessGetPreviousEffectState());
    return effectsList[effectIndex];
  }

  /// Get next mask
  String getNextMask() {
    emit(LoadingNextMaskState());
    if(maskIndex < maskList.length){
      maskIndex++;
    }else {maskIndex = 0;}
    emit(SuccessGetNextMaskState());
    return maskList[maskIndex];
  }

  /// Get previous mask
  String getPrevMask() {
    emit(LoadingPreviousMaskState());
    if(maskIndex > maskList.length){
      maskIndex--;
    }else {maskIndex = maskList.length-1;}
    emit(SuccessGetPreviousMaskState());
    return maskList[maskIndex];
  }

  /// Get next filter
  String getNextFilter() {
    emit(LoadingNextFilterState());
    if(filterIndex < filterList.length){
      filterIndex++;
    }else {filterIndex = 0;}
    emit(SuccessGetNextFilterState());
    return filterList[filterIndex];
  }

  /// Get previous filter
  String getPrevFilter() {
    emit(LoadingPreviousFilterState());
    if(filterIndex > filterList.length){
      filterIndex--;
    }else {filterIndex = filterList.length-1;}
    emit(SuccessGetPreviousFilterState());
    return filterList[filterIndex];
  }


 void forwardButtonPressed(){
    if (isFaceMask) {
      String nextMask = getNextMask();
      dARController.switchFaceMask(nextMask);
    } else if (isFilter) {
      String nextFilter = getNextFilter();
      dARController.switchFilter(nextFilter);
    } else {
      String nextEffect = getNextEffect();
      dARController.switchEffect(nextEffect);
    }
    emit(ForwardButtonPressedState());

  }

 void backButtonPressed(){
   if (isFaceMask) {
     String prevMask = getPrevMask();
     dARController.switchFaceMask(prevMask);
   } else if (isFilter) {
     String prevFilter = getPrevFilter();
     dARController.switchFilter(prevFilter);
   } else {
     String prevEffect = getPrevEffect();
     dARController.switchEffect(prevEffect);
   }
   emit(BackButtonPressedState());
 }

 void recordButtonPressed()async{
    emit(RecordButtonPressedState());
   if (dARController.isRecording) {
     File? file = await dARController.stopVideoRecording();
     emit(StopRecordingModeState());
     OpenFile.open(file.path);
   } else {
     await dARController.startVideoRecording();
     emit(StartRecordingModeState());
   }
 }

 void cameraButtonPressed(){

   dARController.takeScreenshot().then((file) {
     emit(CameraButtonPressed());
     OpenFile.open(file.path);
   });
 }

 void flashButtonPressed()async{
   await dARController.toggleFlash();
   emit(FlashButtonPressed());
 }

 void faceMaskButtonPressed(){
   isFaceMask = !isFaceMask;
   if (isFaceMask) {
     dARController.switchFaceMask(maskList[maskIndex]);
   } else {
     dARController.switchFaceMask("null");
   }
   emit(FaceMaskButtonPressed());
 }

 void filterButtonPressed(){
   isFilter = !isFilter;
   if (isFilter) {
     dARController.switchFilter(filterList[filterIndex]);
   } else {
     dARController.switchFilter("null");
   }
   emit(FilterButtonPressed());
 }

 void cameraSwitchButtonPressed(){
  dARController.flipCamera();
  emit(CameraSwitchButtonPressed());
 }


}
