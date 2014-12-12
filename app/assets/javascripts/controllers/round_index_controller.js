App.RoundIndexController = Ember.ObjectController.extend({
  columnWidth: function() {
    var scorecardColumns = this.get('scorecards.length');
    var scorecardColumnPercentage = 100 / scorecardColumns;

    return 'width: ' + scorecardColumnPercentage + '%;';
  }.property('scorecards.length'),

  holeNumbers: function() {
    var turnsCount = this.get('scorecards.firstObject.turns.length');
    var holeNumbers = new Array(turnsCount)
      .join().split(',')
      .map(function(item, index){ return ++index; });

    return holeNumbers;
  }.property('scorecards.firstObject.turns.length')

});
