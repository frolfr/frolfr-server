App.Turn = DS.Model.extend({
  score: DS.attr('number'),
  par: DS.attr('number'),
  holeNumber: DS.attr('string'),
  scorecard: DS.belongsTo('scorecard'),

  parStatus: function () {
    var shooting = this.get('shooting'),
        score = this.get('score');

    if (0 < shooting) {
      return 'abovePar';
    } else if (shooting === 0 || score === null) {
      return 'atPar';
    } else if (shooting < 0) {
      return 'belowPar';
    }
  }.property('shooting', 'score'),

  shooting: function () {
    return this.get('score') - this.get('par');
  }.property('score', 'par')
});
