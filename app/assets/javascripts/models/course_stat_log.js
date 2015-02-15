App.CourseStatLog = DS.Model.extend({
  totalScorecardsPlayed: DS.attr('number'),
  completedScorecardsPlayed: DS.attr('number'),
  averageScoreOnCompletedScorecards: DS.attr('number'),
  bestScoreOnCompletedScorecards: DS.attr('number'),
  totalBogeys: DS.attr('number'),
  totalPars: DS.attr('number'),
  totalBirdies: DS.attr('number'),
  totalEagles: DS.attr('number'),
  totalDoublesOrWorse: DS.attr('number'),
});
