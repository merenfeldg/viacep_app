import 'package:flutter/material.dart';

extension PaddingNumber on double {
  EdgeInsets get paddingAll => EdgeInsets.all(this);
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get paddingRight => EdgeInsets.only(right: this);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: this);
  EdgeInsets get paddingTop => EdgeInsets.only(top: this);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: this);
}

extension SizedBoxNumber on double {
  SizedBox get spacingVertical => SizedBox(height: this);
  SizedBox get spacingHorizontal => SizedBox(width: this);
}

extension ScreenContext on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double fractionallyScreenHeight(double n) => n * screenHeight;
  double fractionallyScreenWidth(double n) => n * screenWidth;
}
