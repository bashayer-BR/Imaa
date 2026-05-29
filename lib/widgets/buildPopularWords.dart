import 'package:flutter/material.dart';
import 'package:imaa/classes/Word.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';

Widget buildPopularWords(AppDimensions d) {
    final words = [
      Word(arabic: 'شكرًا',  english: 'Thank you', icon: Icons.sign_language_rounded),
      Word(arabic: 'نعم',    english: 'Yes',        icon: Icons.sign_language_rounded),
      Word(arabic: 'أهلاً',  english: 'Welcome',    icon: Icons.sign_language_rounded),
      Word(arabic: 'وداعًا', english: 'Goodbye',    icon: Icons.sign_language_rounded),
      Word(arabic: 'لا',     english: 'No',         icon: Icons.sign_language_rounded),
      Word(arabic: 'وداعًا', english: 'Goodbye',    icon: Icons.sign_language_rounded),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: List.generate(words.length, (i) {
          final w = words[i];
          final isLast = i == words.length - 1;
          return Column(
            children: [
              GestureDetector(
                onTap: () {},
                
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: d.spaceM,
                    vertical: d.spaceM,
                  ),
                  child: Row(
                    children: [
                      // Hand icon
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.glowTeal,
                          borderRadius: BorderRadius.circular(d.radiusM),
                        ),
                        child: const Icon(
                          Icons.sign_language_rounded,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: d.spaceM),

                      // Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              w.arabic,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: d.fontM,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: d.spaceXS - 2),
                            Text(
                              w.english,
                              style: TextStyle(
                                color: AppColors.textHint,
                                fontSize: d.fontS,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Arrow
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.primary,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              if (!isLast)
                Divider(
                  color: AppColors.divider,
                  height: 1,
                  indent: d.hPad,
                ),
            ],
          );
        }),
      ),
    );
  }