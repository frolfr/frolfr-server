App.ProfileController = Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      this.get('model').save();
    }
  }
});
