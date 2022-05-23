import 'package:flutter/material.dart';

class MainWelcomeScreen extends StatelessWidget {
  const MainWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints.expand(
                width: 500,
                height: 350,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/guitar_app_assets/LOGO.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Text(
              'Welcome to Guitar Crowd',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Colonna',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Your No.1 Guitar Store',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/homePage');
                },
                child: const Text(
                  'SKIP >',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                )
            ),
          ],
        ),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/guitar_app_assets/bg_image.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}