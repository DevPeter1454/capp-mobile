import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FGNSupportScheme extends StatelessWidget {
  const FGNSupportScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTopNavBar(title: "Back to home"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_fgn_scheme.png',
                          height: 32,
                          width: 32,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'FGN Support Scheme',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'See various support scheme by the federal government of Nigeria',
                      style: TextStyle(
                        color: AppColors.descText,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
