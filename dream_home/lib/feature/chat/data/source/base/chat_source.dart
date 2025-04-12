abstract class ChatSource {
  Future<Map<String, dynamic>> getAllChats({
    required String userid,
  });

  Future<Map<String, dynamic>> getChatMessages({
    required String senderId,
    required String receiverId,
  });
}
