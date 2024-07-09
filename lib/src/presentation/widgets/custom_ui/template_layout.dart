
import 'package:flutter/material.dart';

class TemplateLayout extends StatelessWidget {
  final Widget _child;

  const TemplateLayout({
    super.key,
    required Widget child,
  })  : _child = child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 800),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: _child),
            ),
          ),
         
        ],
      ),
    );
  }
}
