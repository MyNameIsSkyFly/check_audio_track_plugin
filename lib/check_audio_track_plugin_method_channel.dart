import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'check_audio_track_plugin_platform_interface.dart';

/// An implementation of [CheckAudioTrackPluginPlatform] that uses method channels.
class MethodChannelCheckAudioTrackPlugin extends CheckAudioTrackPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('check_audio_track_plugin');

  @override
  Future<bool> hasAudioTrack(String filePath) async {
    try {
      final hasAudio = await methodChannel.invokeMethod<bool>('hasAudioTrack', {
        'filePath': filePath,
      });
      return hasAudio ?? false;
    } on PlatformException catch (e) {
      debugPrint('Failed to check audio track: $e');
      return false;
    }
  }
}
