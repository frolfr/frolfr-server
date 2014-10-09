App.Turn = DS.Model.extend({
  score: DS.attr('number'),
  par: DS.attr('number'),
  holeNumber: DS.attr('string'),
  scorecard: DS.belongsTo('scorecard')
});
