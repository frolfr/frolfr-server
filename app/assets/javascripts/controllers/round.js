App.RoundsShowController = Ember.ObjectController.extend({

  columnWidth: function () {
    var count = this.get('scorecards.length');
    var width = Math.floor(12 / (count + 1));

    return "large-" + width.toString() + " " +
           "small-" + width.toString();
  }.property('scorecards.length')

});
