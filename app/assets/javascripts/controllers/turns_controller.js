App.TurnsController = Ember.ArrayController.extend({
  holeNumber: function() {
    return this.get('model.firstObject.holeNumber');
  }.property('model.firstObject.holeNumber'),

  isFirstHole: function() {
    return this.get('holeNumber') === "1";
  }.property('holeNumber'),

  isLastHole: function() {
    return this.get('holeNumber') === this.get('holeCount');
  }.property('holeNumber', 'finalHoleNumber'),

  actions: {
    previousHole: function() {
      var holeNumber = parseInt(this.get('holeNumber')) - 1,
          roundId = this.get('roundId');

      this.transitionToRoute('turns', roundId, holeNumber);
    },

    nextHole: function() {
      var holeNumber = parseInt(this.get('holeNumber')) + 1,
          roundId = this.get('roundId');

      this.transitionToRoute('turns', roundId, holeNumber);
    },

    addOne: function(turn) {
      var score = parseInt(turn.get('score'));

      turn.set('score', Math.min(8, score + 1));
    },

    subtractOne: function(turn) {
      var score = parseInt(turn.get('score'));

      turn.set('score', Math.max(0, score - 1));
    },

    changePar: function(par) {
      var changedPar = parseInt(par);

      this.get('model').forEach(function(turn) {
        turn.set('par', changedPar);
      });
    }
  }
});
