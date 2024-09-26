class QuizQuestion {
  final String question;
  final List<String> answer;

  const QuizQuestion(this.question, this.answer);

  List<String> getShuffledList() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
