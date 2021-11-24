<a href="https://www.buymeacoffee.com/rodrigobastosv" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

#  Introduction

Have you ever wanted a widget that facilitates the process of choosing an option among some available options? If yes, single_option_picker is the widget for you :)

# Basic Usage

The widget is very simple to use. You need to pass the number of options, an option builder (that will build the options), a callback when an option is picked and you need to tell what is the selected option index.

```dart
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
)
```

The great is that the OptionBuilder makes you free to implement your options by yourself. You can implement Icons, Containers, etc.

![enter image description here](https://media3.giphy.com/media/qoHKn0V7JkaD65qyY8/giphy.gif?cid=790b7611b0119968bb9f6d2456e9b9fb141cc082b3aa00de&rid=giphy.gif&ct=g)

## Suggestions & Bugs

For any suggestions or bug report please head to [issue tracker][tracker].

[tracker]: https://github.com/rodrigobastosv/single_option_picker/issues
