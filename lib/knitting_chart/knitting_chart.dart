// Copyright (c) 2017, kathyw. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
  selector: 'knitting-chart',
  styleUrls: const ['knitting_chart.css'],
//  templateUrl: 'hello_dialog.html',
  template: '{{phrase.toUpperCase()}}',
//  directives: const [materialDirectives],
//  providers: const [materialProviders],
)
class KnittingChart {
  /// The phrase to translate to Morse code.
  @Input()
  String phrase = 'FUCK CANCER';
}
