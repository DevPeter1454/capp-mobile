import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_btn.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';

enum ErrorType {
  noInternetError,
  serverDownError,
  unknownAppError;

  String get errorMessage {
    switch (this) {
      case noInternetError:
        return "Oops! It looks like you're not connected to the internet. Please check your connection and try again.";

      case serverDownError:
        return "Apologies, our server is temporarily offline. We're working to fix it ASAP. Please check back shortly.";

      case unknownAppError:
      default:
        return 'Apologies! An unexpected error has occurred. We are working to resolve it and will be back shortly.';
    }
  }

  String get title {
    switch (this) {
      case noInternetError:
        return "No Internet Connection";

      case serverDownError:
        return "Server Down";

      case unknownAppError:
      default:
        return 'Unknown Error';
    }
  }

  Widget get icon {
    switch (this) {
      case noInternetError:
        return const Icon(
          Icons.signal_cellular_connected_no_internet_4_bar_outlined,
          size: 45,
          color: AppColors.primary,
        );

      case serverDownError:
        return const Icon(
          Icons.signal_cellular_connected_no_internet_4_bar_outlined,
          size: 45,
          color: AppColors.primary,
        );

      case unknownAppError:
      default:
        return const Icon(
          Icons.signal_cellular_connected_no_internet_4_bar_outlined,
          size: 45,
          color: AppColors.primary,
        );
    }
  }
}

class CappErrorScreen extends StatelessWidget {
  final ErrorType errorType;
  final VoidCallback? onTryAgain;

  const CappErrorScreen({
    super.key,
    required this.errorType,
    this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          errorType.icon,
          SizedBox(
            height: context.heightPercentage(.065),
          ),
          Text(
            errorType.errorMessage,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.heightPercentage(.065),
          ),
          if (onTryAgain != null)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: CappCustomButton(
                isSolidColor: true,
                isActive: true,
                onPress: onTryAgain,
                child: const Text(
                  'Try Again',
                  style: TextStyle(
                    color: Colors.white,
                    // : Colors.white.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
