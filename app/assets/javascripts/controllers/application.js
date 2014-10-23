App.ApplicationController = Ember.Controller.extend({
  needs: ['sessions'],

  isAuthenticated: function() {
    return !Ember.isEmpty(this.get('controllers.sessions.token'));
  }.property('controllers.sessions.token')
});
