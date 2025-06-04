import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/app.dart';
import 'package:wgic_app/utils/screen_provider.dart';
import 'package:wgic_app/utils/app_theme.dart'; // Import your theme
import 'package:wgic_app/utils/attendance_provider.dart';
import 'package:wgic_app/utils/profile_provider.dart';
import 'package:wgic_app/utils/ai_provider.dart';
import 'package:wgic_app/utils/events_provider.dart';
import 'package:wgic_app/utils/donations_provider.dart';
import 'package:wgic_app/utils/quiz_provider.dart'; // Import QuizProvider
import 'package:wgic_app/utils/pastoral_care_provider.dart'; // Import PastoralCareProvider
import 'package:wgic_app/utils/discipleship_provider.dart'; // Import DiscipleshipProvider

void main() {
  runApp(const WGICApp());
}

class WGICApp extends StatelessWidget {
  const WGICApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MultiProvider for scalability as more features/providers are added
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenProvider()),
        ChangeNotifierProvider(create: (context) => AttendanceProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => AIProvider()),
        ChangeNotifierProvider(create: (context) => EventsProvider()),
        ChangeNotifierProvider(create: (context) => DonationsProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider()), // Register QuizProvider
        ChangeNotifierProvider(create: (context) => PastoralCareProvider()), // Register PastoralCareProvider
        ChangeNotifierProvider(create: (context) => DiscipleshipProvider()), // Register DiscipleshipProvider
      ],
      child: MaterialApp(
        title: 'WGIC Mobile App',
        themeMode: ThemeMode.dark, // Force dark mode
        darkTheme: AppTheme.darkTheme, // Use your custom dark theme
        theme: AppTheme.darkTheme, // Also set as light theme to ensure consistency
        home: const WGICMobileApp(),
        debugShowCheckedModeBanner: false,
        // Localization support (add your delegates and supported locales here)
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   Locale('en'),
        //   Locale('zu'),
        //   Locale('af'),
        // ],
        // Analytics observer example (replace with your analytics implementation)
        navigatorObservers: [
          // Example: FirebaseAnalyticsObserver(analytics: analytics),
          _SimpleRouteObserver(),
        ],
      ),
    );
  }
}

// Simple route observer for demonstration (replace with your analytics observer)
class _SimpleRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('Navigated to: \\${route.settings.name}');
  }
}