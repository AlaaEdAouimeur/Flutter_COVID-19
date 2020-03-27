 import 'package:flutter/material.dart';

InputDecoration inputDecoration = InputDecoration(
              filled: true,
             // labelText: "Name",
             enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00cc99),width: 1),
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00cc99),width: 1),
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00cc99),width: 1),
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00cc99),width: 2),
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              fillColor: Colors.grey[200],
             
              focusColor: Colors.grey[100],
              
            );