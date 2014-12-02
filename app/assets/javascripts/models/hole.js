App.Hole = DS.Model.extend({
  number: DS.attr('number'),
  turns: DS.hasMany('turn', { async: true })
});
