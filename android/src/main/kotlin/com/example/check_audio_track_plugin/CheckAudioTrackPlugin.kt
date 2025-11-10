package com.example.check_audio_track_plugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.media.MediaMetadataRetriever

/** CheckAudioTrackPlugin */
class CheckAudioTrackPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "check_audio_track_plugin")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
      if (call.method == "hasAudioTrack") {
          val filePath = call.argument<String>("filePath")
          if (filePath == null) {
              result.error("INVALID_ARGUMENT", "File path is null.", null)
          } else {
              try {
                  val retriever = MediaMetadataRetriever()
                  retriever.setDataSource(filePath)
                  val hasAudio = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_AUDIO)
                  retriever.release()
                  result.success(hasAudio == "yes")
              } catch (e: Exception) {
                  result.error("PROCESSING_ERROR", "Failed to process video file.", e.toString())
              }
          }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
