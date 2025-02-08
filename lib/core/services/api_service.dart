import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://your-flask-backend.com"; // Change to your Flask server URL

  // Fetch chatbot response
  Future<String> getChatbotResponse(String query) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"query": query}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? "No response from AI";
      } else {
        throw Exception("Failed to fetch AI response");
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }

  // Send image for AI-based diagnosis
  Future<String> diagnoseImage(String imagePath) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/diagnose'),
      );

      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['diagnosis'] ?? "No diagnosis available";
      } else {
        throw Exception("Failed to diagnose image");
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }

  // Fetch region-based disease alerts
  Future<List<String>> getRegionAlerts(double lat, double lon) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/alerts?lat=$lat&lon=$lon'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<String>.from(data['alerts'] ?? []);
      } else {
        throw Exception("Failed to fetch alerts");
      }
    } catch (e) {
      return ["Error: ${e.toString()}"];
    }
  }
}