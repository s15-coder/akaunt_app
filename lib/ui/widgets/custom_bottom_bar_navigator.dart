part of com.akaunt.app.widgets;

class CustomBottomBarNavigator extends StatelessWidget {
  const CustomBottomBarNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: 0.2),
          ),
        ),
      ),
      width: size.width,
      height: 60,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _CustomBottomNavigatorItem(
            iconData: FontAwesomeIcons.house,
          ),
          _CustomBottomNavigatorItem(
            iconData: FontAwesomeIcons.chartLine,
            active: true,
          ),
          _CustomBottomNavigatorItem(
            iconData: FontAwesomeIcons.basketball,
          ),
          _CustomBottomNavigatorItem(
            iconData: FontAwesomeIcons.arrowRightArrowLeft,
          ),
          _CustomBottomNavigatorItem(
            iconData: Icons.menu,
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNavigatorItem extends StatelessWidget {
  const _CustomBottomNavigatorItem({
    Key? key,
    this.active = false,
    required this.iconData,
  }) : super(key: key);
  final bool active;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 10,
      decoration: BoxDecoration(
          border: active
              ? Border(
                  top: BorderSide(
                    color: AkauntColors.blue,
                    width: 2,
                  ),
                )
              : null),
      height: double.infinity,
      child: Icon(
        iconData,
        color: active ? AkauntColors.blue : Colors.grey,
      ),
    );
  }
}
