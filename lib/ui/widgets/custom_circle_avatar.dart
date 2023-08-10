part of com.akaunt.app.widgets;

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    this.child,
    this.onTap,
    this.maxRadius,
    this.backgroundColor,
  }) : super(key: key);
  final Widget? child;
  final double? maxRadius;
  final void Function()? onTap;
  final Color? backgroundColor;

  Gradient? get gradient => backgroundColor == null
      ? LinearGradient(
          colors: [
            AkauntColors.green,
            AkauntColors.green.withOpacity(0),
          ],
          begin: Alignment.centerRight,
          end: Alignment.topLeft,
        )
      : null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor ?? Colors.white,
            gradient: gradient,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            maxRadius: maxRadius,
            child: child,
          )),
    );
  }
}
