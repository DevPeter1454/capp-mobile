
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CappCustomFormField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSavedValue;
  final String? hintText, value;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatter;
  final bool isTextObscure, isFilledTransparent, hasAutoValidate, isValidated;
  final TextEditingController? controller;
  final Widget? suffixIcon, suffix, prefixIcon, prefix;
  final TextInputType? keyboardType;
  final int? minLines, maxLines, maxLength;
  final bool isNotBorder, isEnabled;
  final FocusNode? focus;
  final TextStyle? hintStyle, textStyle;
  final EdgeInsets? padding;
  final BoxConstraints? suffixIconConstraints;
  final Color? fillColor;
  final double radius;

  const CappCustomFormField({
    Key? key,
    this.onChanged,
    this.onSavedValue,
    this.hintText,
    this.value,
    this.validator,
    this.inputFormatter,
    this.isTextObscure = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.minLines,
    this.maxLines,
    this.isFilledTransparent = false,
    this.hasAutoValidate = true,
    this.maxLength,
    this.radius = 8,
    this.isNotBorder = false, this.isEnabled = true, this.focus, this.hintStyle, this.textStyle,
    this.padding, this.isValidated = false, this.suffixIconConstraints, this.prefixIcon, this.prefix,  this.fillColor ,
  }) : super(key: key);

  @override
  State<CappCustomFormField> createState() => _CappCustomFormFieldState();
}

class _CappCustomFormFieldState extends State<CappCustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return widget.maxLines != null ? TextFormField(
            key: const ValueKey(0),
            decoration: InputDecoration(
              enabledBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) : OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(widget.radius)),
                borderSide:
                BorderSide(color: widget.isValidated ? const Color(0xFF6FBE45) :
                theme.isDarkMode ? const Color(0xFFCACBCA) : const Color(0xFFA1A3A2) ,
                    width: 0.7),
              ),
              focusedBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(
                    color:  Theme.of(context).highlightColor, width: 0.7),
              ),
              errorBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) :  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(color: Colors.redAccent, width: 0.7),
              ),
              focusedErrorBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) :  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(color: Colors.redAccent, width: 0.7),
              ),
              disabledBorder:  const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
              border: widget.isNotBorder ?  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(color: widget.isValidated ? const Color(0xFF6FBE45) : Colors.transparent, width: 0.7),
              ),
              isDense: true,
              filled: !widget.isNotBorder || widget.fillColor!=null,
              suffixIcon: widget.suffixIcon,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              fillColor: widget.isFilledTransparent ? Colors.transparent : widget.fillColor,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              errorStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: Colors.red,

              ),
              contentPadding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              suffix: widget.suffix,
              suffixIconConstraints: widget.suffixIconConstraints ?? const BoxConstraints(
                minHeight: 32,
                minWidth: 32,
              ),
            ),
            autovalidateMode: widget.hasAutoValidate ? AutovalidateMode
                .onUserInteraction : null,
            obscureText: widget.isTextObscure,
            onSaved: widget.onSavedValue,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            enabled: widget.isEnabled,
            textCapitalization: !widget.isTextObscure ? TextCapitalization
                .sentences : TextCapitalization.none,
            minLines: widget.minLines,
            onChanged: widget.onChanged,
            focusNode: widget.focus,
            style: widget.textStyle ??
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            controller: widget.controller,
            inputFormatters: widget.inputFormatter,
            validator: widget.validator,
          )
              : TextFormField(
            key: const ValueKey(0),
            decoration: InputDecoration(
              enabledBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide:
                BorderSide(color: widget.isValidated ? const Color(0xFF6FBE45) :
                theme.isDarkMode ? const Color(0xFFCACBCA) : const Color(0xFFA1A3A2) ,
                    width: 0.7),
              ),
              focusedBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(
                    color: Theme.of(context).highlightColor, width: 0.7),
              ),
              errorBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) :  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(color: Colors.redAccent, width: 0.7),
              ),
              focusedErrorBorder: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) :  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(color: Colors.redAccent, width: 0.7),
              ),
              border: widget.isNotBorder ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.7),
              ) : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                borderSide: BorderSide(color: widget.isValidated ? const Color(0xFF6FBE45) : Colors.transparent, width: 0.7),
              ),
              disabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              isDense: true,
              filled: !widget.isNotBorder || widget.fillColor!=null,
              suffixIcon: widget.suffixIcon,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              fillColor: widget.isFilledTransparent ? Colors.transparent : widget.fillColor,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              contentPadding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              suffix: widget.suffix,
              suffixIconConstraints: widget.suffixIconConstraints ?? const BoxConstraints(
                minHeight: 32,
                minWidth: 32,
              ),
              errorStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  color: Colors.red
              ),
            ),
            obscureText: widget.isTextObscure,
            onSaved: widget.onSavedValue,
            keyboardType: widget.keyboardType,
            enabled: widget.isEnabled,
            textAlignVertical: TextAlignVertical.center,
            focusNode: widget.focus,
            textCapitalization: !widget.isTextObscure ? TextCapitalization
                .sentences : TextCapitalization.none,
            autovalidateMode: widget.hasAutoValidate ? AutovalidateMode
                .onUserInteraction : null,
            style: widget.textStyle ??
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            onChanged: widget.onChanged,
            controller: widget.controller,
            inputFormatters: widget.inputFormatter,
            validator: widget.validator,
          );
        });
  }
}
