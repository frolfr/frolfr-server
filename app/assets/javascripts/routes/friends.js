App.FriendsRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('friend');
  },

  setupController: function(controller, model) {
    this._super();
    this.controllerFor('friendableUsers').set('model', this.store.find('friendableUser'));
  }
});
