
import 'package:flutter/material.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';
import 'package:imaa/widgets/buildCategoriesGrid.dart';
import 'package:imaa/widgets/buildPopularWords.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d  = AppDim.of(context);
    final mq = MediaQuery.of(context);

    return Scaffold(

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: d.hPad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: d.spaceM),
      
              // ── Header ───────────────────────────────
              _buildHeader(d),
              SizedBox(height: d.spaceL),
      
              // ── Search bar ───────────────────────────
              _buildSearchBar(d),
              SizedBox(height: d.spaceL),
      
              // ── Categories label ─────────────────────
              Text(
                'الفئات',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: d.fontL,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: d.spaceM),
      
              // ── 2x3 categories grid ──────────────────
              buildCategoriesGrid(d),
              SizedBox(height: d.spaceL),
      
              // ── Most searched label ──────────────────
              Text(
                'الكلمات الأكثر بحثًا',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: d.fontL,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: d.spaceM),
      
              // ── Popular words list ───────────────────
              
              buildPopularWords(d),
              SizedBox(height: d.spaceL),
            ],
          ),
        ),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────

  Widget _buildHeader(AppDimensions d) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'قاموس الإشارات',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: d.fontXL,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: d.spaceXS),
            Text(
              'ابحث عن أي إشارة بسهولة',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: d.fontS,
              ),
            ),
          ],
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(d.radiusM),
            border: Border.all(color: AppColors.divider),
          ),
          child: const Icon(
            Icons.filter_list_rounded,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ),
      ],
    );
  }

  // ── Search bar ───────────────────────────────────────────

  Widget _buildSearchBar(AppDimensions d) {
    return Container(
      height: d.btnHeightSecond,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(d.radiusXL),
        border: Border.all(
          color: _searchQuery.isNotEmpty
              ? AppColors.primary.withOpacity(0.6)
              : AppColors.divider,
          width: 1.5,
        ),
        boxShadow: _searchQuery.isNotEmpty
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.12),
                  blurRadius: 12,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: TextField(
        controller: _searchCtrl,
        textDirection: TextDirection.rtl,
        onChanged: (v) => setState(() => _searchQuery = v),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: d.fontM,
        ),
        decoration: InputDecoration(
          hintText: 'ابحث عن كلمة أو عبارة...',
          hintStyle: TextStyle(
            color: AppColors.textHint,
            fontSize: d.fontM,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.primary,
          ),
          suffixIcon: _searchQuery.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _searchCtrl.clear();
                    setState(() => _searchQuery = '');
                  },
                  child: const Icon(
                    Icons.close_rounded,
                    color: AppColors.textHint,
                    size: 18,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: d.spaceM),
        ),
      ),
    );
  }
}




