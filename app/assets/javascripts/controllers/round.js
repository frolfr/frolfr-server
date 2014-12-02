App.RoundController = Ember.ObjectController.extend({

  columnWidth: function() {
    var scorecardColumns = this.get('scorecards.length');
    var scorecardColumnPercentage = 100 / scorecardColumns;

    return "width: " + scorecardColumnPercentage + "%;";
  }.property('scorecards.length')

});
