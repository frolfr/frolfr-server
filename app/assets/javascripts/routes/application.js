App.ApplicationRoute = Ember.Route.extend({
  actions: {
    logout: function() {
      this.controllerFor('sessions').reset();
      App.reset();
    },

    loading: function() {
      var view = Ember.View.create({
        templateName: 'views/spinner',
        elementId: 'spinner'
      }).append();

      this.router.one('didTransition', function() {
        view.destroy();
      });
    }
  }
});
