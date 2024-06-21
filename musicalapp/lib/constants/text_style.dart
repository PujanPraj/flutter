import "package:flutter/material.dart";
import "./colors.dart";

ourStyle(
    {family = "regular", color = textColor, double? size = 18.0, fontWeight}) {
  return TextStyle(
      fontFamily: family, color: color, fontSize: size, fontWeight: fontWeight);
}
