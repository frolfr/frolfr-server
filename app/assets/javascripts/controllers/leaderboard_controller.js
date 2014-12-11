App.LeaderboardController = Ember.ArrayController.extend({
  sortProperties: ['totalPar'],
  sortAscending: false,

  filtered: function() {
    return this.get('content').slice(0,10);
  }.property('content')
})
