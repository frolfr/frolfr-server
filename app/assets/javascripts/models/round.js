App.Round = DS.Model.extend({
  courseName: DS.attr('string'),
  createdAt: DS.attr('date'),
  scorecards: DS.hasMany('scorecard', {async: true}),
  course: DS.belongsTo('course', {async: true}),
  holeCount: DS.attr('string'),
  publicRecap: DS.attr('boolean'),

  isStarted: function() {
    return this.get('scorecards').any(function (scorecard) {
      return scorecard.get('isStarted');
    });
  }.property('scorecards.@each.isStarted'),

  // only used for creating new rounds
  players: DS.hasMany('user', {async: true}),
});

App.JointRound = App.Round.extend();

App.PublicRound = App.Round.extend();
