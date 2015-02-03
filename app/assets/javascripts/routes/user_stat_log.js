App.UserStatLogRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('userStatLog', this.modelFor('user').id);
  }
});
