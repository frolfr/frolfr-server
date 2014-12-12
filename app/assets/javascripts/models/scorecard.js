App.Scorecard = DS.Model.extend({
  round: DS.belongsTo('round', { async: true }),
  courseName: DS.attr('string'),
  courseId: DS.attr('number'),
  createdAt: DS.attr('date'),
  user: DS.belongsTo('user', { async: true }),
  userInitials: DS.attr('string'),
  turns: DS.hasMany('turn', { async: true }),

  userFullName: Ember.computed.alias('user.fullName'),

  totalScore: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('score');
    }, 0);
  }.property('turns.@each.score'),

  totalPar: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('par');
    }, 0);
  }.property('turns.@each.par'),

  totalShooting: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('shooting');
    }, 0);
  }.property('turns.@each.shooting'),

  formattedTotals: function () {
    var totalScore = this.get('totalScore'),
        formattedShooting = this.get('formattedShooting');

    return totalScore + ' (' + formattedShooting + ')';
  }.property('totalScore', 'formattedShooting'),

  formattedShooting: function () {
    var totalScore = this.get('totalScore'),
        totalPar   = this.get('totalPar'),
        totalShooting = this.get('totalShooting'),
        sign = '';

    if (totalPar < totalScore) {
      sign = "+";
    } else if (totalShooting === 0) {
      totalShooting = "Even";
    }

    return sign + totalShooting;
  }.property('totalScore', 'totalPar', 'totalShooting')
});
