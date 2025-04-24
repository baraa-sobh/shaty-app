import 'package:flutter/material.dart';
import 'package:shaty/core/constants/app_colors.dart';
import 'package:shaty/extensions/localization_extension.dart';
import 'DoctorsPost.dart';

class DoctorPostSection extends StatelessWidget {
  const DoctorPostSection({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية مؤقتًا
    final posts = [
      {
        'text': 'تناول الفواكه والخضروات يوميًا يحسّن مناعتك.',
        'imageUrl': null,
      },
      {
        'text': 'مارس التمارين الرياضية بانتظام لتقليل التوتر.',
        'imageUrl': 'images/post.png',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.new_post,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          itemCount: posts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final post = posts[index];

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200,),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('images/doctor.png'), // صورة الطبيب
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'د.البراء صبح',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: تعديل المنشور
                        },
                        icon: const Icon(Icons.edit, size: 20),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: حذف المنشور
                        },
                        icon: const Icon(Icons.delete_outline, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Text(
                    post['text']!,
                    style: const TextStyle(fontSize: 16),
                  ),

                  if (post['imageUrl'] != null) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        post['imageUrl']!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),

                  /// Action Buttons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PostAction(icon: Icons.favorite_border, label: 'إعجاب'),
                      PostAction(icon: Icons.comment_outlined, label: 'تعليق'),
                      PostAction(icon: Icons.share_outlined, label: 'مشاركة'),
                      PostAction(icon: Icons.bookmark_border, label: 'حفظ'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
