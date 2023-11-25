import 'package:data_entery/core/routes/app_router.dart';
import 'package:data_entery/data/notifiers/data_state_notifier.dart';
import 'package:data_entery/providers/app_data_provider.dart';
import 'package:data_entery/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  await Supabase.initialize(
    url: 'https://krfkihjtvjvwhpswbxmn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtyZmtpaGp0dmp2d2hwc3dieG1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA2NzE2NzEsImV4cCI6MjAxNjI0NzY3MX0.GOQ565Nym-CQKKu808pBEthpZuh9FJa1FqLkVKGCM1s',
  );
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
  late final AppRouter appRouter;
  late final AppDataNotifier appData;
  @override
  void initState() {
    super.initState();
    appRouter = AppRouter(ref);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appData = ref.read(appDataProvider.notifier);
      final appUser = ref.read(userStateProvider.notifier);
      appData.loadAllArticles();
      appData.loadAllTopics();
      appUser.getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onGenerateRoute: appRouter.onGenreateRoute,
    );
  }
}
