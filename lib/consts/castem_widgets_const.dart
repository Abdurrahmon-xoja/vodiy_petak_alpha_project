import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'colors_const.dart';

class buttonBorder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  buttonBorder(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // This is your border radius
            side: BorderSide(color: caccentColor), // This is your border color
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: caccentColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;

  button({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: cwhiteColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class alert extends StatelessWidget {
  final String text1;

  final String text2;

  final String imageName;

  final String buttonTExt;

  final Function() onClick;

  alert(
      {required this.text1,
      required this.text2,
      required this.imageName,
      required this.buttonTExt,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
// margin: EdgeInsets.symmetric(horizontal: 100),
      width: MediaQuery.of(context).size.width,
// width: double.infinity,
      child: Column(
        children: [
          SvgPicture.asset(imageName),
          SizedBox(
            height: 24,
          ),
          Text(
            textAlign: TextAlign.center,
            text1,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: cdarkTextColor),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            textAlign: TextAlign.center,
            text2,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: cworkingHintColor),
          ),
          SizedBox(
            height: 24,
          ),
          button(text: buttonTExt, color: caccentColor, onPressed: onClick)
        ],
      ),
    );
  }
}

class DropdownSearchCastom extends StatefulWidget {
  // DropdownSearch({this.selectedValue});
  final Function(String) getValue;
  final List<String> items;
  final IconData icon;
  final double height;

  DropdownSearchCastom({
    super.key,
    required this.getValue,
    required this.items,
    required this.icon,
    required this.height,
  });

  @override
  State<DropdownSearchCastom> createState() => _DropdownSearchCastomState();
}

class _DropdownSearchCastomState extends State<DropdownSearchCastom> {
  double cornerSide = 10.0;

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = widget.items;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              widget.icon,
              color: cclueColor,
              size: 28,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Выберите из списка',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: cclueColor,
              ),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_car_filled,
                        color: cclueColor,
                        size: 28,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: cclueColor,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.getValue(selectedValue!);
        },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: cinputColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(cornerSide),
              bottomLeft: Radius.circular(cornerSide),
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.expand_more,
            color: cclueColor,
            size: 28,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: widget.height,
          elevation: 0,
          decoration: BoxDecoration(
            color: cinputColor,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search for an item...',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value.toString().contains(searchValue);
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          print(isOpen);
          if (!isOpen) {
            textEditingController.clear();
          }
          if (isOpen) {
            setState(() {
              cornerSide = 0.0;
            });
          } else {
            setState(() {
              cornerSide = 10.0;
            });
          }
        },
      ),
    );
  }
}
