import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppScreen previousScreen;
  final List<Widget>? actions;
  final bool showLogo;
  final bool isTransparent;
  final Widget? flexibleSpace;
  final double height;

  const ModernAppBar({
    super.key,
    required this.title,
    this.previousScreen = AppScreen.home,
    this.actions,
    this.showLogo = true,
    this.isTransparent = false,
    this.flexibleSpace,
    this.height = kToolbarHeight + 16,
  });

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: isTransparent 
            ? null 
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[900]!,
                  Colors.black,
                ],
              ),
        boxShadow: isTransparent 
            ? null 
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: flexibleSpace ?? SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Back button with animated container
              InkWell(
                onTap: () => screenProvider.setCurrentScreen(previousScreen),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[800]!.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18),
                ),
              ),
              const SizedBox(width: 16),
              
              // Title with logo
              Expanded(
                child: Row(
                  children: [
                    if (showLogo) ...[
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/logo.png', height: 18, width: 18),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Action buttons
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}