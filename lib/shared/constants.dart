// Anything related to the likes of form fields that we can only change ONCE and not just for the entire fields over and over again.

import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    hintText: 'Enter Username',
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 0.2)));
