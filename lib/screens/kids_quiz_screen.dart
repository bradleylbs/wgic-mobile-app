import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wgic_app/utils/quiz_provider.dart';

class KidsQuizScreen extends StatelessWidget {
  const KidsQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kids Bible Quiz')),
      body: Consumer<QuizProvider>(
        builder: (context, quiz, _) {
          if (quiz.completed) {
            final isPerfect = quiz.score == quiz.questions.length;
            final isHigh = quiz.score >= (quiz.questions.length * 0.8).ceil();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isPerfect)
                    const Icon(Icons.stars, size: 72, color: Colors.greenAccent),
                  if (!isPerfect)
                    const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
                  const SizedBox(height: 16),
                  Text('Quiz Complete!', style: Theme.of(context).textTheme.headlineSmall),
                  Text('Score: ${quiz.score} / ${quiz.questions.length}', style: Theme.of(context).textTheme.titleMedium),
                  if (isPerfect)
                    const Text('Perfect Score! You are a Bible Star!', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                  if (!isPerfect && isHigh)
                    const Text('Great job! Almost perfect!', style: TextStyle(color: Colors.blueAccent)),
                  if (!isPerfect && !isHigh)
                    const Text('Keep learning and try again!', style: TextStyle(color: Colors.orangeAccent)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => quiz.reset(),
                    child: const Text('Try Again'),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Parent Progress'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Quiz History:'),
                              const SizedBox(height: 12),
                              // Example stubbed history
                              Row(
                                children: const [
                                  Icon(Icons.check_circle, color: Colors.green, size: 18),
                                  SizedBox(width: 8),
                                  Text('Last Score: 2/2'),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.check_circle, color: Colors.green, size: 18),
                                  SizedBox(width: 8),
                                  Text('Previous: 1/2'),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text('More detailed parental dashboard coming soon!'),
                            ],
                          ),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
                        ),
                      );
                    },
                    icon: const Icon(Icons.family_restroom_outlined),
                    label: const Text('Parent Progress'),
                  ),
                ],
              ),
            );
          }
          final q = quiz.questions[quiz.current];
          final progress = (quiz.current + 1) / quiz.questions.length;
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(value: progress, minHeight: 8, backgroundColor: Colors.grey[800], color: Colors.blueAccent),
                const SizedBox(height: 16),
                Text('Question ${quiz.current + 1} of ${quiz.questions.length}', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                Text(q.question, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 24),
                ...List.generate(q.options.length, (i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => quiz.answer(i),
                    child: Text(q.options[i]),
                  ),
                )),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Map View'),
              content: SizedBox(
                width: 300,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.map, size: 64, color: Colors.blueAccent),
                    const SizedBox(height: 16),
                    Text('Quiz Map: Bible Locations', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        shrinkWrap: true,
                        children: const [
                          ListTile(
                            leading: Icon(Icons.place, color: Colors.green),
                            title: Text('Jericho'),
                            subtitle: Text('Walls fell down (Joshua 6)'),
                          ),
                          ListTile(
                            leading: Icon(Icons.place, color: Colors.orange),
                            title: Text('Bethlehem'),
                            subtitle: Text('Birthplace of Jesus'),
                          ),
                          ListTile(
                            leading: Icon(Icons.place, color: Colors.purple),
                            title: Text('Mount Sinai'),
                            subtitle: Text('Moses received 10 Commandments'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
              ],
            ),
          );
        },
        icon: const Icon(Icons.map_outlined),
        label: const Text('Map View'),
      ),
    );
  }
}
