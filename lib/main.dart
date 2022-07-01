import 'package:flutter/material.dart';
import 'package:mex/domain/entities/theme.dart';
import 'package:mex/ui/widgets/app/my_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeModel()),
    ],
    child: const MyApp(),
  ));
}
