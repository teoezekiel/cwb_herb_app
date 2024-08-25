import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveAnimationControllerHelper {
  static final RiveAnimationControllerHelper _instance =
      RiveAnimationControllerHelper._internal();

  factory RiveAnimationControllerHelper() {
    return _instance;
  }

  RiveAnimationControllerHelper._internal();

  Artboard? _riveArtboard;

  RiveAnimationController? _controllerIdle;
  RiveAnimationController? _controllerHandsUp;
  RiveAnimationController? _controllerHandsDown;
  RiveAnimationController? _controllerSuccess;
  RiveAnimationController? _controllerFail;
  RiveAnimationController? _controllerLookDownRight;
  RiveAnimationController? _controllerLookDownLeft;

  bool isLookingRight = false;
  bool isLookingLeft = false;

  Artboard? get riveArtboard => _riveArtboard;

  void addController(RiveAnimationController controller) {
    if (_riveArtboard == null) return;
    removeAllControllers();
    _riveArtboard?.addController(controller);
  }

  void addDownLeftController() {
    if (_controllerLookDownLeft == null) return;
    addController(_controllerLookDownLeft!);
    isLookingLeft = true;
  }

  void addDownRightController() {
    if (_controllerLookDownRight == null) return;
    addController(_controllerLookDownRight!);
    isLookingRight = true;
  }

  void addFailController() {
    if (_controllerFail == null) return;
    addController(_controllerFail!);
  }

  void addHandsDownController() {
    if (_controllerHandsDown == null) return;
    addController(_controllerHandsDown!);
  }

  void addHandsUpController() {
    if (_controllerHandsUp == null) return;
    addController(_controllerHandsUp!);
  }

  void addSuccessController() {
    if (_controllerSuccess == null) return;
    addController(_controllerSuccess!);
  }

  Future<void> loadRiveFile(String assetPath) async {
    try {
      final data = await rootBundle.load(assetPath);
      final file = RiveFile.import(data);
      _riveArtboard = file.mainArtboard;

      _controllerIdle = SimpleAnimation('idle');
      _controllerHandsUp = SimpleAnimation('Hands_up');
      _controllerHandsDown = SimpleAnimation('hands_down');
      _controllerSuccess = SimpleAnimation('success');
      _controllerFail = SimpleAnimation('fail');
      _controllerLookDownRight = SimpleAnimation('Look_down_right');
      _controllerLookDownLeft = SimpleAnimation('Look_down_left');

      // Adding the idle controller as default
      if (_riveArtboard != null && _controllerIdle != null) {
        _riveArtboard!.addController(_controllerIdle!);
      }
    } catch (e) {
      print('Error loading Rive file: $e');
    }
  }

  void removeAllControllers() {
    final listOfControllers = [
      _controllerIdle,
      _controllerHandsUp,
      _controllerHandsDown,
      _controllerSuccess,
      _controllerFail,
      _controllerLookDownRight,
      _controllerLookDownLeft,
    ];

    if (_riveArtboard != null) {
      for (var controller in listOfControllers) {
        if (controller != null) {
          _riveArtboard!.removeController(controller);
        }
      }
    }

    isLookingLeft = false;
    isLookingRight = false;
  }

  void dispose() {
    removeAllControllers();
    _controllerIdle?.dispose();
    _controllerHandsUp?.dispose();
    _controllerHandsDown?.dispose();
    _controllerSuccess?.dispose();
    _controllerFail?.dispose();
    _controllerLookDownRight?.dispose();
    _controllerLookDownLeft?.dispose();
  }
}
