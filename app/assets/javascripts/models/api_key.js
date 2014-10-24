App.ApiKey = DS.Model.extend({
  authToken: DS.attr('string'),
  user: DS.belongsTo('user', { async: true })
});
