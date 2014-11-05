App.UsersNewRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('fields', {});
    controller.set('showPasswordError', false);
  }
});
