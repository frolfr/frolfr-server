App.Turn = DS.Model.extend({
  score: DS.attr('number'),
  par: DS.attr('number'),
  holeNumber: DS.attr('string'),
  scorecard: DS.belongsTo('scorecard'),

  parStatus: function () {
    var parScore = this.get('parScore');
    if (parScore < 0) {
      return 'belowPar';
    } else if (parScore === 0) {
      return 'atPar';
    } else if (parScore > 0) {
      return 'abovePar';
    }
  }.property('parScore'),

  parScore: function () {
    return this.get('score') - this.get('par');
  }.property('score', 'par')

});
