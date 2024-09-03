import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewArticle extends StatefulWidget {
  const WebviewArticle({super.key, required this.articleUrl});

  final String articleUrl;

  @override
  State<WebviewArticle> createState() => _WebviewArticleState();
}

class _WebviewArticleState extends State<WebviewArticle> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/news_wave_title.png",
          width: 150,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.articleUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onPageStarted: (url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebResourceError: (error) {
              setState(() {
                _isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Failed to load page: ${error.description}")),
              );
            },
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.reload();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
