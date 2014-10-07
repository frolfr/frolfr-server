App.Round = DS.Model.extend({
  courseName: DS.attr('string'),
  createdAt: DS.attr('date'),
  markedComplete: DS.attr('boolean'),
  scorecards: DS.hasMany('scorecard', {async: true})
});
