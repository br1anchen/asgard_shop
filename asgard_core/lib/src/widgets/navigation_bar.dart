import 'package:asgard_core/asgard_core.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    Key? key,
    this.leading,
    required this.body,
    this.trailing,
  }) : super(key: key);

  final Widget? leading;
  final Widget body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final leading = this.leading;
    final trailing = this.trailing;
    return NavigationBarContainer(
      child: Row(
        children: [
          if (leading != null) ...[
            leading,
            const AppGap.regular(),
          ],
          Expanded(
            child: body,
          ),
          if (trailing != null) ...[
            const AppGap.regular(),
            trailing,
          ],
        ],
      ),
    );
  }
}

class NavigationBarContainer extends StatelessWidget {
  const NavigationBarContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppContainer(
      padding: const AppEdgeInsets.regular(),
      decoration: BoxDecoration(
        color: theme.colors.actionBarBackground,
        borderRadius: theme.radius.asBorderRadius().regular,
      ),
      child: child,
    );
  }
}