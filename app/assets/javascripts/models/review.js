App.Review = DS.Model.extend({
  rating: DS.attr('number'),
  post: DS.attr('string'),
  course: DS.belongsTo('course', { async: true }),
  user: DS.belongsTo('user', { async: true }),
  createdAt: DS.attr('date'),

  userFullName: Ember.computed.alias('user.fullName')
});
