App.Scorecard = DS.Model.extend({
  round: DS.belongsTo('round', { async: true }),
  courseName: DS.attr('string'),
  courseId: DS.attr('number'),
  createdAt: DS.attr('date'),
  user: DS.belongsTo('user', { async: true }),
  userInitials: DS.attr('string'),
  turns: DS.hasMany('turn', { async: true }),

  userFullName: function() {
    return this.get('user').get('fullName');
  }.property('user.fullName'),

  totalScore: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('score');
    }, 0);
  }.property('turns.@each.score'),

  totalPar: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('par');
    }, 0);
  }.property('turns.@each.score'),

  totalShooting: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('parScore');
    }, 0);
  }.property('turns.@each.score'),

  formattedTotals: function () {
    var totalScore = this.get('totalScore');
    var totalPar   = this.get('totalPar');
    var totalShooting = this.get('totalShooting');
    var sign = '';

    if (totalPar < totalScore) {
      sign = "+";
    } else if (totalShooting === 0) {
      totalShooting = "Even";
    }

    return totalScore + " (" + sign + totalShooting + ")";
  }.property('totalScore', 'totalPar', 'totalShooting')
});
