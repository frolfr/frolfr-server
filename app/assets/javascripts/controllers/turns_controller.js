App.TurnsController = Ember.ArrayController.extend({
  holeNumber: Ember.computed.alias('model.firstObject.holeNumber'),

  holePar: Ember.computed.alias('model.firstObject.par'),

  isFirstHole: function() {
    return this.get('holeNumber') === "1";
  }.property('holeNumber'),

  isLastHole: function() {
    return this.get('holeNumber') === this.get('holeCount');
  }.property('holeNumber', 'finalHoleNumber'),

  isPar3: function() { return this.get('holePar') == 3; }.property('holePar'),
  isPar4: function() { return this.get('holePar') == 4; }.property('holePar'),
  isPar5: function() { return this.get('holePar') == 5; }.property('holePar'),

  actions: {
    previousHole: function() {
      var holeNumber = parseInt(this.get('holeNumber')) - 1,
          roundId = this.get('roundId');

      this.send('saveAll');

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
      var score = parseInt(turn.get('score') || 0),
          maximumTurnScore = 8;

      turn.set('score', Math.min(maximumTurnScore, score + 1));
    },

    subtractOne: function(turn) {
      var score = parseInt(turn.get('score') || 0),
          minimumTurnScore = 1,
          newScore = score - 1;

      if (newScore < minimumTurnScore) {
        turn.set('score', null);
      } else {
        turn.set('score', newScore);
      }
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
