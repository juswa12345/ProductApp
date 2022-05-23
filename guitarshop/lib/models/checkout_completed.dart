import 'package:flutter/material.dart';
import 'package:guitarshop/screens/cart_screen.dart';
import 'package:lottie/lottie.dart';

class CheckoutCompleted extends StatefulWidget {
  const CheckoutCompleted({Key? key}) : super(key: key);

  @override
  State<CheckoutCompleted> createState() => _CheckoutCompletedState();
}

class _CheckoutCompletedState extends State<CheckoutCompleted>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _iscomplted = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          _iscomplted = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _iscomplted
          ?  const CartScreen()
          :  Lottie.asset(
            'assets/sample_data/checked.json',
            controller: _controller,
            onLoaded: (comp){
              _controller.duration = comp.duration;
              _controller.forward();
            }
          ),
      ),
    );
  }
}
