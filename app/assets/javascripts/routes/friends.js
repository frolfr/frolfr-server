App.FriendsRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('friend');
  }
});
