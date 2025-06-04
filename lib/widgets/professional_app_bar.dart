import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/screen_provider.dart';

class ProfessionalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppScreen? previousScreen;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final double elevation;

  const ProfessionalAppBar({
    super.key,
    this.title,
    this.previousScreen,
    this.actions,
    this.showBackButton = true,
    this.centerTitle = true,
    this.leading,
    this.backgroundColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.grey[900],
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading ?? (showBackButton && previousScreen != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18),
              onPressed: () => screenProvider.setCurrentScreen(previousScreen!),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey[800]?.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            )
          : null),
      title: title != null
          ? Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.asset('assets/images/logo.png', height: 16, width: 16),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}