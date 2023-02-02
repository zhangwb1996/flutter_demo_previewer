import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class Json2Widget extends StatefulWidget {
  const Json2Widget({
    required this.jsonData,
    this.registry,
    Key? key,
  })  : assert(jsonData != null),
        super(key: key);

  final Map<String, dynamic> jsonData;
  final JsonWidgetRegistry? registry;

  @override
  State<Json2Widget> createState() => Json2WidgetState();
}

class Json2WidgetState extends State<Json2Widget> {
  // JsonWidgetData? _data;
  var _data;
  @override
  void initState() {
    super.initState();

    _data = JsonWidgetData.fromDynamic(widget.jsonData);
  }

  @override
  Widget build(BuildContext context) => _data!.build(
        context: context,
        // registry: widget.registry ?? JsonWidgetRegistry.instance,
      );
}
