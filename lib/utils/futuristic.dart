import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget that makes it easy to execute a [Future] from a StatelessWidget.
class Futuristic<T> extends StatefulWidget {
  /// Function that returns the [Future] to execute. Not the [Future] itself.
  final AsyncValueGetter<T> futureBuilder;

  /// Whether to immediately begin executing the [Future]. If true, [initialBuilder] must be null.
  final bool autoStart;

  /// Widget to display while the [Future] is executing.
  /// If null, a [CircularProgressIndicator] will be displayed.
  final WidgetBuilder? busyBuilder;

  /// Widget to display when the [Future] has completed with an error.
  /// If null, [initialBuilder] will be displayed again.
  /// The [Object] is the [Error] or [Exception] returned by the [Future].
  /// Call [VoidCallback] to start executing the [Future] again.
  final Widget Function(BuildContext, Object, VoidCallback)? errorBuilder;

  /// Widget to display when the [Future] has completed successfully.
  /// If null, [initialBuilder] will be displayed again.
  final Widget Function(BuildContext, AsyncSnapshot)? dataBuilder;

  /// Callback to invoke when the [Future] has completed successfully.
  /// Will only be invoked once per [Future] execution.
  final ValueChanged<T>? onData;

  /// Callback to invoke when the [Future] has completed with an error.
  /// Will only be invoked once per [Future] execution.
  /// Call [VoidCallback] to start executing the [Future] again.
  final Function(Object, VoidCallback)? onError;

  const Futuristic(
      {Key? key,
      required this.futureBuilder,
      this.autoStart = true,
      this.busyBuilder,
      this.errorBuilder,
      this.dataBuilder,
      this.onData,
      this.onError})
      : super(key: key);

  @override
  _FuturisticState<T> createState() => _FuturisticState<T>();
}

class _FuturisticState<T> extends State<Futuristic<T>> {
  Future<T>? _future;

  @override
  void initState() {
    super.initState();
    _execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _future,
      builder: (_context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return _handleBusy(_context);
          case ConnectionState.done:
            return _handleSnapshot(_context, snapshot);
          default:
            return _defaultWidget();
        }
      },
    );
  }

  Widget _handleSnapshot(BuildContext context, AsyncSnapshot<T> snapshot) {
    if (snapshot.hasError) {
      return _handleError(context, snapshot.error as Object);
    }
    return _handleData(context, snapshot);
  }

  Widget _handleError(BuildContext context, Object error) {
    return widget.errorBuilder!(context, error, _execute);
  }

  Widget _handleData(BuildContext context, AsyncSnapshot data) {
    return widget.dataBuilder!(context, data);
  }

  Widget _handleBusy(BuildContext context) {
    if (widget.busyBuilder == null) {
      return _defaultBusyWidget();
    }
    return widget.busyBuilder!(context);
  }

  void _execute() {
    setState(() {
      _future = widget.futureBuilder();
      _future!.then(_onData).catchError(_onError);
    });
  }

  void _onData(T data) async {
    if (widget.onData != null && _isActive()) {
      widget.onData!(data);
    }
  }

  void _onError(Object e) async {
    if (widget.onError != null && _isActive()) {
      widget.onError!(e, _execute);
    }
  }

  bool _isActive() => mounted && (ModalRoute.of(context)?.isActive ?? true);

  Widget _defaultBusyWidget() =>
      const Center(child: CircularProgressIndicator());

  Widget _defaultWidget() => const SizedBox.shrink();
}
