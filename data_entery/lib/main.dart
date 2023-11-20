import 'package:data_entery/core/router/app_router.dart';
import 'package:data_entery/data/data_state_notifier.dart';
import 'package:data_entery/views/topics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  AppRouter appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
    ref.read(appDataProvider).loadJsonFromAsset('data');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onGenerateRoute: appRouter.onGenreateRoute,
    );
  }
}

navigate(Widget child, BuildContext context) {
  Navigator.push(
    context,
    customPageRoute(
      child,
    ),
  );
}
