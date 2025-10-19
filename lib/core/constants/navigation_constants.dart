enum NavigationConstants {
  root("/"),
  splash("/splash"),
  login("/login"),
  chatId("/{chatId}"),
  mood("/mood"),
  dynamics("/dynamics"),
  profile("/profile");

  final String path;
  const NavigationConstants(this.path);
}
