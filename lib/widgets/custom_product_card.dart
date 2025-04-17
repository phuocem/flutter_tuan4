import 'package:flutter/material.dart';
import 'package:flutter_tuan4/modles/store_modle.dart';
import 'package:flutter_tuan4/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({super.key, required this.course});

  final Course course;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/info',
          arguments: widget.course,
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: isHovering ? 6 : 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.course.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.course.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.course.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () {
                    final cart = Provider.of<CartProvider>(context, listen: false);
                    final newCourse = CourseInCart(
                      id: widget.course.id,
                      title: widget.course.title,
                      imageUrl: widget.course.imageUrl,
                      description: widget.course.description,
                      instructor: widget.course.instructor,
                      durationMinutes: widget.course.durationMinutes,
                      tags: widget.course.tags,
                    );
                    cart.addItem(newCourse);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đã thêm: ${newCourse.title}')),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text('Add to Cart'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
