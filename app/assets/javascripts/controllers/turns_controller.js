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

  holePar: function() {
    return this.get('model.firstObject.par');
  }.property('model.firstObject.par'),

  isPar3: function() { return this.get('holePar') == 3; }.property('holePar'),
  isPar4: function() { return this.get('holePar') == 4; }.property('holePar'),
  isPar5: function() { return this.get('holePar') == 5; }.property('holePar'),

  actions: {
    previousHole: function() {
      var holeNumber = parseInt(this.get('holeNumber')) - 1,
          roundId = this.get('roundId');

      this.transitionToRoute('turns', roundId, holeNumber);
    },

    nextHole: function() {
      var holeNumber = parseInt(this.get('holeNumber')) + 1,
          roundId = this.get('roundId'),
          _this = this;

      this.send('saveAll');

      if (this.get('isLastHole')) {
        _this.transitionToRoute('round', roundId);
      } else {
        _this.transitionToRoute('turns', roundId, holeNumber);
      };
    },

    addOne: function(turn) {
      var score = parseInt(turn.get('score'));

      turn.set('score', Math.min(8, score + 1));
    },

    subtractOne: function(turn) {
      var score = parseInt(turn.get('score'));

      turn.set('score', Math.max(1, score - 1));
    },

    changePar: function(par) {
      var changedPar = parseInt(par);

      this.get('model').forEach(function(turn) {
        turn.set('par', changedPar);
      });
    },

    // Private
    saveAll: function() {
      this.get('model').forEach(function(turn) {
        if (turn.get('isDirty')) {
          turn.save();
        };
      });
    }
  }
});
