import 'package:myfood/models/food.dart';

class Order {
  final Food food;
  final String date;
  int quantity;
  Order({
    this.food,
    this.date,
    this.quantity,
  });
}
