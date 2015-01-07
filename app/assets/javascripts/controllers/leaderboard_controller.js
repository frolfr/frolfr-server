App.LeaderboardController = Ember.ArrayController.extend({
  sortProperties: ['totalShooting'],
  sortAscending: true,

  filtered: function() {
    var playedScorecards = this.get('arrangedContent').filter(function(scorecard) {
      return scorecard.get('isAllTurnsPlayed');
    });
    var uniqueScorecards = [];

    playedScorecards.forEach(function(scorecard) {
      var currentIds = uniqueScorecards.map(function(scorecard){ return scorecard.get('user.id')});
      if (!currentIds.contains(scorecard.get('user.id'))) {
        uniqueScorecards.addObject(scorecard);
      }
    });

    return uniqueScorecards.slice(0,10);
  }.property('arrangedContent.@each.isAllTurnsPlayed')
})
