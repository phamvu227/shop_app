import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';

class CartItem extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
      this.id,
      this.productId,
      this.price,
      this.quantity,
      this.title,
      );

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late CartController cartController;

  void initState() {
    // TODO: implement initState
    super.initState();
    cartController = context.read<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: GestureDetector(
        onTap: () {
          _showDialog(context);
        },
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('\$${widget.price}'),
                ),
              ),
            ),
            title: Text(widget.title),
            subtitle: Text('Total: \$${widget.price}'),
            trailing: Text('${widget.quantity} x'),
          ),
        ),
      ),
    );
  }
  void _showDialog(BuildContext context) {
    // user defined function void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context, builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text("Delete"),
        content: Text("Are you sure you want to delete?"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Yes"),
            onPressed: () {
              Navigator.pop(context);
              if (widget.quantity > 1) {
                cartController.deleteItem(widget.productId);
              } else {
                cartController.deteleAll(widget.productId);
              }
            },
          ),
        ],
      );
    },
    );
  }
}




