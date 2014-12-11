App.LeaderboardController = Ember.ArrayController.extend({
  sortProperties: ['createdAt'],
  sortAscending: false,
  filtered: function() {
    return this.get('content').slice(0,9);
  }.property('content')
})
