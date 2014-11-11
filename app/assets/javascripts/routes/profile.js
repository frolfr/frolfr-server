App.ProfileRoute = App.AuthenticatedRoute.extend({
  model: function() { return this.store.find('user', 'current'); }
});
