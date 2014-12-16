App.RoundsNewRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.createRecord('round');
  },

  setupController: function(controller, model) {
    this._super(controller, model);
    controller.set('courses', this.store.find('course'));
    controller.set('friends', this.store.find('friend'));
    controller.set('currentUser', this.store.find('user', 'current'));
  }
});
