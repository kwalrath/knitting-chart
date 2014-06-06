// PENDING: put in lib?

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
    return _pattern != null ? _pattern[0].length: 0; //XXX instead take max of all row lengths?
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
  String morseCode;
  // TODO: Test that DART_IN_MORSE_CODE == default _pattern;
  
  MorseCodePattern(this.morseCode) {
    if (morseCode != null) {
      _pattern = [['1'].addAll(convertMorseToStitches(morseCode))];
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
  static List<String> convertMorseToStitches(String stitches) {
    var row = new List<String>();
    const DASH = const['p', 'p', 'p'];
    const DOT = const['p'];
    const SPACE = const['k']; //XXX why does this work?
        
    for (int i = 0; i < stitches.length; i++) {
      if (i != 0) {
        row.add('k');
      }

      switch(stitches[i]) {
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
          print('Unknown Morse code character: ${stitches[i]}');
      }
    }
      
    return row;
  }

  static List<String> convertMorseToSB(String stitches) {
    var sb = new StringBuffer();
    const DASH = 'ppp';
    const DOT = 'p';
    const SPACE = 'kkk';
    String delimiter = '';
    
    for (var i = 0; i < stitches.length; i++) {
      switch(stitches[i]) {
        case '-': 
          sb.write(delimiter);
          sb.write(DASH);
          delimiter = 'k';
          break;
        case '.': 
          sb.write(delimiter);
          sb.write(DOT);
          delimiter = 'k';
          break;
        case ' ':
          sb.write(SPACE);
          delimiter = '';
          break;
        default:
          print('Unknown Morse code character: ${stitches[i]}');
      }
    }
      
    return sb.toString().split('');
  }
}

main() { // TODO: make this a real test
//  var row = MorseCodePattern.convertMorseToStitches('. - -.');
  var row = MorseCodePattern.convertMorseToSB('. - -.');
  print(row);
  //[p, k, k, k, p, p, p, k, k, k, p, p, p, k, p]

//  row = MorseCodePattern.convertMorseToStitches('.- . - -- ..');
  row = MorseCodePattern.convertMorseToSB('.- . - -- ..');
  print(row);
  //[p, k, p, p, p, k, k, k, p, k, k, k, p, p, p, k, k, k, p, p, p, k, p, p, p, k, k, k, p, k, p]
  
  var pattern = new MorseCodePattern('... --- ...');
  print(pattern);
}