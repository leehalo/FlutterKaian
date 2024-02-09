import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int point = 0;
  String? selectedAnswer;
  bool? isCorrect;
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'Qual o artista conhecido pela música "when I was your man?',
      'answers': [
        'Will Smitch',
        'Shawn Mendes',
        'Bruno Mars',
        'Drake',
      ],
      'correctAnswer': 'Bruno Mars'
    },
    {
      'question':
          'De quem é a musíca que estourou no carnaval de 2024?',
      'answers': [
        'Marina Sena',
        'Ivete Sangalo',
        'Lulu Santos',
        'carlinhos Brown',
      ],
      'correctAnswer': 'Ivete Sangalo'
    },
    {
      'question':
          'A cantora luiza sonza criou uma nova musíca para seu atual namorado?',
      'answers': [
        'Verdadeiro',
        'Falso',
        
      ],
      'correctAnswer': 'Falso',
    },
    {
      'question':
          'Qual artista brasileiro fez o papel de Besouro Azul no filme Besouro Azul?',
      'answers': [
        'Bruna Marquezine',
        'jao',
        'anitta',
        'nenhuma das alternativas',
      ],
      'correctAnswer': 'Bruna Marquezine',
    },
    {
      'question':
          'Larissa Manoela  se separou de seu atual marido?',
      'answers': [
        'Verdadeiro',
        'Falso',

      ],
      'correctAnswer': 'Falso',
    },
  ];
  void handleAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isCorrect = answer == questions[currentQuestionIndex]['correctAnswer'];
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        selectedAnswer = null;
        isCorrect = null;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Quiz sobre Artistas!',
              style: GoogleFonts.ibmPlexMono(
                  fontSize: 20, fontWeight: FontWeight.w400))),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            color: Color.fromARGB(173, 48, 7, 94),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Text(
                currentQuestion['question'],
                style: GoogleFonts.oswald(
                    color: Colors.white, fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Wrap(
              children: currentQuestion['answers'].map<Widget>((resposta) {
            bool isSelected = selectedAnswer == resposta;
            Color? buttonColor;
            if (isSelected) {
              buttonColor = isCorrect! ? const Color.fromARGB(193, 76, 175, 79) : const Color.fromARGB(169, 244, 67, 54);
              isCorrect! ? point++ : null;
            } else {
              buttonColor = Color.fromARGB(255, 82, 81, 81);
            }
            return meuBtn(resposta, () => handleAnswer(resposta), buttonColor);
          }).toList()),
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta, VoidCallback onPressed, Color? color) =>
    Container(
      margin: const EdgeInsets.all(16),
      width: 140,
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color, padding: const EdgeInsets.all(16)),
        child: Text(
          resposta,
          style: GoogleFonts.ibmPlexMono(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );