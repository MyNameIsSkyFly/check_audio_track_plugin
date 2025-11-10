import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:check_audio_track_plugin/check_audio_track_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasAudio = false;
  final _checkAudioTrackPlugin = CheckAudioTrackPlugin();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkVideo() async {
    hasAudio = await _checkAudioTrackPlugin.hasAudioTrack(
      'https://upos-sz-mirrorbd.bilivideo.com/upgcxcode/63/44/393454463/393454463_da2-1-192.mp4?e=ig8euxZM2rNcNbRV7bdVhwdlhWdjhwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&trid=12e761b4b02149398ff51ceebdead0ah&oi=3079177308&deadline=1762773028&gen=playurlv3&os=bdbv&og=hw&uipk=5&nbs=1&mid=0&platform=html5&upsig=97ad36d471b9a72fb6788f9532c8d881&uparams=e,trid,oi,deadline,gen,os,og,uipk,nbs,mid,platform&bvc=vod&nettype=0&bw=849594&agrr=1&buvid=&build=0&dl=0&f=h_0_0&orderid=0,1',
    );
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Running on: $hasAudio\n'),
              TextButton(
                onPressed: checkVideo,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                ),
                child: Text('hasAudio', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
