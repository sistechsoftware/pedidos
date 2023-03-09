import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get onPressed => null;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed, // Any states you want to affect here
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      // if any of the input states are found in our list
      return Colors.blue;
    }
    return Colors.red; // default color
  }

  Size getSize(Set<MaterialState> size) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed, // Any states you want to affect here
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (size.any(interactiveStates.contains)) {
      // if any of the input states are found in our list
      return const Size(100, 100);
    }

    return const Size(100, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(child: Column(
          children: [
            const SizedBox(height: 100),
            Image.asset("images/logo.png", height: 100,),
            const SizedBox(height: 70),
            SizedBox(
                width: 300,
                child: TextFormField(
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(labelText: "Login"),
                ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(labelText: "Senha"),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  }
                  return Colors.blue;
                }),
              ),
                onPressed: onPressed,
                child: const Text(
                    "Entrar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )),
          ],
        ),
        ),
      ),
    );
  }
}
