App.Hole = DS.Model.extend({
  number: DS.attr('number'),
  round: DS.belongsTo('round', { async: true }),
  turns: DS.hasMany('turn', { async: true })
});
