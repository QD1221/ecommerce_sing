import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_sing/models/category_model.dart';
import 'package:ecommerce_sing/models/product_model.dart';
import 'package:ecommerce_sing/widgets/custom_appbar.dart';
import 'package:ecommerce_sing/widgets/custom_navbar.dart';
import 'package:ecommerce_sing/widgets/hero_carousel_card.dart';
import 'package:ecommerce_sing/widgets/product_card.dart';
import 'package:ecommerce_sing/widgets/product_carousel.dart';
import 'package:ecommerce_sing/widgets/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Quang Tran'),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                // enableInfiniteScroll: false,
                // initialPage: 2,
                autoPlay: true,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(
                        category: category,
                      ))
                  .toList(),
            ),
          ),
          SectionTitle(title: 'RECOMMEND'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          SectionTitle(title: 'MOST POPULAR'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isPopular)
                .toList(),
          ),
        ],
      ),
    );
  }
}
