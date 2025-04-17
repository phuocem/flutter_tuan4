import 'package:flutter/material.dart';
import 'package:flutter_tuan4/modles/store_modle.dart';
import 'package:flutter_tuan4/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  course.imageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Center(child: Icon(Icons.broken_image, size: 80)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              course.title,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person, color: Colors.teal, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    course.instructor,
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                  ),
                ),
                const Icon(Icons.sell, size: 20, color: Colors.green),
                const SizedBox(width: 4),
                Text(
                  '${course.soldQuantity} đã bán',
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.green[700]),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.schedule, size: 20, color: Colors.blue),
                const SizedBox(width: 8),
                Text('${course.durationMinutes} phút',
                    style: theme.textTheme.bodyMedium),
              ],
            ),

            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              children: course.tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Colors.teal.shade50,
                  labelStyle: const TextStyle(fontSize: 14),
                  side: BorderSide.none,
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
            Text(
              '📘 Mô tả khóa học:',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              course.description,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
            ),

            const SizedBox(height: 24),

            // Nút Add to Cart
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  final cart = Provider.of<CartProvider>(context, listen: false);
                  final newCourse = CourseInCart(
                    id: course.id,
                    title: course.title,
                    imageUrl: course.imageUrl,
                    description: course.description,
                    instructor: course.instructor,
                    durationMinutes: course.durationMinutes,
                    tags: course.tags,
                  );
                  final added = cart.addItem(newCourse);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        added
                            ? '✅ Đã thêm: ${newCourse.title}'
                            : '⚠️ ${newCourse.title} đã có trong giỏ hàng',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Thêm vào giỏ hàng"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  elevation: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
