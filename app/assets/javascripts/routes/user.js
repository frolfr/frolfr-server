App.UserRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('user', params.id);
  }
});
