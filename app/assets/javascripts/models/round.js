App.Round = DS.Model.extend({
  courseName: DS.attr('string'),
  createdAt: DS.attr('date'),
  markedComplete: DS.attr('boolean'),
  courseId: DS.attr('number'),
  scorecards: DS.hasMany('scorecard', {async: true}),
  course: DS.belongsTo('course', {async: true}),
  holes: DS.hasMany('hole', {async: true})

});
