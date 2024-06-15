class QuizModel {
  final Map<String, dynamic> question;
  final Map<String, dynamic> options;

  QuizModel({required this.question, required this.options});

  // factory QuizzModel.forTest() {
  //   return QuizzModel(question: {
  //     'Who is the current President of Nigeria?': "C"
  //   }, options: {
  //     "A": "Bola Hihmed Tinubu",
  //     "B": "Bola Zahmed Tinubu",
  //     "C": "Bola Ahmed Tinubu",
  //     "D": "Bola Ahamed Tinubu",
  //     "E": "Bola zhmed Tinubu",
  //   });
  // }
}

final List<QuizModel> quizzList = [
  QuizModel(question: {
    'Who is the current President of Nigeria?': "C"
  }, options: {
    "A": "Bola Hihmed Tinubu",
    "B": "Bola Zahmed Tinubu",
    "C": "Bola Ahmed Tinubu",
    "D": "Bola Ahamed Tinubu",
    "E": "Bola zhmed Tinubu",
  }),
  QuizModel(question: {
    'Who is the current Senate President of Nigeria?': "C"
  }, options: {
    "A": "Bola Hihmed Tinubu",
    "B": "Bola Zahmed Tinubu",
    "C": "Goodswill Akapbio",
    "D": "Sen Precious Batta",
    "E": "No Idea",
  }),
  QuizModel(question: {
    'Who is the current Pluto President of Nigeria?': "C"
  }, options: {
    "A": "Bola Hihmed Tinubu",
    "B": "Bola Zahmed Tinubu",
    "C": "Sen Goodswill Akapbio",
    "D": "Sen Precious Batta",
    "E": "No Idea",
  }),
];
