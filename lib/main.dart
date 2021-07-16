import 'package:ecommerce_sing/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_sing/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_sing/config/app_router.dart';
import 'package:ecommerce_sing/config/theme.dart';
import 'package:ecommerce_sing/screens/home/home_screen.dart';
import 'package:ecommerce_sing/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted()))
      ],
      child: MaterialApp(
        title: 'Quang Tran',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}


