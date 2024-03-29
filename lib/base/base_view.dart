import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/locator.dart';
import 'base_model.dart';


class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;

  const BaseView({super.key, required this.builder, required this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),

    );

    /*
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      notifier: model,
      //builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );*/


  }
}
