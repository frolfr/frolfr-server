App.Turn = DS.Model.extend({
  score: DS.attr('number'),
  par: DS.attr('number'),
  holeNumber: DS.attr('string'),
  scorecard: DS.belongsTo('scorecard', { async: true }),

  parStatus: function () {
    var shooting = this.get('shooting'),
        score = this.get('score');

    if (0 < shooting) {
      return 'abovePar';
    } else if (shooting === 0 || score === null) {
      return 'atPar';
    } else {
      return 'belowPar';
    }
  }.property('shooting', 'score'),

  shooting: function () {
    return this.get('score') - this.get('par');
  }.property('score', 'par'),

  isPlayed: function() {
    return !Ember.isEmpty(this.get('score'));
    // TODO: Ember 1.7 has isPresent; change on update
  }.property('score'),

  displayScore: function() {
    if (this.get('isPlayed')) {
      return this.get('score');
     } else {
      return '-';
    }
  }.property('isPlayed', 'score')
});
