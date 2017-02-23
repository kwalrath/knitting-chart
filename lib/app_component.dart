// Copyright (c) 2017, kathyw. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:KnittingChart/hello_dialog/hello_dialog.dart';
import 'package:KnittingChart/knitting_chart/knitting_chart.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, KnittingChart, HelloDialog],
  providers: const [materialProviders],
)
class AppComponent {
  // Nothing here yet.
}
