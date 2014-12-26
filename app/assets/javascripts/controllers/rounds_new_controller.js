App.RoundsNewController = Ember.ObjectController.extend({
  selectedPlayer: null,
  query: null,

  potentialPlayers: function() {
    var friends = new Ember.Set(this.get('friends'));
    var players = new Ember.Set(this.get('players'));
    friends.removeObjects(players);

    return friends;
  }.property('friends.@each', 'players.@each'),


  noPlayerSelected: function() {
    return Ember.isEmpty(this.get('selectedPlayer'));
  }.property('selectedPlayer'),

  actions: {
    addPlayer: function() {
      this.get('players').addObject(this.get('selectedPlayer'));
      this.set('selectedPlayer', null);
      this.set('query', null);
    },

    removePlayer: function(player) {
      this.get('players').removeObject(player);
    },

    createRound: function() {
      var _this = this;
      this.get('model').save().then(function(round) {
        _this.transitionToRoute('turns', round, 1);
      });
    }
  }
});
