import 'package:flutter/material.dart';

typedef OptionBuilder = Widget Function(int, bool);

class SingleOptionPicker extends StatefulWidget {
  const SingleOptionPicker({
    Key? key,
    required this.numberOfOptions,
    this.selectedOptionIndex,
    required this.onChangeOption,
    required this.optionBuilder,
  }) : super(key: key);

  /// Number of options that will be shown.
  final int numberOfOptions;

  /// Selected index of the option. This is needed so we can mark an option as selected. If [selectedOptionIndex]
  /// is null, no option will be selected.
  final int? selectedOptionIndex;

  /// Callback that is thriggered whenever and option is picked
  final Function(int) onChangeOption;

  /// Builder that will build each option. This builder is executed once for each [numberOfOptions]
  final OptionBuilder optionBuilder;

  @override
  _SingleOptionPickerState createState() => _SingleOptionPickerState();
}

class _SingleOptionPickerState extends State<SingleOptionPicker> {
  late int? selectedOptionIndex;

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
