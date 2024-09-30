import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart'; // Correct import for shelf_router

List<Map<String, dynamic>> quizzes = []; // Store quizzes in memory

void main() async {
  var port = 8080;

  // Create a router for handling different routes
  final router = Router();

  // Route for getting all quizzes
  router.get('/quizzes', (Request request) {
    return Response.ok(jsonEncode(quizzes), headers: {
      'Content-Type': 'application/json',
    });
  });

  // Route for creating a new quiz
  router.post('/quizzes', (Request request) async {
    return await _createQuiz(request);
  });

  // Create a handler for incoming requests
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router);

  // Create and start the server
  var server = await serve(handler, 'localhost', port);
  print('Serving at http://${server.address.host}:${server.port}');
}

// Function to create a quiz
Future<Response> _createQuiz(Request request) async {
  try {
    // Parse the request body
    var payload = await request.readAsString();
    var data = jsonDecode(payload);

    // Validate the incoming data
    if (data['title'] == null || data['description'] == null) {
      return Response.badRequest(body: jsonEncode({'error': 'Title and description are required.'}));
    }

    // Extract quiz data
    var title = data['title'];
    var description = data['description'];

    // Add quiz to the in-memory list
    quizzes.add({
      'title': title,
      'description': description,
    });

    // Respond with a success message
    return Response.ok(jsonEncode({'message': 'Quiz created successfully!'}), headers: {
      'Content-Type': 'application/json',
    });
  } catch (e) {
    return Response.internalServerError(body: jsonEncode({'error': 'An error occurred: ${e.toString()}'}));
  }
}
