import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/domain/entities/theme.dart';
import 'package:mebex_0_1_0/ui/widgets/app/my_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeModel()),
        ],
        child: const MyApp(),
      )
  );
}