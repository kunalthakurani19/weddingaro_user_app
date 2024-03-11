import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:weddingaro_user_app/utils/app_data_manager.dart';
import 'package:weddingaro_user_app/utils/routes/routes.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';
import 'package:weddingaro_user_app/view_model/auth_view_model.dart';
import 'package:weddingaro_user_app/view_model/user_view_modal.dart';

import 'resources/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDataManager().initialize(); // Initialize SharedPreferences
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarColor: AppColors.whiteColor));

    return FlutterSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => UserViewModal()),
            // ChangeNotifierProvider(create: (_) => StoreViewModel()),
            // ChangeNotifierProvider(create: (_) => StoreTokenViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkRed.withOpacity(0.1)),
              useMaterial3: true,
            ),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}
