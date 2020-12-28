import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mngmt/logic/cubit/internet_cubit.dart';

import 'package:state_mngmt/presentation/routes/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final AppRouter appRouter;
  const MyApp({
    Key key,
    @required this.connectivity,
    @required this.appRouter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity),
          ),
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(
                internetCubit: BlocProvider.of<InternetCubit>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute,
        ));
  }
}
