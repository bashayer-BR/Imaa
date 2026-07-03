import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/app_colors.dart';
Widget buildInputCard(AppDimensions d,TextEditingController _textCtrl,void Function(String)? onChange) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusL),
        border: Border.all(
          color: _textCtrl.text.isNotEmpty
              ? AppColors.primary.withOpacity(0.5)
              : AppColors.divider,
          width: 1.5,
        ),
        boxShadow: _textCtrl.text.isNotEmpty
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.08),
                  blurRadius: 16,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: Column(
        children: [
          // Text field
          TextField(
            controller: _textCtrl,
            textDirection: TextDirection.rtl,
            maxLines: 4,
            minLines: 3,
            onChanged: onChange,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: d.fontM,
              height: 1.6,
            ),
            decoration: InputDecoration(
              hintText: 'أدخل الكلمة أو العبارة...',
              hintStyle: TextStyle(
                color: AppColors.textHint,
                fontSize: d.fontM,
              ),
              contentPadding: EdgeInsets.all(d.spaceM),
              border: InputBorder.none,
            ),
          ),

          // Bottom bar of card
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: d.spaceM,
              vertical: d.spaceS,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.divider),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_textCtrl.text.length}/200',
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: d.fontXS,
                  ),
                ),
                Row(
                  children: [
                    // Mic icon
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.bgSurface,
                          borderRadius: BorderRadius.circular(d.radiusS),
                        ),
                        child: Icon(
                          Icons.mic_none_rounded,
                          color: AppColors.primary,
                          size: d.iconS,
                        ),
                      ),
                    ),
                    SizedBox(width: d.spaceS),
                    // Copy icon
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.bgSurface,
                          borderRadius: BorderRadius.circular(d.radiusS),
                        ),
                        child: Icon(
                          Icons.copy_rounded,
                          color: AppColors.textHint,
                          size: d.iconS,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }