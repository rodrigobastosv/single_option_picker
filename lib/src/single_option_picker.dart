import 'package:flutter/material.dart';

typedef OptionBuilder = Widget Function(int, bool);

class SingleOptionPicker extends StatefulWidget {
  const SingleOptionPicker({
    Key? key,
    required this.numberOfOptions,
    required this.selectedOptionIndex,
    required this.onChangeOption,
    required this.optionBuilder,
  }) : super(key: key);

  final int numberOfOptions;
  final int selectedOptionIndex;
  final Function(int) onChangeOption;
  final OptionBuilder optionBuilder;

  @override
  _SingleOptionPickerState createState() => _SingleOptionPickerState();
}

class _SingleOptionPickerState extends State<SingleOptionPicker> {
  late int selectedOptionIndex;

  @override
  void initState() {
    selectedOptionIndex = widget.selectedOptionIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.numberOfOptions; i++)
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => selectedOptionIndex = i);
                widget.onChangeOption(i);
              },
              child: widget.optionBuilder(i, i == widget.selectedOptionIndex),
            ),
          ),
      ],
    );
  }
}