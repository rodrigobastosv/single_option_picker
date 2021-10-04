import 'package:flutter/material.dart';
import 'package:single_option_picker/single_option_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleOptionPicker(
                numberOfOptions: 3,
                optionBuilder: (index, isSelected) => Container(
                  height: 80,
                  child: Center(
                    child: Icon(
                      getIcon(index),
                      color: isSelected ? getIconColor(index) : Colors.black,
                    ),
                  ),
                ),
                onChangeOption: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedOptionIndex: selectedIndex,
              ),
              const SizedBox(height: 24),
              SingleOptionPicker(
                numberOfOptions: 3,
                optionBuilder: (index, isSelected) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 80,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.red : Colors.transparent,
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ),
                onChangeOption: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedOptionIndex: selectedIndex,
              ),
              const SizedBox(height: 24),
              SingleOptionPicker(
                numberOfOptions: 5,
                optionBuilder: (index, isSelected) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 80,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.red : Colors.transparent,
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ),
                onChangeOption: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedOptionIndex: selectedIndex,
              ),
              const SizedBox(height: 24),
              SingleOptionPicker(
                numberOfOptions: 4,
                optionBuilder: (index, isSelected) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 80,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.red : Colors.transparent,
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: _getBorderRadius(
                      isFirst: index == 0,
                      isLast: index == 3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ),
                onChangeOption: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedOptionIndex: selectedIndex,
              ),
              const SizedBox(height: 24),
              SingleOptionPicker(
                numberOfOptions: 2,
                optionBuilder: (index, isSelected) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 80,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.red : Colors.transparent,
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      index == 0 ? 'Good' : 'Bad',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ),
                onChangeOption: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selectedOptionIndex: selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData getIcon(int index) {
    if (index == 0) {
      return Icons.mood_sharp;
    } else if (index == 1) {
      return Icons.money_off_csred_sharp;
    } else {
      return Icons.mood_bad;
    }
  }

  Color getIconColor(int index) {
    if (index == 0) {
      return Colors.green;
    } else if (index == 1) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  BorderRadiusGeometry? _getBorderRadius({
    bool? isFirst,
    bool? isLast,
  }) {
    if (isFirst ?? false) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        topLeft: Radius.circular(8),
      );
    } else if (isLast ?? false) {
      return const BorderRadius.only(
        bottomRight: Radius.circular(8),
        topRight: Radius.circular(8),
      );
    }
    return null;
  }
}
