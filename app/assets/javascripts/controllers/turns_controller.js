App.TurnsController = Ember.ArrayController.extend({
  holeNumber: function() {
    return this.get('model.firstObject.holeNumber');
  }.property('model.firstObject.holeNumber'),

  isFirstHole: function() {
    return this.get('holeNumber') === "1";
  }.property('holeNumber'),

  isLastHole: function() {
    return this.get('holeNumber') === "18";
    // This should be more intelligent
  }.property('holeNumber'),

  actions: {
    previousHole: function() {
      var hole = parseInt(this.get('holeNumber')) - 1,
          route = '/rounds/' + 56 + '/holes/' + hole;

      this.transitionToRoute(route);
    },

    nextHole: function() {
      var hole = parseInt(this.get('holeNumber')) + 1,
          route = '/rounds/' + 56 + '/holes/' + hole;

      this.transitionToRoute(route);
    }
  }
})
