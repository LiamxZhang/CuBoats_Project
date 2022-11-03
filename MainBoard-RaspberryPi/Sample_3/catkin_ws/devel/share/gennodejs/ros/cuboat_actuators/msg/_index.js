
"use strict";

let propeller = require('./propeller.js');
let dock = require('./dock.js');
let servoFeedback = require('./servoFeedback.js');
let servoActionFeedback = require('./servoActionFeedback.js');
let servoGoal = require('./servoGoal.js');
let servoActionResult = require('./servoActionResult.js');
let servoActionGoal = require('./servoActionGoal.js');
let servoAction = require('./servoAction.js');
let servoResult = require('./servoResult.js');

module.exports = {
  propeller: propeller,
  dock: dock,
  servoFeedback: servoFeedback,
  servoActionFeedback: servoActionFeedback,
  servoGoal: servoGoal,
  servoActionResult: servoActionResult,
  servoActionGoal: servoActionGoal,
  servoAction: servoAction,
  servoResult: servoResult,
};
