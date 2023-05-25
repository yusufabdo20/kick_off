import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchTextField extends StatefulWidget {
   SearchTextField({required this.searchQuery});
 String searchQuery ;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        onChanged: (value) {
                  setState(() {
          widget.searchQuery = value.toLowerCase();
        });

        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: Color(0xff696969),
            size: 26,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Search your city",
          labelStyle: const TextStyle(
            color: Color(0xff7D7D7D),
          ),
          filled: true,
          fillColor: Color(0xffD9D9D9),
          isDense: true,
        ),
      ),
    );
  }
}
