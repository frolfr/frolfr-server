App.CourseStatLog = DS.Model.extend({
  totalScorecardsPlayed: DS.attr('number'),
  completedScorecardsPlayed: DS.attr('number'),
  averageScoreOnCompletedScorecards: DS.attr('number'),
  bestScoreOnCompletedScorecards: DS.attr('number')
});
