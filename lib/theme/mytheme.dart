import 'dart:ui';

class Mytheme {
  static const primaryPurple = Color(0xFF534AB7); // header, button, icon
  static const lightPurple = Color(0xFFEEEDFE); // icon bg, category card bg
  static const purpleTitle = Color(0xFFEEEDFE); // header title text
  static const purpleSubtitle = Color(0xFFAFA9EC); // header subtitle text
  static const darkPurple = Color(0xFF3C3489); // category card text
  static const tealBg = Color(0xFFE1F5EE); // difficulty card bg
  static const tealDark = Color(0xFF085041); // difficulty card text
  static const tealMid = Color(0xFF0F6E56); // difficulty card icon
  static const statsBg = Color(0xFFF5F5F5); // stats row bg

  //********************* Quiz Screen  ******************************* */
  static const quizBg = Color(0xFF0F0F1A); // Scaffold backgroundColor
  static const cardBg = Color(
    0xFF1E1E35,
  ); // question card bg, option card bg, points/timer container bg
  static const optionUnselected = Color(
    0xFF2A2A4E,
  ); // option circle bg, LinearProgressIndicator backgroundColor
  static const correctGreen = Color(
    0xFF1D9E75,
  ); // correct option card border, check icon, circle bg
  static const wrongRed = Color(
    0xFFE24B4A,
  ); // wrong option card border, close icon, circle bg
  static const pointsGold = Color(0xFFFAC775); // points text, trophy icon color
  static const timerGreen = Color(0xFF5DCAA5); // timer text, clock icon color
  static const progressActive = Color(
    0xFF534AB7,
  ); // LinearProgressIndicator color, Next button bg, selected option circle bg
  static const optionTextDim = Color(
    0xFFAFA9EC,
  ); // unselected option text color after answer is submitted

  //************************** Result Screen ********************************************* */
  // Background
  static const Color scaffoldBackground = Color(0xFF0D0F1E);
  static const Color cardBackground = Color(0xFF1A1D35);
  static const Color cardBorder = Color(0xFF2E3260);

  // Trophy Circle
  static const Color trophyCircleBg = Color(0xFFE8E8F0);
  static const Color trophyIcon = Color(0xFFF5A623);

  // Text
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textSubtitle = Color(0xFF7B7FD4);
  static const Color textLabel = Color(0xFFB0B3D6);
  static const Color textScoreTotal = Color(0xFF7B7FD4);
  static const Color textPointsEarned = Color(0xFFF5A623);

  // Correct Card
  static const Color correctCardBg = Color(0xFF1B3A2B);
  static const Color correctAccent = Color(0xFF4CAF50);
  static const Color correctLabel = Color(0xFF81C784);

  // Incorrect Card
  static const Color incorrectCardBg = Color(0xFF3A1B1B);
  static const Color incorrectAccent = Color(0xFFE53935);
  static const Color incorrectLabel = Color(0xFFEF9A9A);

  // Buttons
  static const Color playAgainBg = Color(0xFF5C6BC0);
  static const Color goHomeBg = Color(0xFF3949AB);
  static const Color buttonText = Color(0xFFFFFFFF);
}
