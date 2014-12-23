App.AuthenticatedRoute = Ember.Route.extend(App.ResetScroll, {
  beforeModel: function(transition) {
    if (Ember.isEmpty(this.controllerFor('sessions').get('token'))) {
      return this.redirectToLogin(transition);
    }
  },
  redirectToLogin: function(transition) {
    this.controllerFor('sessions').set('attemptedTransition', transition);
    return this.transitionTo('sessions');
  },
  actions: {
    error: function(reason, transition) {
      if (reason.status == 401) {
        this.redirectToLogin(transition);
      } else {
      }
    }
  }
});
