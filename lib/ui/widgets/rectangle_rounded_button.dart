part of com.akaunt.app.widgets;

class RectangleRoundedButton extends StatelessWidget {
  const RectangleRoundedButton({
    Key? key,
    this.filled = false,
    this.label,
    this.padding,
    this.fontSize,
    this.onTap,
  }) : super(key: key);
  final bool filled;
  final String? label;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final void Function()? onTap;

  Color backgroundColor(BuildContext context) =>
      filled ? AkauntColors.blue : Theme.of(context).canvasColor;

  Color borderColor(BuildContext context) =>
      filled ? Colors.white : Theme.of(context).colorScheme.blueOrWhite;

  Color textColor(BuildContext context) =>
      filled ? Colors.white : Theme.of(context).colorScheme.blueOrWhite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor(context),
          border: Border.all(
            color: borderColor(context),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        margin: const EdgeInsets.only(bottom: 9),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 1,
            ),
        child: Text(
          label ?? '',
          style: TextStyle(
            color: textColor(context),
            fontSize: fontSize ?? 12,
          ),
        ),
      ),
    );
  }
}
