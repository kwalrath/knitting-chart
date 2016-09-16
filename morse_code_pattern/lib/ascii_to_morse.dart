library pattern.ascii_to_morse;

List<String> convertAsciiWordToMorse(String word) {
  var convertedWord = new List<String>(word.length);
  
  for (var i = 0; i < word.length; i++) {
    convertedWord[i] = convertAsciiLetterToMorse(word.substring(i, i+1));
  }
  
  return convertedWord;
}

String convertAsciiWordToMorseString(String word) {
  var sb = new StringBuffer();
  var returnWord;
  
  for (var i = 0; i < word.length; i++) {
    sb.write(convertAsciiLetterToMorse(word.substring(i, i+1)));
    sb.write(' ');
  }
  
  returnWord = sb.toString();
  return returnWord.substring(0, returnWord.length - 1); // delete the final space
}

/// Returns the Morse equivalent of any character a-z or A-Z;
/// for any other character, returns a space.
String convertAsciiLetterToMorse(String letter) {
  String lowerCaseLetter = letter.toLowerCase();
  String morseLetter = ' ';
  
  switch(lowerCaseLetter) {
    case "a": morseLetter = ".-"; break;
    case "b": morseLetter = "-..."; break;
    case "c": morseLetter = "-.-."; break;
    case "d": morseLetter = "-.."; break;
    case "e": morseLetter = "."; break;
    case "f": morseLetter = "..-."; break;
    case "g": morseLetter = "--."; break;
    case "h": morseLetter = "...."; break;
    case "i": morseLetter = ".."; break;
    case "j": morseLetter = ".---"; break;
    case "k": morseLetter = "-.-"; break;
    case "l": morseLetter = ".-.."; break;
    case "m": morseLetter = "--"; break;
    case "n": morseLetter = "-."; break;
    case "o": morseLetter = "---"; break;
    case "p": morseLetter = ".--."; break;
    case "q": morseLetter = "--.-"; break;
    case "r": morseLetter = ".-."; break;
    case "s": morseLetter = "..."; break;
    case "t": morseLetter = "-"; break;
    case "u": morseLetter = "..-"; break;
    case "v": morseLetter = "...-"; break;
    case "w": morseLetter = ".--"; break;
    case "x": morseLetter = "-..-"; break;
    case "y": morseLetter = "-.--"; break;
    case "z": morseLetter = "--.."; break;
    default: print('Letter "$letter" not recognized.');
  }  
  return morseLetter;
}

main() {
  // Dart is [-.., .-, .-., -]
  print('Dart is ${convertAsciiWordToMorse('Dart')}');

  // I <3 Dart is [..,  ,  ,  ,  , -.., .-, .-., -]
  print('I <3 Dart is ${convertAsciiWordToMorse('I <3 Dart')}');

  // H is ....
  print('H is ${convertAsciiLetterToMorse('H')}');

  // Heart Dart is .... . .- .-. -   -.. .- .-. -
  print('Heart Dart is ${convertAsciiWordToMorseString('Heart Dart')}');
}
