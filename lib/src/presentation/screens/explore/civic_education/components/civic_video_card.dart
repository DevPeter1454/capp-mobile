import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CappCustomCardView extends StatelessWidget {
  final bool isCivicVideo;
  final String imageUrl, namePartyLeader;
  final Function()? onTap;
  const CappCustomCardView({
    super.key,
    this.isCivicVideo = true,
    this.imageUrl = 'assets/images/vol1.png',
    this.namePartyLeader = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCivicVideo ? onTap : null,
      child: Container(
        width: isCivicVideo ? 357 : 300,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: isCivicVideo ? BoxFit.cover : BoxFit.fill,
          ),
        ),
        child: isCivicVideo
            ? Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'HISTORY OF\nNIGERIA: VOLUME 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            : Stack(
                children: [
                  Positioned(
                    bottom: 0.2,
                    child: Row(
                      children: [
                        Container(
                          height: 46,
                          width: 390,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                            color: AppColors.primary,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                namePartyLeader,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
