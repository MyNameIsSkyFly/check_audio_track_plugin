import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'check_audio_track_plugin_method_channel.dart';

abstract class CheckAudioTrackPluginPlatform extends PlatformInterface {
  /// Constructs a CheckAudioTrackPluginPlatform.
  CheckAudioTrackPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static CheckAudioTrackPluginPlatform _instance = MethodChannelCheckAudioTrackPlugin();

  /// The default instance of [CheckAudioTrackPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelCheckAudioTrackPlugin].
  static CheckAudioTrackPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CheckAudioTrackPluginPlatform] when
  /// they register themselves.
  static set instance(CheckAudioTrackPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> hasAudioTrack(String filePath) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
