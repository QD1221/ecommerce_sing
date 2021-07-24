import 'package:ecommerce_sing/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_sing/blocs/category/category_bloc.dart';
import 'package:ecommerce_sing/blocs/product/product_bloc.dart';
import 'package:ecommerce_sing/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_sing/config/app_router.dart';
import 'package:ecommerce_sing/config/theme.dart';
import 'package:ecommerce_sing/repositories/category/category_repository.dart';
import 'package:ecommerce_sing/repositories/product/product_repository.dart';
import 'package:ecommerce_sing/screens/home/home_screen.dart';
import 'package:ecommerce_sing/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = BlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishList())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProducts(),
            ),
        ),
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
