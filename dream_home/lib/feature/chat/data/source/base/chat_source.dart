abstract class ChatSource {
  Future<Map<String, dynamic>> getAllChats({
    required String userid,
  });

  Future<Map<String, dynamic>> getChatMessages({
    required String senderId,
    required String receiverId,
  });

  Future<Map<String, dynamic>> sendMessage({
    required String senderId,
    required String receiverId,
    required String message,
  });

  Future<Map<String, dynamic>> requestReview({
    required String employeeId,
    required String customerId,
  });
}
