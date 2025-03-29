class EndPoints {
  static const String baseurl = "https://grad-project-seven.vercel.app/api";
  static const String login = "/user/login";
  static const String register = "/user/signup";
  static String getNotifications(String userId) => "/notification/user/$userId";
  static String deleteNotification(String id) => "/notification/delete/$id";
  static String addNotification = "/notification/add";
}
