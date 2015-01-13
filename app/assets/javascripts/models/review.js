App.Review = DS.Model.extend({
  rating: DS.attr('number'),
  post: DS.attr('string'),
  course: DS.belongsTo('course'),
  user: DS.belongsTo('user'),
  createdAt: DS.attr('date')
});
