App.Round = DS.Model.extend({
  courseName: DS.attr('string'),
  createdAt: DS.attr('date'),
  markedComplete: DS.attr('boolean'),
  scorecards: DS.hasMany('scorecard', {async: true}),
  course: DS.belongsTo('course', {async: true}),
  holeCount: DS.attr('string'),

  // only used for creating new rounds
  players: DS.hasMany('user', {async: true}),
});

App.JointRound = App.Round.extend();
