import 'package:myfood/models/food.dart';
import 'package:myfood/models/order.dart';

List<Food> menu = [
  _biryani,
  _pizza,
  _chicken,
  _noodles,
  _pulav,
  _pratha,
  _burger,
  _pratha,
];

List<Order> recentOrders = [
  Order(
    food: _biryani,
    quantity: 1,
    date: '18 Nov, 2020',
  ),
  Order(
    food: _pulav,
    quantity: 2,
    date: '17 Nov, 2020',
  ),
  Order(
    food: _chapati,
    quantity: 1,
    date: '12 Nov, 2020',
  ),
  Order(
    food: _noodles,
    quantity: 4,
    date: '15 Nov, 2020',
  ),
  Order(
    food: _chapati,
    quantity: 1,
    date: '18 Nov, 2020',
  ),
];
List<Order> cart = List();

final _biryani =
    Food(imageUrl: 'assets/images/biryani.jpg', name: 'Biryani', price: 15);
final _burger =
    Food(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 20);
final _chapati =
    Food(imageUrl: 'assets/images/chapati.jpg', name: 'Chapati', price: 12);
final _chicken =
    Food(imageUrl: 'assets/images/chicken.jpg', name: 'Chicken', price: 25);
final _noodles =
    Food(imageUrl: 'assets/images/noodles.jpg', name: 'Noodles', price: 30);
final _pizza =
    Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 15);
final _pratha =
    Food(imageUrl: 'assets/images/pratha.jpg', name: 'Pratha', price: 18);
final _pulav =
    Food(imageUrl: 'assets/images/pulav.jpg', name: 'Pulav', price: 15);
