import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shaty/extensions/localization_extension.dart';
import 'package:shaty/screens/doctor/widget/create_tips_bottom_sheet.dart';
import '../../../core/constants/app_colors.dart';

class TipsSection extends StatelessWidget {
  const TipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      'اشرب الماء بانتظام خلال اليوم.',
      'نم جيدًا لتحسين صحتك النفسية.',
      'مارس الرياضة 3 مرات أسبوعيًا.',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.loc.daily_tips,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _showCreateTipsBottomSheet(context);                },
                icon:
                    const Icon(Icons.add_circle, color: AppColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 180, // ارتفاع يكفي لعرض 3 نصائح تقريبًا مع تمرير
            child: ListView.separated(
              itemCount: tips.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final tip = tips[index];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],//or white
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      // الحاجز الأزرق
                      Container(
                        width: 5,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tip,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.edit, size: 20),
                        onPressed: () {
                          // TODO: تعديل النصيحة
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, size: 20),
                        onPressed: () {
                          // TODO: حذف النصيحة
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
  void _showCreateTipsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CreateTipsBottomSheet(),
    );
  }
}
