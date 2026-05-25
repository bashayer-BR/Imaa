
import 'package:flutter/material.dart';
import 'package:imaa/classes/Category.dart';
import 'package:imaa/core/AppDim.dart';
import 'package:imaa/core/theme/theme.dart';

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
              _buildCategoriesGrid(d),
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
              _buildPopularWords(d),
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

  // ── Categories grid ──────────────────────────────────────

  Widget _buildCategoriesGrid(AppDimensions d) {
    final categories = [
      Dicategory(
        label: 'الأرقام',
        icon: Icons.tag_rounded,
        gradient: [const Color(0xFF00D4C8), const Color(0xFF0099CC)],
      ),
      Dicategory(
        label: 'العائلة',
        icon: Icons.family_restroom_rounded,
        gradient: [const Color(0xFF1DB954), const Color(0xFF0D7A37)],
      ),
      Dicategory(
        label: 'الحروف',
        icon: Icons.abc_rounded,
        gradient: [const Color(0xFF0099FF), const Color(0xFF005BB5)],
      ),
      Dicategory(
        label: 'العبارات اليومية',
        icon: Icons.chat_bubble_outline_rounded,
        gradient: [const Color(0xFF9B59B6), const Color(0xFF6C3483)],
      ),
      Dicategory(
        label: 'المشاعر',
        icon: Icons.emoji_emotions_outlined,
        gradient: [const Color(0xFFFF8C00), const Color(0xFFCC5500)],
      ),
      Dicategory(
        label: 'التعارف',
        icon: Icons.waving_hand_rounded,
        gradient: [const Color(0xFFE74C3C), const Color(0xFF922B21)],
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: d.spaceM,
      mainAxisSpacing: d.spaceM,
      childAspectRatio: 1.6,
      children: categories.map((c) => _buildCategoryCard(c, d)).toList(),
    );
  }

  Widget _buildCategoryCard(Dicategory cat, AppDimensions d) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: cat.gradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(d.radiusL),
          boxShadow: [
            BoxShadow(
              color: cat.gradient.first.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: d.spaceM,
            vertical: d.spaceS,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cat.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: d.fontM,
                    fontWeight: FontWeight.w800,
                    height: 1.3,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(cat.icon, color: Colors.white, size: d.iconS + 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Popular words ─────────────────────────────────────────

  Widget _buildPopularWords(AppDimensions d) {
    final words = [
      _Word(arabic: 'شكرًا',  english: 'Thank you', icon: Icons.sign_language_rounded),
      _Word(arabic: 'نعم',    english: 'Yes',        icon: Icons.sign_language_rounded),
      _Word(arabic: 'أهلاً',  english: 'Welcome',    icon: Icons.sign_language_rounded),
      _Word(arabic: 'وداعًا', english: 'Goodbye',    icon: Icons.sign_language_rounded),
      _Word(arabic: 'لا',     english: 'No',         icon: Icons.sign_language_rounded),
      _Word(arabic: 'وداعًا', english: 'Goodbye',    icon: Icons.sign_language_rounded),
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
}

// ── Models ────────────────────────────────────────────────────



class _Word {
  final String arabic;
  final String english;
  final IconData icon;
  const _Word({
    required this.arabic,
    required this.english,
    required this.icon,
  });
}