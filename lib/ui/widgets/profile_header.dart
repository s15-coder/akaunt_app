part of com.akaunt.app.widgets;

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    required this.onChangeTheme,
    Key? key,
  }) : super(key: key);
  final VoidCallback onChangeTheme;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.25,
          color: AkauntColors.blue,
        ),
        Column(
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0, size.height * 0.14),
                child: CustomCircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: size.width * 0.25,
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0, size.height * 0.15),
                child: CustomCircleAvatar(
                  maxRadius: size.width * 0.24,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/akaunt_logo.jpeg',
                      )),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 35),
          width: size.width,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onChangeTheme,
                icon: const Icon(
                  FontAwesomeIcons.moon,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
