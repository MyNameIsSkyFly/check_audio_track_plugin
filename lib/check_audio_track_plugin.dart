
import 'check_audio_track_plugin_platform_interface.dart';

class CheckAudioTrackPlugin {
  Future<bool> hasAudioTrack(String filePath) {
    return CheckAudioTrackPluginPlatform.instance.hasAudioTrack(filePath);
  }
}
