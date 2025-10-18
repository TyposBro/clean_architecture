class ApiConstants {
  ApiConstants._(); // private constructor to prevent instantiation

  static const String baseUrl = ''; // must read from .env

  // Monitoring
  static const String live = '/live';
  static const String ready = '/ready';

  // OAuth Auth endpoints
  static const String googleLogin = '/auth/google/login';
  static const String kakaoLogin = '/auth/kakao/login';
  static const String googleCallback = '/auth/google/callback';
  static const String kakaoCallback = '/auth/kakao/callback';

  // User endpoints
  static const String me = '/users/me';

  // Statistics endpoints (admin only)
  static const String statsGender = '/users/statistics/gender';
  static const String statsAge = '/users/statistics/age';

  // Emotion logs endpoints
  static String activeDays(int userId) =>
      '/users/$userId/emotion_logs/active_days';
  static String emotionLogs(int userId) => '/users/$userId/emotion_logs';

  // Chat endpoints
  static String chats(int userId) => '/users/$userId/chats';
  static String chatMessages(int userId, int chatId) =>
      '/users/$userId/chats/$chatId/messages';

  // Shared info endpoints
  static String sharedInfoPassword(int userId) =>
      '/users/$userId/shared-info/password';
  static String sharedInfoToken(int userId) =>
      '/users/$userId/shared-info/token';
}
