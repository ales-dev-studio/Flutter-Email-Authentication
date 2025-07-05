import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {

  const AppLoading({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
