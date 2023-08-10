part of com.akaunt.app.widgets;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: size.width,
      height: 70,
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            'Tasa de cambios',
            style: TextStyle(
              color: Theme.of(context).colorScheme.oppositeColor,
              fontSize: 25,
            ),
          ),
          const Spacer(),
          CustomCircleAvatar(
            onTap: () => Navigator.pushNamed(
              context,
              ProfilePage.routeName,
            ),
            child: const Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
