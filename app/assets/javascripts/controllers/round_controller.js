App.RoundController = Ember.ObjectController.extend({
  publicRoundUrl: function () {
    return 'http://frolfr.com/public/rounds/' + this.get('model.id');
  }.property(),

  actions: {
    makePrivate: function() {
      this.get('model').set('publicRecap', false);
      this.get('model').save();
    },

    publish: function() {
      this.get('model').set('publicRecap', true);
      this.get('model').save();
    }
  }
});
