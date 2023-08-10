part of com.akaunt.app.widgets;

class TitleProfile extends StatelessWidget {
  const TitleProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .395,
          width: size.width,
        ),
        Text(
          'Akaunt Company',
          style: Headings.title.copyWith(
            color: Theme.of(context).colorScheme.oppositeColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          'Financial Services',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
