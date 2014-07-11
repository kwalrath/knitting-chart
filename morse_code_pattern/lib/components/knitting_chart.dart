library pattern.knitting_chart;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:math' show PI;
import '../pattern.dart';
import '../ascii_to_morse.dart';


/**
 * A Polymer knitting chart element.
 */
@CustomTag('knitting-chart')
class KnittingChart extends PolymerElement {
  static String DART_IN_MORSE_CODE = convertAsciiWordToMorseString('Dart');
  
  int _leftPad = 0;
  int _rightPad = 0;
  @published KnittingPattern pattern;
  @published int get numRows => pattern.numRows;
  @published set stitchesPerRow(int numStitches) {
    if ((pattern != null) && (stitchesPerRow < numStitches)) {
      _leftPad = (numStitches - stitchesPerRow) ~/ 2;
      _rightPad = numStitches - stitchesPerRow - _leftPad;
    }
  }
  @published int get stitchesPerRow {
    return pattern.numStitches - 1;  //XXX: why -1?
  }
  @published num stitchRatio = .8; // column/row ratio = 4:5
  @published String line1; // What's the best way to support multiple lines?
  @published String line2;
  
  num _stitchWidth = 5; // in pixels?
  CanvasElement _canvas;
  
  KnittingChart.created() : super.created() {
    // XXX: If we could add lines to an existing pattern, this code would be simpler.
    if (line1 != null) {
      if (line2 != null) {
        pattern = new MorseCodePattern([convertAsciiWordToMorseString(line1),
                                        convertAsciiWordToMorseString(line2)]);
      } else {
        pattern = new MorseCodePattern([convertAsciiWordToMorseString(line1)]);
      }
    } else {
      pattern = new MorseCodePattern([DART_IN_MORSE_CODE]);
    }
  }
  
  /**
   * Calculates the cell size and draws the chart.
   */
  @override attached() {
    super.attached();

    _canvas = $['chart'];

    var context = _canvas.context2D;
    var width = _canvas.width;
    var height = _canvas.height;
    int stitchHeight, stitchWidth;

    var maxStitchWidth = ((width-1)/stitchesPerRow).floor();
    var maxStitchHeight = ((height-1)/numRows).floor();

    if (maxStitchHeight/maxStitchWidth < stitchRatio) {
      // The space is wider than we need.
      stitchWidth = (maxStitchHeight / stitchRatio).floor();
      stitchHeight = maxStitchHeight;
    } else {
      // The space might be taller than we need.
      stitchWidth = maxStitchWidth.floor();
      stitchHeight = (maxStitchWidth * stitchRatio).floor();
    }
    width = stitchWidth * stitchesPerRow + 1;
    height = stitchHeight * numRows + 1;
    
    // Call other methods to do the actual drawing.
    drawGrid(context, stitchWidth, stitchHeight, width, height);
    drawPurls(context, stitchWidth, stitchHeight);
  }
  
  /**
   * Draws purl stitches as circles centered where grid cells are expected to be.
   * Also draws the label (currently a noop).
   */
  drawPurls(CanvasRenderingContext2D context, num stitchWidth, num stitchHeight) {
    var x, centerX;
    var y = 0.5;
    var centerY =  0.5 + stitchHeight / 2;
    var radius = 0.5 * stitchHeight - 2;
    
    for (var row = pattern.nextRow(); row != null; row = pattern.nextRow()) {      
      drawLabel(row[0]);
      for (var i = 1; i < row.length; i++) {
        if (row[i] == 'p') {
          x = ((i - 1) * stitchWidth) + 0.5;
          centerX = (x + x + stitchWidth) / 2;
          
          context
            ..beginPath()
            ..arc(centerX,  centerY, radius, 0, 2 * PI)
            ..fillStyle = '#666666'
            ..fill();

//          print('$i: *');
        }
      }
      centerY += stitchHeight;
    }
  }

  drawLabel(label) {
//    print("Label: $label");
  }
  
  /**
   * Draws a grid with cells of the specified stitch width and height,
   * and a total size of width and height.
   */
  drawGrid(context, stitchWidth, stitchHeight, width, height) {
    var x, y;

    context.strokeStyle = "#999999";

    for (var i = 0; i <= stitchesPerRow; i++) {
      x = (i * stitchWidth) + 0.5;
      context.moveTo(x, 0.5);
      context.lineTo(x, height);
    }
  
    for (var i = 0; i <= numRows; i++) {
      y = (i * stitchHeight) + 0.5;
      context.moveTo(0.5, y);
      context.lineTo(width, y);
    }

    context.stroke();
  }
}

