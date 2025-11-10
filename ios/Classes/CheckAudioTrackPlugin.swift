import Flutter
import UIKit
import AVFoundation

public class CheckAudioTrackPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "check_audio_track_plugin", binaryMessenger: registrar.messenger())
        let instance = CheckAudioTrackPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "hasAudioTrack":
            if let args = call.arguments as? [String: Any],
               let filePath = args["filePath"] as? String
            {
                let url: URL
                if filePath.lowercased().hasPrefix("http") {
                    url = URL(string: filePath)!
                } else {
                    url = URL(fileURLWithPath: filePath)
                }
                let asset = AVURLAsset(url: url)
                let hasAudio = !asset.tracks(withMediaType: .audio).isEmpty
                result(hasAudio)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "File path is null.", details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
