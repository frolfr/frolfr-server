App.Scorecard = DS.Model.extend({
  round: DS.belongsTo('round', { async: true }),
  courseName: DS.attr('string'),
  courseId: DS.attr('number'),
  createdAt: DS.attr('date'),
  user: DS.belongsTo('user', { async: true }),
  userInitials: DS.attr('string'),
  turns: DS.hasMany('turn', { async: true }),

  userFullName: Ember.computed.alias('user.fullName'),
  hasUserAvatar: Ember.computed.alias('user.hasAvatar'),
  userAvatarUrl: Ember.computed.alias('user.avatarUrl'),

  isStarted: function() {
    return this.get('turns').any(function (turn) {
      return turn.get('isPlayed');
    });
  }.property('turns.@each.isPlayed'),

  isAllTurnsPlayed: function() {
    return this.get('turns').every(function (turn) {
      return turn.get('isPlayed');
    });
  }.property('turns.@each.isPlayed'),

  isFinished: function() {
    return this.get('isMoreThanOneDayOld') || this.get('isAllTurnsPlayed');
  }.property('isMoreThanOneDayOld', 'isAllTurnsPlayed'),

  isMoreThanOneDayOld: function() {
    var today = new Date().getTime(),
        datePlayed = new Date(this.get('createdAt')).getTime(),
        oneDayInMilliseconds = 86400000

    return (today - datePlayed) > oneDayInMilliseconds;
  }.property('createdAt'),

  playedTurns: function() {
    return this.get('turns').filter(function (turn) {
      return turn.get('isPlayed');
    });
  }.property('turns.@each.isPlayed'),

  nextUnplayedTurn: function() {
    return this.get('turns').find(function (turn) {
      return !turn.get('isPlayed');
    });
  }.property('turns.@each.isPlayed'),

  totalScore: function () {
    return this.get('playedTurns').reduce(function (acc, turn) {
      return acc + turn.get('score');
    }, 0);
  }.property('playedTurns.@each.score'),

  totalPar: function () {
    return this.get('playedTurns').reduce(function (acc, turn) {
      return acc + turn.get('par');
    }, 0);
  }.property('playedTurns.@each.par'),

  totalShooting: function () {
    return this.get('totalScore') - this.get('totalPar')
  }.property('totalScore', 'totalPar'),

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
