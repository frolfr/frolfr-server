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
      var holeNumber = parseInt(this.get('holeNumber')) - 1.
          roundId = this.get('roundId');

      this.transitionToRoute('turns', roundId, holeNumber);
    },

    nextHole: function() {
      var holeNumber = parseInt(this.get('holeNumber')) + 1.
          roundId = this.get('roundId');

      this.transitionToRoute('turns', roundId, holeNumber);
    }
  }
})
