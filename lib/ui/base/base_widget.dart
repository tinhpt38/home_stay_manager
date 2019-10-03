import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final VoidCallback widgetDidLoad;

  BaseWidget({this.builder, this.child, this.model, this.widgetDidLoad});

  _BaseWidgetState<T> createState() => _BaseWidgetState();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {

  T model;

  @override
  void initState() {
    model = widget.model;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((d){
      widget.widgetDidLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ),
    );
  }
}