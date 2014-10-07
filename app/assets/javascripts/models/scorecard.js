App.Scorecard = DS.Model.extend({
  round: DS.belongsTo('round'),
  userInitials: DS.attr('string')
});
