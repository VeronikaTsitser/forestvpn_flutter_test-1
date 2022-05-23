import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forestvpn_test/features/news/bloc/news_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_event.dart';
import 'package:forestvpn_test/features/news/view/pages/notifications.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

import 'features/news/view/pages/news_details.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const Application();
      },
    );
  }
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return NewsBloc(MockNewsRepository())..add(LoadNews());
      },
      child: MaterialApp(
        title: 'ForestVPN test',
        theme: ThemeData(fontFamily: 'SFproDisplay'),
        initialRoute: '/',
        routes: {
          '/': (context) => const Notifications(),
          '/news_details': (context) => const NewsDetails(),
        },
      ),
    );
  }
}
