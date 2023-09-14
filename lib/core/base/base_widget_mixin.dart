import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/flavors/build_config.dart';

mixin BaseWidgetMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(context),
    );
  }

  Widget body(BuildContext context);
}
