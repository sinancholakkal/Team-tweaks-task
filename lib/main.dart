import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:team_week_task/models/user_model.dart';
import 'package:team_week_task/routes/app_router.dart';
import 'package:team_week_task/state/auth_bloc/auth_bloc.dart';
import 'package:team_week_task/state/gender_bloc/gender_bloc.dart';
import 'package:team_week_task/state/image_pick_bloc/image_pick_bloc.dart';
import 'package:team_week_task/state/user_bloc/user_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderBloc()),
        BlocProvider(create: (context) => ImagePickBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
