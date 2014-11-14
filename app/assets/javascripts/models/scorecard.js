App.Scorecard = DS.Model.extend({
  round: DS.belongsTo('round'),
  userInitials: DS.attr('string'),
  turns: DS.hasMany('turn', { async: true }),

  totalScore: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('score');
    }, 0);
  }.property('turns.@each.score'),

  totalPar: function () {
    return this.get('turns').reduce(function (acc, turn) {
      return acc + turn.get('parScore');
    }, 0);
  }.property('turns.@each.score'),

  formattedTotals: function () {
    var score = this.get('totalScore');
    var par   = this.get('totalPar');

    return score + "(" + 
    this.findSign(score, par) +
    par + ")"
  }.property('totalScore', 'totalPar'),

  findSign: function (score, par) {
    if (score < par) {
      return '-'
    } else if (score == par) {
      return null
    } else if (score > par) {
      return '+'
    }
  }

});
