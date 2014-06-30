library pattern.ascii_to_morse;

String convertAsciiLetterToMorse(String letter) {
  String lowerCaseLetter = letter.toLowerCase();
  String morseLetter;
  
  switch(lowerCaseLetter) {
    case "a": morseLetter = "*-"; break;
    case "b": morseLetter = "-***"; break;
    case "c": morseLetter = "-*-*"; break;
    case "d": morseLetter = "-**"; break;
    case "e": morseLetter = "*"; break;
    case "f": morseLetter = "**-*"; break;
    case "g": morseLetter = "--*"; break;
    case "h": morseLetter = "****"; break;
    case "i": morseLetter = "**"; break;
    case "j": morseLetter = "*---"; break;
    case "k": morseLetter = "-*-"; break;
    case "l": morseLetter = "*-**"; break;
    case "m": morseLetter = "--"; break;
    case "n": morseLetter = "-*"; break;
    case "o": morseLetter = "---"; break;
    case "p": morseLetter = "*--*"; break;
    case "q": morseLetter = "--*-"; break;
    case "r": morseLetter = "*-*"; break;
    case "s": morseLetter = "***"; break;
    case "t": morseLetter = "-"; break;
    case "u": morseLetter = "**-"; break;
    case "v": morseLetter = "***-"; break;
    case "w": morseLetter = "*--"; break;
    case "x": morseLetter = "-**-"; break;
    case "y": morseLetter = "-*--"; break;
    case "z": morseLetter = "--**"; break;
  }

  /*
  if (lowerCaseLetter == "a") {
    morseLetter = "*- ";
: "b") {
    morseLetter = "-*** ";
  } else if (lowerCaseLetter =="c") {
    morseLetter = "-*-* ";
  } else if (lowerCaseLetter =="d") {
    morseLetter = "-** ";
  } else if (lowerCaseLetter =="e") {
    morseLetter = "* ";
  } else if (lowerCaseLetter =="f") {
    morseLetter = "**-* ";
  } else if (lowerCaseLetter =="g") {
    morseLetter = "--* ";
  } else if (lowerCaseLetter =="h") {
    morseLetter = "**** ";
  } else if (lowerCaseLetter =="i") {
    morseLetter = "** ";
  } else if (lowerCaseLetter =="j") {
    morseLetter = "*--- ";
  } else if (lowerCaseLetter =="k") {
    morseLetter = "-*- ";
  } else if (lowerCaseLetter =="l") {
    morseLetter = "*-** ";
  } else if (lowerCaseLetter =="m") {
    morseLetter = "-- ";
  } else if (lowerCaseLetter =="n") {
    morseLetter = "-* ";
  } else if (lowerCaseLetter =="o") {
    morseLetter = "--- ";
  } else if (lowerCaseLetter =="p") {
    morseLetter = "*--* ";
  } else if (lowerCaseLetter =="q") {
    morseLetter = "--*- ";
  } else if (lowerCaseLetter =="r") {
    morseLetter = "*-* ";
  } else if (lowerCaseLetter =="s") {
    morseLetter = "*** ";
  } else if (lowerCaseLetter =="t") {
    morseLetter = "- ";
  } else if (lowerCaseLetter =="u") {
    morseLetter = "**- ";
  } else if (lowerCaseLetter =="v") {
    morseLetter = "***- ";
  } else if (lowerCaseLetter =="w") {
    morseLetter = "*-- ";
  } else if (lowerCaseLetter =="x") {
    morseLetter = "-**- ";
  } else if (lowerCaseLetter =="y") {
    morseLetter = "-*-- ";
  } else if (lowerCaseLetter =="z") {
    morseLetter = "--** ";
  }
  */
  
  return morseLetter;
}