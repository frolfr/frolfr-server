App.UserStatLog = DS.Model.extend({
  firstName: DS.attr('string'),
  totalScorecardsPlayed: DS.attr('number'),
  completedScorecardsPlayed: DS.attr('number'),
  coursesPlayed: DS.attr('number'),
  totalRoundsWithUser: DS.attr('number'),
  totalRoundsWon: DS.attr('number'),
  totalRoundsLost: DS.attr('number'),
  totalRoundsTied: DS.attr('number'),
  totalIncompleteRounds: DS.attr('number'),

  hasNeverPlayed: function() {
    return this.get('totalScorecardsPlayed') === 0;
  }.property('totalScorecardsPlayed')
});
