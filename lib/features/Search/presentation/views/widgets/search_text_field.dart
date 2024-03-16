
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutLineBorderInput(),
        focusedBorder: OutLineBorderInput() ,
        hintText: "Search",
        suffixIcon: IconButton(
        onPressed: (){}, 
        icon: const Opacity(
          opacity: .8,
          child:   Icon(Icons.search,size: 22,)),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  OutlineInputBorder OutLineBorderInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white)
      );
  }
}