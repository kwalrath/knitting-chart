library pattern.knitting_pattern;
import 'ascii_to_morse.dart';
import 'dart:math' as Math;

class KnittingPattern {
  StringBuffer _sb = new StringBuffer();
  List<List> _pattern =  [['Dart',
                           'p','p','p','k','p','k','p', // D
                           'k','k','k',
                           'p','k','p','p','p',         // A
                           'k','k','k',
                           'p','k','p','p','p','k','p', // R
                           'k','k','k',
                           'p','p','p']];               // T

  int get numRows {
    return _pattern != null ? _pattern.length: 0;
  }
  
  int get numStitches {
    if (_pattern == null) return 0;
    
    int maxLength = 0;
    for (int i = 0; i < numRows; i++) {
      maxLength = Math.max(maxLength, _pattern[i].length);
    }
    return maxLength;
  }
  
  int currentRow;

  /**
   * Returns the next row of the pattern,
   * starting at row 0.
   *
   * If the pattern has no more rows, returns null.
   */
  List nextRow() {
    if (_pattern == null) {
      currentRow == null;
      return null;
    }
    
    if (currentRow == null) {
      currentRow = 0;
      return _pattern[currentRow];
    } else if (++currentRow < _pattern.length) {
      return _pattern[currentRow];
    } else {
      currentRow == null;
      return null;
    }
  }
  
  String toString() {
    _sb.clear();
    _pattern.forEach(addRowToSb);
    return _sb.toString();
  }
  
  void addRowToSb(row) {
    if (row != null) {
      _sb.writeln('row ${row[0]}: ${row.sublist(1)}');
    }
  }
}

class MorseCodePattern extends KnittingPattern {
  List<String> morseCode;
  // TODO: Test that DART_IN_MORSE_CODE == default _pattern;
  
  MorseCodePattern(this.morseCode) {
    if (morseCode != null) {
      int numRows = morseCode.length;
      _pattern = new List<List>(numRows);
      var maxStitches = 0;
      
      // Put the stitches into the pattern.
      for (int i = 0; i < numRows; i++) {
        List<String> stitches = convertMorseRowToStitches(morseCode[i]);        
        _pattern[i] = new List<String>();
        _pattern[i].add((i+1).toString());
        _pattern[i].addAll(stitches);
        maxStitches = Math.max(maxStitches, _pattern[i].length);
      }
      
      // Center the stitches.
      for (int i = 0; i < numRows; i++) {
        var padding = maxStitches - _pattern[i].length;
        if (padding > 0) {
          var leftPad = padding ~/ 2;
          var rightPad = padding - leftPad;
          var leftFill = new List<String>.filled(leftPad, 'k');
          var rightFill = new List<String>.filled(rightPad, 'k');
          _pattern[i].insertAll(1, leftFill);
          _pattern[i].addAll(rightFill);
        }
      }
    } else {
      _pattern = [['Dart',
                   'p','p','p','k','p','k','p', // D
                   'k','k','k',
                   'p','k','p','p','p',         // A
                   'k','k','k',
                   'p','k','p','p','p','k','p', // R
                   'k','k','k',
                   'p','p','p']];               // T
    }
  }
  
  /**
   * Takes a Morse code string—for example,
   * `'-.. .- .-. -'`—and converts it into a list of knit ('k')
   * and purl ('p') stitches.
   */
  static List<String> convertMorseRowToStitches(String stitches) {
    var row = new List<String>();
    const DASH = const['p', 'p', 'p'];
    const DOT = const['p'];
    const SPACE = const['k'];
        
    for (int i = 0; i < stitches.length; i++) {
      if (i != 0) {
        row.add('k');
      }
      
      for (int j = 0; j < stitches[i].length; j++) { 
        if (j != 0) {
          row.add('k');
        }
        switch(stitches[i][j]) {
          case '-': 
            row.addAll(DASH);
            break;
          case '.': 
            row.addAll(DOT);
            break;
          case ' ':
            row.addAll(SPACE);
            break;
          default:
            print('Unknown Morse code character: ${stitches[i][j]}');
        }
      }
    }
      
    return row;
  }

//  static List<String> convertMorseToSB(String stitches) {
//    var sb = new StringBuffer();
//    const DASH = 'ppp';
//    const DOT = 'p';
//    const SPACE = 'kkk';
//    String delimiter = '';
//    
//    for (var i = 0; i < stitches.length; i++) {
//      switch(stitches[i]) {
//        case '-': 
//          sb.write(delimiter);
//          sb.write(DASH);
//          delimiter = 'k';
//          break;
//        case '.': 
//          sb.write(delimiter);
//          sb.write(DOT);
//          delimiter = 'k';
//          break;
//        case ' ':
//          sb.write(SPACE);
//          delimiter = '';
//          break;
//        default:
//          print('Unknown Morse code character: ${stitches[i]}');
//      }
//    }
//      
//    return sb.toString().split('');
//  }
}

main() { // TODO: make this a real test  
  var pattern = new MorseCodePattern(['-', '.', '... ---']);
  print(pattern);
  
  var morseWord1 = convertAsciiWordToMorseString('fudge');
  var morseWord2 = convertAsciiWordToMorseString('cancan');
  pattern = new MorseCodePattern([morseWord1, morseWord2]);
  print('$morseWord1\n$morseWord2:');
  print(pattern);
}