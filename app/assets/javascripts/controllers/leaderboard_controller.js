App.LeaderboardController = Ember.ArrayController.extend({
  sortProperties: ['createdAt'],
  sortAscending: false,

  filtered: function() {
    return this.get('content').slice(0,10);
  }.property('content')
})
