import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mex/ui/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum MenuOptions { clearCache, clearCookies }

class CalculatorsMainScreen extends StatefulWidget {
  const CalculatorsMainScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorsMainScreen> createState() => _CalculatorsMainScreenState();
}

class _CalculatorsMainScreenState extends State<CalculatorsMainScreen> {
  late WebViewController _webController;
  double progress = 0;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webController.canGoBack()) {
          _webController.goBack();
        } else {
          log('Нет записей в истории');
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
          actions: [
            IconButton(
                onPressed: () async {
                  if (await _webController.canGoBack()) {
                    _webController.goBack();
                  } else {
                    log('Нет записей в истории');
                  }
                  return;
                },
                icon: Icon(Icons.chevron_left)),
            IconButton(
                onPressed: () async {
                  if (await _webController.canGoForward()) {
                    _webController.goForward();
                  } else {
                    log('Нет записей в истории');
                  }
                  return;
                },
                icon: Icon(Icons.chevron_right)),
            IconButton(
                onPressed: () => _webController.reload(),
                icon: Icon(Icons.refresh)),
            PopupMenuButton<MenuOptions>(
                onSelected: (value) {
                  switch (value) {
                    case MenuOptions.clearCache:
                      _onClearCache(_webController, context);
                      break;
                    case MenuOptions.clearCookies:
                      _onClearCookes(context);
                      break;
                    default:
                  }
                },
                itemBuilder: (context) => <PopupMenuItem<MenuOptions>>[
                      PopupMenuItem(
                          value: MenuOptions.clearCache,
                          child: Text('Удалить кеш')),
                      PopupMenuItem(
                          value: MenuOptions.clearCookies,
                          child: Text('Удалить cookies')),
                    ]),
          ],
        ),
        body: Column(
          children: [
            progress != 1
                ? LinearProgressIndicator(
                    value: progress,
                    color: AppColors.mainRed,
                    backgroundColor: AppColors.mainLightGrey,
                  )
                : SizedBox.shrink(),
            Expanded(
              child: WebView(
                initialUrl: 'https://kaspi.kz',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _webController = controller;
                },
                onProgress: (progress) {
                  this.progress = progress / 100;
                  setState(() {});
                },
                onPageStarted: (url) {
                  log('Новый сайт: $url');
                  // if (url.contains('https://flutter.dev')) {
                  //   Future.delayed(Duration(microseconds: 300), () {
                  //     _webController.runJavascript(
                  //       "document.getElementsByTagName('footer')[0].style.display='none'",
                  //     );
                  //   });
                  // }
                },
                onPageFinished: (url) {
                  log('Страница полностью загружена');
                  if (url.contains('https://m.facebook.com')) {
                    if (isSubmitting) {
                      _webController.loadUrl('https://m.facebook.com');
                      isSubmitting = false;
                    }
                  }
                },
                navigationDelegate: (request) {
                  if (request.url.startsWith('https://m.youtube.com')) {
                    log('Навигая заблокирована к $request');
                    return NavigationDecision.prevent;
                  }
                  log('Навигация разрешена к $request');
                  return NavigationDecision.navigate;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final email = 'dk.kairov@gmail.com';
            final password = 'Kairov242';

            _webController.runJavascript(
                "document.getElementById('m_login_email').value='$email'");
            _webController.runJavascript(
                "document.getElementById('m_login_password').value='$password'");
            await Future.delayed(Duration(seconds: 1));
            isSubmitting = true;
            await _webController.runJavascript("document.forms[0].submit()");

            // final current_url = await _webController.currentUrl();
            // log('Переходим со страницы $current_url');
            // _webController.loadUrl('https://youtube.com');
            // _webController.runJavascript(
            //   "document.getElementsByTagName('footer')[0].style.display='none'",
            // );
          },
          child: Text('+'),
        ),
      ),
    );
  }

  void _onClearCookes(BuildContext context) async {
    final bool hadCookies = await CookieManager().clearCookies();
    String message = 'Cookies удалены';
    if (!hadCookies) {
      message = 'Cookies все были очищены';
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _onClearCache(WebViewController controller, BuildContext context) async {
    await _webController.clearCache();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Текст очищен')));
  }
}
