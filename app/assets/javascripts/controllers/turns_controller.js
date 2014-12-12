App.TurnsController = Ember.ArrayController.extend({
  holeNumber: function() {
    return this.get('model.firstObject.holeNumber');
  }.property('model.firstObject.holeNumber')
})
