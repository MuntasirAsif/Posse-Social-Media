import '../model/quiz_option_Model.dart';
import '../model/vibe_cehck_quiz_model.dart';

final List<VibeCheckQuizModel> dummyVibeCheckQuizzes = [
  VibeCheckQuizModel(
    quizId: 'quiz_001',
    dateTime: DateTime.now(),
    questionTitle: 'How are you feeling today?',
    quizOption: [
      QuizOption(
        title: 'Happy',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/men/${i + 1}.jpg',
        ),
      ),
      QuizOption(
        title: 'Sad',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/women/${i + 1}.jpg',
        ),
      ),
      QuizOption(
        title: 'Excited',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/men/${i + 21}.jpg',
        ),
      ),
      QuizOption(
        title: 'Anxious',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/women/${i + 21}.jpg',
        ),
      ),
    ],
  ),
  VibeCheckQuizModel(
    quizId: 'quiz_002',
    dateTime: DateTime.now().subtract(Duration(days: 1)),
    questionTitle: 'Pick a time of day that fits your energy:',
    quizOption: [
      QuizOption(
        title: 'Morning',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/women/${i + 5}.jpg',
        ),
      ),
      QuizOption(
        title: 'Afternoon',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/men/${i + 5}.jpg',
        ),
      ),
      QuizOption(
        title: 'Evening',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/women/${i + 10}.jpg',
        ),
      ),
      QuizOption(
        title: 'Night',
        imageUrls: List.generate(
          20,
          (i) => 'https://randomuser.me/api/portraits/men/${i + 15}.jpg',
        ),
      ),
    ],
  ),
  VibeCheckQuizModel(
    quizId: 'quiz_003',
    dateTime: DateTime.now().subtract(Duration(days: 2)),
    questionTitle: 'How social are you feeling today?',
    quizOption: [
      QuizOption(
        title: 'Introverted',
        imageUrls: List.generate(
          20,
          (i) =>
              i % 2 == 0
                  ? 'https://randomuser.me/api/portraits/women/${i + 10}.jpg'
                  : 'https://randomuser.me/api/portraits/men/${i + 10}.jpg',
        ),
      ),
      QuizOption(
        title: 'Balanced',
        imageUrls: List.generate(
          20,
          (i) =>
              i % 2 == 0
                  ? 'https://randomuser.me/api/portraits/men/${i + 20}.jpg'
                  : 'https://randomuser.me/api/portraits/women/${i + 20}.jpg',
        ),
      ),
      QuizOption(
        title: 'Extroverted',
        imageUrls: List.generate(
          20,
          (i) =>
              i % 2 == 0
                  ? 'https://randomuser.me/api/portraits/women/${i + 30}.jpg'
                  : 'https://randomuser.me/api/portraits/men/${i + 30}.jpg',
        ),
      ),
    ],
  ),
];
