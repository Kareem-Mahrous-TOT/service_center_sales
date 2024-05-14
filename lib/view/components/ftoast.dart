import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast useFToast({required BuildContext context}) {
  return use(_FToastHook(context: context));
}

class _FToastHook extends Hook<FToast> {
  final BuildContext context;

  const _FToastHook({required this.context});

  @override
  HookState<FToast, Hook<FToast>> createState() => _FToastState();
}

class _FToastState extends HookState<FToast, _FToastHook> {
  late FToast fToast;

  @override
  void initHook() {
    super.initHook();
    fToast = FToast();
    fToast.init(hook.context);
  }

  @override
  FToast build(BuildContext context) => fToast;

  @override
  void dispose() {
    fToast.removeCustomToast();
    super.dispose();
  }
}