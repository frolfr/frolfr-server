App.Round = DS.Model.extend({
  courseName: DS.attr('string'),
  createdAt: DS.attr('date'),
  scorecards: DS.hasMany('scorecard', {async: true}),
  course: DS.belongsTo('course', {async: true}),
  holeCount: DS.attr('string'),
  publicRecap: DS.attr('boolean'),

  // only used for creating new rounds
  players: DS.hasMany('user', {async: true}),
});

App.JointRound = App.Round.extend();

App.PublicRound = App.Round.extend();
