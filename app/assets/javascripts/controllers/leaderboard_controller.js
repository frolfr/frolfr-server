App.LeaderboardController = Ember.ArrayController.extend({
  sortProperties: ['totalShooting'],
  sortAscending: true,

  filtered: function() {
    // TODO: Make sure leaderboard consists of only completely
    // finished scorecards
    return this.get('arrangedContent').slice(0,10);
  }.property('arrangedContent')
})
