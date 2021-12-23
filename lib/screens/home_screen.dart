import 'package:flutter/material.dart';
import 'package:myfood/data/data.dart';
import 'package:myfood/models/food.dart';
import 'package:myfood/models/order.dart';
import 'package:myfood/screens/cart_screen.dart';
import 'package:myfood/utility.dart';
import 'package:myfood/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildMenuItem(BuildContext context, Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(food.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            width: 175.0,
            height: 175.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9,
                    ])),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  food.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\u{20B9} ${food.price.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                ),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {
                  if (!cart.contains(Order(
                    food: food,
                    quantity: 1,
                    date: date(),
                  ))) {
                    setState(() {
                      cart.add(Order(
                        food: food,
                        quantity: 1,
                        date: date(),
                      ));
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('${food.name} added in cart'),
                        action: SnackBarAction(
                          label: 'undo',
                          onPressed: () {
                            cart.removeWhere(
                                (order) => order.food.name == food.name);
                          },
                        ),
                      ));
                    });
                  }

                  print('Added Food');
                  print(
                      'Food name : ${food.name}, price : ${food.price}, date : ${cart[0].date}');
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Dastgar Food',
        ),
        actions: [
          FlatButton(
            child: Text(
              'Cart(${cart.length})',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartScreen();
              })).then((value) => setState(() {}));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          RecentOrders(),
          // Menu(),
          Column(
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(menu.length, (index) {
                  Food food = menu[index];
                  return _buildMenuItem(context, food);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
