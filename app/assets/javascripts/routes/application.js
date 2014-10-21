App.ApplicationRoute = Ember.Route.extend({
  actions: {
    logout: function() {
      this.controllerFor('sessions').reset();
      this.transitionTo('sessions');
    }
  }
});
