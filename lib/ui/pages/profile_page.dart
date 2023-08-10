part of com.akaunt.app.pages;

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "ProfilePage";

  void switchThemeMode(WidgetRef ref) {
    ref.read(themeProvider.notifier).state =
        ref.read(themeProvider) == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          HeaderProfile(onChangeTheme: () {
            switchThemeMode(ref);
          }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleProfile(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaItem(iconData: FontAwesomeIcons.slack),
                  SpaceSocialMedia(),
                  SocialMediaItem(iconData: FontAwesomeIcons.github),
                  SpaceSocialMedia(),
                  SocialMediaItem(iconData: FontAwesomeIcons.whatsapp),
                  SpaceSocialMedia(),
                  SocialMediaItem(iconData: FontAwesomeIcons.linkedinIn),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * .1, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      textAlign: TextAlign.start,
                      style: Headings.title.copyWith(
                        color: Theme.of(context).colorScheme.oppositeColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.oppositeColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SpaceSocialMedia extends StatelessWidget {
  const SpaceSocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 8);
  }
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({
    Key? key,
    required this.iconData,
  }) : super(key: key);
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 27,
      backgroundColor: AkauntColors.blue,
      child: Icon(
        iconData,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
