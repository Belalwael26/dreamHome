abstract class ChatSource {
  Future<Map<String, dynamic>> getAllChats({
    required String userid,
  });
}
