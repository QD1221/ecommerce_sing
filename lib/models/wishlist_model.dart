import 'package:ecommerce_sing/models/models.dart';
import 'package:equatable/equatable.dart';

class WishList extends Equatable {
  final List<Product> products;


  const WishList({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}