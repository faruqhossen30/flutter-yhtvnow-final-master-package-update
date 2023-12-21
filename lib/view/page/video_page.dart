import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pod_player/pod_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:html/parser.dart' as html;

class VideoPage extends StatefulWidget {
  String iframeDataSrc;

  VideoPage({super.key, required this.iframeDataSrc});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
//   WebViewController controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..runJavaScript('<script src="https://iframe.strimm.com/embedded-iframe.js">')
//     ..loadHtmlString('''
// <iframe id="strimm-iframe" allow="autoplay" allowfullscreen width="100%" height="auto" style="margin: 0; border: none; position: absolute; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden;" src="https://iframe.strimm.com/yourhouseTV/CityTVDurhamNC?guideMode=fixed;&keepGuideOpened=false&slot=T44299"></iframe>
//   ''');

  late WebViewController controller;


  @override
  void initState() {
    // TODO: implement initState
    controller = WebViewController()
    ..setBackgroundColor(Colors.black87)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..runJavaScript('<script src="https://iframe.strimm.com/embedded-iframe.js">')
      ..loadHtmlString(
        '''
        <iframe id="strimm-iframe" allow="autoplay" allowfullscreen width="100%" height="auto" style="margin: 0; border: none; position: absolute; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden;" src="${widget.iframeDataSrc}"></iframe>
        '''
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
