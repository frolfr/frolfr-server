App.IndexRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('user', 'current').then(function(user) {
      var scorecards = user.get('scorecards');
      return scorecards.get('firstObject');
    });
  }
});
