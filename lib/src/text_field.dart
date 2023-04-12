import 'package:auto_binding_field/util/enum.dart';
import 'package:auto_binding_field/util/extension.dart';
import 'package:auto_binding_field/util/input_format.dart';
import 'package:auto_binding_field/util/reg_exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
export 'package:auto_binding_field/util/enum.dart';

const double _ourSideLabelGap = 8;

class AutoBindingTextField extends StatefulWidget {
  /// - use your variable here for binding
  final String? value;

  /// - you should update your 'value' from here by using parameter 'value'
  final void Function(String value)? onChanged;

  /// - this function same as onSaved on TextFormField
  final void Function(String? value)? onSaved;

  /// - this function same as onEditingComplete on TextFormField
  final void Function()? onEditingComplete;

  /// - this function same as onFieldSubmitted on TextFormField
  final void Function(String value)? onFieldSubmitted;

  /// - this function same as focusNode on TextFormField
  final FocusNode? focusNode;

  /// - this function same as inputFormatters on TextFormField
  final List<TextInputFormatter>? inputFormatters;

  /// - this function same as textInputAction on TextFormField
  final TextInputAction? textInputAction;

  /// - if on first select field then select all text if isPrimary is true
  final bool isPrimarySelect;

  /// - this function same as validator on TextFormField
  final String? Function(String? value)? validator;

  /// - this function same as maxLines on TextFormField
  final int maxLines;

  /// - this function same as keyboardType on TextFormField
  final TextInputType? keyboardType;

  /// - this function same as autoValidateMode on TextFormField
  final AutovalidateMode? autoValidateMode;

  /// - if this field is password type.make this as true
  final bool isPassword;

  /// - this function same as enabled on TextFormField
  final bool enabled;

  /// - this function same as decoration on TextFormField
  final InputDecoration? decoration;

  /// - if outside label is true then the label will be shown on the top of the field
  final bool outSideLabel;

  /// - if outside label is true,and the gap of the label is ourSideLabelGap
  final double ourSideLabelGap;

  /// - this form is mandatory use this.
  final bool mandatory;

  /// - this function same as readOnly on TextFormField
  final bool readOnly;

  /// - this function same as autoFocus on TextFormField
  final bool autoFocus;

  ///This name emphasizes that the widget supports automatic data binding to a data source (the controller).
  const AutoBindingTextField(
      {Key? key,
      required this.value,
      this.onChanged,
      this.readOnly = false,
      this.autoFocus = false,
      this.decoration,
      this.isPassword = false,
      this.enabled = true,
      this.mandatory = false,
      this.outSideLabel = false,
      this.ourSideLabelGap = _ourSideLabelGap,
      this.focusNode,
      this.onEditingComplete,
      this.inputFormatters,
      this.textInputAction,
      this.maxLines = 1,
      this.keyboardType,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.onSaved,
      this.isPrimarySelect = true,
      this.onFieldSubmitted,
      this.validator})
      : super(key: key);

  /// if the field is mobile type,use this
  factory AutoBindingTextField.mobile(
      {Key? key,
      String? value,
      void Function(String value)? onChanged,
      bool readOnly = false,
      bool autoFocus = false,
      InputDecoration? decoration,
      bool isPassword = false,
      bool enabled = true,
      bool mandatory = false,
      bool outSideLabel = false,
      double ourSideLabelGap = _ourSideLabelGap,
      FocusNode? focusNode,
      void Function()? onEditingComplete,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      int maxLines = 1,
      TextInputType? keyboardType,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
      void Function(String? value)? onSaved,
      bool isPrimarySelect = true,
      void Function(String value)? onFieldSubmitted,
      String? Function(String? value)? validator}) {
    return AutoBindingTextField(
      value: value,
      keyboardType: keyboardType ?? TextInputType.phone,
      inputFormatters: inputFormatters ?? [MobileInputFormatter()],
      decoration: decoration,
      outSideLabel: outSideLabel,
      maxLines: maxLines,
      onSaved: onSaved,
      autoValidateMode: autoValidateMode,
      key: key,
      validator: validator ??
          (value) {
            if (mandatory == true && (value == null || value == '')) {
              return 'Cant be null';
            }
            if (!RegExp(Expression.mobile).hasMatch(value.toString())) {
              return 'Invalid Mobile Number';
            }
            return null;
          },
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      autoFocus: autoFocus,
      isPassword: isPassword,
      isPrimarySelect: isPrimarySelect,
      mandatory: mandatory,
      onEditingComplete: onEditingComplete,
      ourSideLabelGap: ourSideLabelGap,
      textInputAction: textInputAction,
    );
  }

  /// if the field is email type,use this
  factory AutoBindingTextField.email(
      {Key? key,
      String? value,
      void Function(String value)? onChanged,
      bool readOnly = false,
      bool autoFocus = false,
      InputDecoration? decoration,
      bool isPassword = false,
      bool enabled = true,
      bool mandatory = false,
      bool outSideLabel = false,
      double ourSideLabelGap = _ourSideLabelGap,
      FocusNode? focusNode,
      void Function()? onEditingComplete,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      int maxLines = 1,
      TextInputType? keyboardType,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
      void Function(String? value)? onSaved,
      bool isPrimarySelect = true,
      void Function(String value)? onFieldSubmitted,
      String? Function(String? value)? validator}) {
    return AutoBindingTextField(
      value: value,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      inputFormatters: inputFormatters,
      decoration: decoration,
      outSideLabel: outSideLabel,
      maxLines: maxLines,
      onSaved: onSaved,
      autoValidateMode: autoValidateMode,
      key: key,
      validator: validator ??
          (value) {
            if (mandatory == true && (value == null || value == '')) {
              return 'Cant be null';
            }
            if (!RegExp(Expression.email).hasMatch(value.toString())) {
              return 'Invalid email id';
            }
            return null;
          },
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      autoFocus: autoFocus,
      isPassword: isPassword,
      isPrimarySelect: isPrimarySelect,
      mandatory: mandatory,
      onEditingComplete: onEditingComplete,
      ourSideLabelGap: ourSideLabelGap,
      textInputAction: textInputAction,
    );
  }

  @override
  State<AutoBindingTextField> createState() => _AutoBindingTextFieldState();
}

class _AutoBindingTextFieldState extends State<AutoBindingTextField> {
  late final FocusNode focusNode;
  final TextEditingController controller = TextEditingController();
  Widget outSideLabelText = const SizedBox();
  TextStyle? labelStyle;
  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? "";
    if (widget.focusNode != null) {
      focusNode = widget.focusNode!;
    } else {
      focusNode = FocusNode();
    }
    if (widget.isPrimarySelect) {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          controller.selection = TextSelection(
              baseOffset: 0, extentOffset: controller.text.length);
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final InputDecoration decoration;
    if (widget.decoration != null) {
      if (widget.outSideLabel) {
        labelStyle = TextStyle(
          fontSize: widget.decoration?.labelStyle?.fontSize ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontSize,
          overflow: widget.decoration?.labelStyle?.overflow ??
              Theme.of(context).inputDecorationTheme.labelStyle?.overflow,
          locale: widget.decoration?.labelStyle?.locale ??
              Theme.of(context).inputDecorationTheme.labelStyle?.locale,
          decoration: widget.decoration?.labelStyle?.decoration ??
              Theme.of(context).inputDecorationTheme.labelStyle?.decoration,
          height: widget.decoration?.labelStyle?.height ??
              Theme.of(context).inputDecorationTheme.labelStyle?.height,
          color: widget.decoration?.labelStyle?.color ??
              Theme.of(context).inputDecorationTheme.labelStyle?.color,
          backgroundColor: widget.decoration?.labelStyle?.backgroundColor ??
              Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.backgroundColor,
          background: widget.decoration?.labelStyle?.background ??
              Theme.of(context).inputDecorationTheme.labelStyle?.background,
          debugLabel: widget.decoration?.labelStyle?.debugLabel ??
              Theme.of(context).inputDecorationTheme.labelStyle?.debugLabel,
          decorationColor: widget.decoration?.labelStyle?.decorationColor ??
              Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.decorationColor,
          decorationStyle: widget.decoration?.labelStyle?.decorationStyle ??
              Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.decorationStyle,
          decorationThickness:
              widget.decoration?.labelStyle?.decorationThickness ??
                  Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.decorationThickness,
          fontFamily: widget.decoration?.labelStyle?.fontFamily ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontFamily,
          fontFamilyFallback:
              widget.decoration?.labelStyle?.fontFamilyFallback ??
                  Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.fontFamilyFallback,
          fontFeatures: widget.decoration?.labelStyle?.fontFeatures ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontFeatures,
          fontStyle: widget.decoration?.labelStyle?.fontStyle ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontStyle,
          fontVariations: widget.decoration?.labelStyle?.fontVariations ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontVariations,
          fontWeight: widget.decoration?.labelStyle?.fontWeight ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontWeight,
          foreground: widget.decoration?.labelStyle?.foreground ??
              Theme.of(context).inputDecorationTheme.labelStyle?.foreground,
          inherit: widget.decoration?.labelStyle?.inherit ??
              Theme.of(context).inputDecorationTheme.labelStyle?.inherit ??
              true,
          leadingDistribution:
              widget.decoration?.labelStyle?.leadingDistribution ??
                  Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.leadingDistribution,
          letterSpacing: widget.decoration?.labelStyle?.letterSpacing ??
              Theme.of(context).inputDecorationTheme.labelStyle?.letterSpacing,
          shadows: widget.decoration?.labelStyle?.shadows ??
              Theme.of(context).inputDecorationTheme.labelStyle?.shadows,
          textBaseline: widget.decoration?.labelStyle?.textBaseline ??
              Theme.of(context).inputDecorationTheme.labelStyle?.textBaseline,
          wordSpacing: widget.decoration?.labelStyle?.wordSpacing ??
              Theme.of(context).inputDecorationTheme.labelStyle?.wordSpacing,
        );
        if (widget.decoration?.labelText != null) {
          outSideLabelText = Text(
            widget.decoration!.labelText!,
            style: labelStyle,
          );
        } else if (widget.decoration?.label != null) {
          if (widget.decoration!.label! is Text) {
            final temp = (widget.decoration!.label! as Text);
            outSideLabelText = Text(
              temp.data!,
              style: temp.style,
              textAlign: temp.textAlign,
              locale: temp.locale,
              maxLines: temp.maxLines,
              overflow: temp.overflow,
              key: null,
              selectionColor: temp.selectionColor,
              semanticsLabel: temp.semanticsLabel,
              softWrap: temp.softWrap,
              strutStyle: temp.strutStyle,
              textDirection: temp.textDirection,
              textHeightBehavior: temp.textHeightBehavior,
              textScaleFactor: temp.textScaleFactor,
              textWidthBasis: temp.textWidthBasis,
            );
          } else {
            outSideLabelText = widget.decoration!.label!;
          }
        } else {
          outSideLabelText = const SizedBox();
        }
        decoration = InputDecoration(
          labelStyle: null,
          label: null,
          labelText: null,
          contentPadding: widget.decoration!.contentPadding,
          border: widget.decoration!.border,
          suffixIcon: widget.decoration!.suffixIcon,
          suffix: widget.decoration!.suffix,
          hintText: widget.decoration!.hintText,
          icon: widget.decoration!.icon,
          floatingLabelBehavior: widget.decoration!.floatingLabelBehavior,
          iconColor: widget.decoration!.iconColor,
          alignLabelWithHint: widget.decoration!.alignLabelWithHint,
          constraints: widget.decoration!.constraints,
          counter: widget.decoration!.counter,
          counterStyle: widget.decoration!.counterStyle,
          counterText: widget.decoration!.counterText,
          disabledBorder: widget.decoration!.disabledBorder,
          enabled: widget.decoration!.enabled,
          enabledBorder: widget.decoration!.enabledBorder,
          errorBorder: widget.decoration!.errorBorder,
          errorMaxLines: widget.decoration!.errorMaxLines,
          errorStyle: widget.decoration!.errorStyle,
          errorText: widget.decoration!.errorText,
          fillColor: widget.decoration!.fillColor,
          filled: widget.decoration!.filled,
          floatingLabelAlignment: widget.decoration!.floatingLabelAlignment,
          floatingLabelStyle: widget.decoration!.floatingLabelStyle,
          focusColor: widget.decoration!.focusColor,
          focusedBorder: widget.decoration!.focusedBorder,
          focusedErrorBorder: widget.decoration!.focusedErrorBorder,
          helperMaxLines: widget.decoration!.helperMaxLines,
          helperStyle: widget.decoration!.helperStyle,
          helperText: widget.decoration!.helperText,
          hintMaxLines: widget.decoration!.hintMaxLines,
          hintStyle: widget.decoration!.hintStyle,
          hintTextDirection: widget.decoration!.hintTextDirection,
          hoverColor: widget.decoration!.hoverColor,
          isCollapsed: widget.decoration!.isCollapsed,
          isDense: widget.decoration!.isDense,
          prefix: widget.decoration!.prefix,
          prefixIcon: widget.decoration!.prefixIcon,
          prefixIconColor: widget.decoration!.prefixIconColor,
          prefixIconConstraints: widget.decoration!.prefixIconConstraints,
          prefixStyle: widget.decoration!.prefixStyle,
          prefixText: widget.decoration!.prefixText,
          semanticCounterText: widget.decoration!.semanticCounterText,
          suffixIconColor: widget.decoration!.suffixIconColor,
          suffixIconConstraints: widget.decoration!.suffixIconConstraints,
          suffixStyle: widget.decoration!.suffixStyle,
          suffixText: widget.decoration!.suffixText,
        );
      } else {
        decoration = widget.decoration!;
      }
    } else {
      decoration = const InputDecoration();
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (controller.text != widget.value) {
        controller.text = widget.value?.toString() ?? "";
      }
    });
    Widget textField = TextFormField(
      autofocus: widget.autoFocus,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      controller: controller,
      focusNode: focusNode,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      maxLines: widget.maxLines,
      autovalidateMode: widget.autoValidateMode,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.isPassword,
      decoration: decoration,
    );
    return widget.outSideLabel
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              outSideLabelText,
              SizedBox(
                height: widget.ourSideLabelGap,
              ),
              textField
            ],
          )
        : textField;
  }
}

class AutoBindingNumField extends StatefulWidget {
  /// - use your number variable here for binding
  final num? value;

  /// - you should update your 'value' from here by using parameter 'value'
  final void Function(num? value)? onChanged;

  /// - this function same as onSaved on TextFormField
  final void Function(num? value)? onSaved;

  /// - this function same as onEditingComplete on TextFormField
  final void Function()? onEditingComplete;

  /// - this function same as onFieldSubmitted on TextFormField
  final void Function(num? value)? onFieldSubmitted;

  /// - this function same as focusNode on TextFormField
  final FocusNode? focusNode;

  /// - this function same as inputFormatters on TextFormField
  final List<TextInputFormatter>? inputFormatters;

  /// - this function same as textInputAction on TextFormField
  final TextInputAction? textInputAction;

  /// - if on first select field then select all text if isPrimary is true
  final bool isPrimarySelect;

  /// - this function same as validator on TextFormField
  final String? Function(num? value)? validator;

  /// - this function same as maxLines on TextFormField
  final int maxLines;

  /// - this function same as keyboardType on TextFormField
  final TextInputType? keyboardType;

  /// - this function same as autoValidateMode on TextFormField
  final AutovalidateMode? autoValidateMode;

  /// - this function same as enabled on TextFormField
  final bool enabled;

  /// - this function same as decoration on TextFormField
  final InputDecoration? decoration;

  /// - if outside label is true then the label will be shown on the top of the field
  final bool outSideLabel;

  /// - if outside label is true,and the gap of the label is ourSideLabelGap
  final double ourSideLabelGap;

  /// - this form is mandatory use this.
  final bool mandatory;

  /// - this function same as readOnly on TextFormField
  final bool readOnly;

  /// - this function same as autoFocus on TextFormField
  final bool autoFocus;

  /// - select your Number type, the default type is NumberType.decimal
  final NumberType type;

  const AutoBindingNumField({
    Key? key,
    required this.value,
    this.onChanged,
    this.readOnly = false,
    this.type = NumberType.decimal,
    this.autoFocus = false,
    this.decoration,
    this.enabled = true,
    this.mandatory = false,
    this.outSideLabel = false,
    this.focusNode,
    this.onEditingComplete,
    this.inputFormatters,
    this.textInputAction,
    this.maxLines = 1,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.onSaved,
    this.isPrimarySelect = true,
    this.onFieldSubmitted,
    this.validator,
    this.ourSideLabelGap = _ourSideLabelGap,
  }) : super(key: key);

  factory AutoBindingNumField.decimal(
      {Key? key,
      num? value,
      void Function(num? value)? onChanged,
      NumberType type = NumberType.decimal,
      bool readOnly = false,
      bool autoFocus = false,
      InputDecoration? decoration,
      bool isPassword = false,
      bool enabled = true,
      bool mandatory = false,
      bool outSideLabel = false,
      double ourSideLabelGap = _ourSideLabelGap,
      FocusNode? focusNode,
      void Function()? onEditingComplete,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      int maxLines = 1,
      TextInputType? keyboardType,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
      void Function(num? value)? onSaved,
      bool isPrimarySelect = true,
      void Function(num? value)? onFieldSubmitted,
      String? Function(num? value)? validator}) {
    return AutoBindingNumField(
      type: type,
      value: value,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: decoration,
      outSideLabel: outSideLabel,
      maxLines: maxLines,
      onSaved: onSaved,
      autoValidateMode: autoValidateMode,
      key: key,
      validator: validator,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      autoFocus: autoFocus,
      isPrimarySelect: isPrimarySelect,
      mandatory: mandatory,
      onEditingComplete: onEditingComplete,
      ourSideLabelGap: ourSideLabelGap,
      textInputAction: textInputAction,
    );
  }
  factory AutoBindingNumField.integer(
      {Key? key,
      num? value,
      void Function(num? value)? onChanged,
      bool readOnly = false,
      NumberType type = NumberType.integer,
      bool autoFocus = false,
      InputDecoration? decoration,
      bool isPassword = false,
      bool enabled = true,
      bool mandatory = false,
      bool outSideLabel = false,
      double ourSideLabelGap = _ourSideLabelGap,
      FocusNode? focusNode,
      void Function()? onEditingComplete,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      int maxLines = 1,
      TextInputType? keyboardType,
      AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
      void Function(num? value)? onSaved,
      bool isPrimarySelect = true,
      void Function(num? value)? onFieldSubmitted,
      String? Function(num? value)? validator}) {
    return AutoBindingNumField(
      type: type,
      value: value,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: decoration,
      outSideLabel: outSideLabel,
      maxLines: maxLines,
      onSaved: onSaved,
      autoValidateMode: autoValidateMode,
      key: key,
      validator: validator,
      readOnly: readOnly,
      focusNode: focusNode,
      onChanged: onChanged,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      autoFocus: autoFocus,
      isPrimarySelect: isPrimarySelect,
      mandatory: mandatory,
      onEditingComplete: onEditingComplete,
      ourSideLabelGap: ourSideLabelGap,
      textInputAction: textInputAction,
    );
  }
  @override
  State<AutoBindingNumField> createState() => _AutoBindingNumFieldState();
}

class _AutoBindingNumFieldState extends State<AutoBindingNumField> {
  late final FocusNode focusNode;
  final TextEditingController controller = TextEditingController();
  Widget outSideLabelText = const SizedBox();
  TextStyle? labelStyle;
  @override
  void initState() {
    super.initState();
    controller.text = widget.value?.toParseString() ?? "";
    if (widget.focusNode != null) {
      focusNode = widget.focusNode!;
    } else {
      focusNode = FocusNode();
    }
    if (widget.isPrimarySelect) {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          controller.selection = TextSelection(
              baseOffset: 0, extentOffset: controller.text.length);
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (controller.text != (widget.value?.toParseString() ?? "")) {
        controller.text = widget.value?.toString() ?? "";
      }
    });

    late final InputDecoration decoration;
    if (widget.decoration != null) {
      if (widget.outSideLabel) {
        labelStyle = TextStyle(
          fontSize: widget.decoration?.labelStyle?.fontSize ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontSize,
          overflow: widget.decoration?.labelStyle?.overflow ??
              Theme.of(context).inputDecorationTheme.labelStyle?.overflow,
          locale: widget.decoration?.labelStyle?.locale ??
              Theme.of(context).inputDecorationTheme.labelStyle?.locale,
          decoration: widget.decoration?.labelStyle?.decoration ??
              Theme.of(context).inputDecorationTheme.labelStyle?.decoration,
          height: widget.decoration?.labelStyle?.height ??
              Theme.of(context).inputDecorationTheme.labelStyle?.height,
          color: widget.decoration?.labelStyle?.color ??
              Theme.of(context).inputDecorationTheme.labelStyle?.color,
          backgroundColor: widget.decoration?.labelStyle?.backgroundColor ??
              Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.backgroundColor,
          background: widget.decoration?.labelStyle?.background ??
              Theme.of(context).inputDecorationTheme.labelStyle?.background,
          debugLabel: widget.decoration?.labelStyle?.debugLabel ??
              Theme.of(context).inputDecorationTheme.labelStyle?.debugLabel,
          decorationColor: widget.decoration?.labelStyle?.decorationColor ??
              Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.decorationColor,
          decorationStyle: widget.decoration?.labelStyle?.decorationStyle ??
              Theme.of(context)
                  .inputDecorationTheme
                  .labelStyle
                  ?.decorationStyle,
          decorationThickness:
              widget.decoration?.labelStyle?.decorationThickness ??
                  Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.decorationThickness,
          fontFamily: widget.decoration?.labelStyle?.fontFamily ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontFamily,
          fontFamilyFallback:
              widget.decoration?.labelStyle?.fontFamilyFallback ??
                  Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.fontFamilyFallback,
          fontFeatures: widget.decoration?.labelStyle?.fontFeatures ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontFeatures,
          fontStyle: widget.decoration?.labelStyle?.fontStyle ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontStyle,
          fontVariations: widget.decoration?.labelStyle?.fontVariations ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontVariations,
          fontWeight: widget.decoration?.labelStyle?.fontWeight ??
              Theme.of(context).inputDecorationTheme.labelStyle?.fontWeight,
          foreground: widget.decoration?.labelStyle?.foreground ??
              Theme.of(context).inputDecorationTheme.labelStyle?.foreground,
          inherit: widget.decoration?.labelStyle?.inherit ??
              Theme.of(context).inputDecorationTheme.labelStyle?.inherit ??
              true,
          leadingDistribution:
              widget.decoration?.labelStyle?.leadingDistribution ??
                  Theme.of(context)
                      .inputDecorationTheme
                      .labelStyle
                      ?.leadingDistribution,
          letterSpacing: widget.decoration?.labelStyle?.letterSpacing ??
              Theme.of(context).inputDecorationTheme.labelStyle?.letterSpacing,
          shadows: widget.decoration?.labelStyle?.shadows ??
              Theme.of(context).inputDecorationTheme.labelStyle?.shadows,
          textBaseline: widget.decoration?.labelStyle?.textBaseline ??
              Theme.of(context).inputDecorationTheme.labelStyle?.textBaseline,
          wordSpacing: widget.decoration?.labelStyle?.wordSpacing ??
              Theme.of(context).inputDecorationTheme.labelStyle?.wordSpacing,
        );
        if (widget.decoration?.labelText != null) {
          outSideLabelText = Text(
            widget.decoration!.labelText!,
            style: labelStyle,
          );
        } else if (widget.decoration?.label != null) {
          if (widget.decoration!.label! is Text) {
            final temp = (widget.decoration!.label! as Text);
            outSideLabelText = Text(
              temp.data!,
              style: temp.style,
              textAlign: temp.textAlign,
              locale: temp.locale,
              maxLines: temp.maxLines,
              overflow: temp.overflow,
              key: null,
              selectionColor: temp.selectionColor,
              semanticsLabel: temp.semanticsLabel,
              softWrap: temp.softWrap,
              strutStyle: temp.strutStyle,
              textDirection: temp.textDirection,
              textHeightBehavior: temp.textHeightBehavior,
              textScaleFactor: temp.textScaleFactor,
              textWidthBasis: temp.textWidthBasis,
            );
          } else {
            outSideLabelText = widget.decoration!.label!;
          }
        } else {
          outSideLabelText = const SizedBox();
        }

        decoration = InputDecoration(
          labelStyle: null,
          label: null,
          labelText: null,
          contentPadding: widget.decoration!.contentPadding,
          border: widget.decoration!.border,
          suffixIcon: widget.decoration!.suffixIcon,
          suffix: widget.decoration!.suffix,
          hintText: widget.decoration!.hintText,
          icon: widget.decoration!.icon,
          floatingLabelBehavior: widget.decoration!.floatingLabelBehavior,
          iconColor: widget.decoration!.iconColor,
          alignLabelWithHint: widget.decoration!.alignLabelWithHint,
          constraints: widget.decoration!.constraints,
          counter: widget.decoration!.counter,
          counterStyle: widget.decoration!.counterStyle,
          counterText: widget.decoration!.counterText,
          disabledBorder: widget.decoration!.disabledBorder,
          enabled: widget.decoration!.enabled,
          enabledBorder: widget.decoration!.enabledBorder,
          errorBorder: widget.decoration!.errorBorder,
          errorMaxLines: widget.decoration!.errorMaxLines,
          errorStyle: widget.decoration!.errorStyle,
          errorText: widget.decoration!.errorText,
          fillColor: widget.decoration!.fillColor,
          filled: widget.decoration!.filled,
          floatingLabelAlignment: widget.decoration!.floatingLabelAlignment,
          floatingLabelStyle: widget.decoration!.floatingLabelStyle,
          focusColor: widget.decoration!.focusColor,
          focusedBorder: widget.decoration!.focusedBorder,
          focusedErrorBorder: widget.decoration!.focusedErrorBorder,
          helperMaxLines: widget.decoration!.helperMaxLines,
          helperStyle: widget.decoration!.helperStyle,
          helperText: widget.decoration!.helperText,
          hintMaxLines: widget.decoration!.hintMaxLines,
          hintStyle: widget.decoration!.hintStyle,
          hintTextDirection: widget.decoration!.hintTextDirection,
          hoverColor: widget.decoration!.hoverColor,
          isCollapsed: widget.decoration!.isCollapsed,
          isDense: widget.decoration!.isDense,
          prefix: widget.decoration!.prefix,
          prefixIcon: widget.decoration!.prefixIcon,
          prefixIconColor: widget.decoration!.prefixIconColor,
          prefixIconConstraints: widget.decoration!.prefixIconConstraints,
          prefixStyle: widget.decoration!.prefixStyle,
          prefixText: widget.decoration!.prefixText,
          semanticCounterText: widget.decoration!.semanticCounterText,
          suffixIconColor: widget.decoration!.suffixIconColor,
          suffixIconConstraints: widget.decoration!.suffixIconConstraints,
          suffixStyle: widget.decoration!.suffixStyle,
          suffixText: widget.decoration!.suffixText,
        );
      } else {
        decoration = widget.decoration!;
      }
    } else {
      decoration = const InputDecoration();
    }

    late final RegExp exp;
    switch (widget.type) {
      case NumberType.integer:
        exp = RegExp(r'^-?\d*');
        break;
      case NumberType.decimal:
        exp = RegExp(r'^-?\d*\.?\d*');
        break;
      case NumberType.onlyPositiveInt:
        exp = RegExp(r'^\d*');
        break;
      case NumberType.onlyNegativeInt:
        exp = RegExp(r'^-\d*');
        break;
      case NumberType.onlyPositiveDecimal:
        exp = RegExp(r'^\d*\.?\d*');
        break;
      case NumberType.onlyNegativeDecimal:
        exp = RegExp(r'^-\d*\.?\d*');
        break;
    }

    Widget textField = TextFormField(
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      controller: controller,
      focusNode: focusNode,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value.toParseDouble());
        }
        return null;
      },
      onEditingComplete: widget.onEditingComplete ??
          () {
            FocusScope.of(context).nextFocus();
          },
      onFieldSubmitted: (text) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(text.toParseDouble());
        }
      },
      textInputAction: widget.textInputAction,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      onChanged: (text) {
        if (widget.onChanged != null) {
          widget.onChanged!(text.toParseDouble());
        }
      },
      onSaved: (text) {
        if (widget.onSaved != null) {
          widget.onSaved!(text.toParseDouble());
        }
      },
      maxLines: widget.maxLines,
      autovalidateMode: widget.autoValidateMode,
      inputFormatters:
          widget.inputFormatters ?? [FilteringTextInputFormatter.allow(exp)],
      decoration: decoration,
    );
    return widget.outSideLabel
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              outSideLabelText,
              SizedBox(
                height: widget.ourSideLabelGap,
              ),
              textField
            ],
          )
        : textField;
  }

  // @override
  // void didUpdateWidget(AutoBindingNumField oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }
}
