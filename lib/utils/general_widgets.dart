import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ribal_alassaf_tht/utils/styles.dart';

class CustomDropDown<T> extends StatefulWidget {
  final List<String>? displayValues;
  final List<T>? values;
  final T? initialValue;
  final void Function(T? value) onChange;

  const CustomDropDown({
    super.key,
    required this.values,
    required this.initialValue,
    required this.onChange,
    this.displayValues,
  });

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  late List<T> items;
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    items = widget.values ?? [];
    selectedValue = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant CustomDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        selectedValue = widget.initialValue;
      });
    }

    if (widget.values != oldWidget.values) {
      setState(() {
        items = widget.values!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onChange(value);
        },
        items: items
            .map((T item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    item.toString(),
                    overflow: TextOverflow.visible,
                  ),
                ))
            .toList(),
        isExpanded: true,
        hint: selectedValue != null
            ? Text(
                selectedValue.toString(),
                overflow: TextOverflow.ellipsis,
              )
            : null,
        buttonStyleData: ButtonStyleData(
          height: 50,
          decoration: blackRadiusDecoration,
        ),
        iconStyleData: const IconStyleData(
          iconSize: 20,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
