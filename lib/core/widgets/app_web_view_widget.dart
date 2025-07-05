import 'package:flutter/material.dart';
import '../../core/widgets/app_loading.dart';
import '../../core/widgets/app_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class AppWebViewWidget extends StatefulWidget {
  const AppWebViewWidget({super.key, required this.url, this.title});

  final String? title;
  final String? url;

  @override
  State<AppWebViewWidget> createState() => _AppWebViewWidgetState();
}

class _AppWebViewWidgetState extends State<AppWebViewWidget> {
  bool visible = true;
  late final WebViewController _controller;

  @override
  void initState() {
    initWebView();
    super.initState();
  }

  void initWebView() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (final int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (final String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (final String url) {
            setState(() {
              visible = false;
            });
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (final WebResourceError error) {
            debugPrint('Page resource error');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url ?? ''));

    _controller = controller;
  }

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: AppBar(title: Text(widget.title ?? '')),
      smallBody: Stack(
        children: [
          WebViewWidget(controller: _controller),
          Center(
            child: Visibility(visible: visible, child: const AppLoading()),
          ),
        ],
      ),
    );
  }
}
