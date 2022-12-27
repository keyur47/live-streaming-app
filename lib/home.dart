import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () => jumpToLivePage(context, isHost: true),
            child: const Text('Start a live'),
          ),
          ElevatedButton(
            onPressed: () => jumpToLivePage(context, isHost: false),
            child: const Text('Watch a live'),
          )
        ]),
      ),
    );
  }

  jumpToLivePage(BuildContext context, {required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivePage(
          isHost: isHost,
          liveID: "1234",
        ),
      ),
    );
  }
}

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;

  const LivePage({Key? key, required this.liveID, this.isHost = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID:
            826588411,
        appSign:
            "9ad4e480673a62768ff904ff7b6bbf6107c3faf2b2a6925c3b14cedd5c301901",
        userID: 'Darkwa_01',
        userName: 'codewithdarkwa',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
