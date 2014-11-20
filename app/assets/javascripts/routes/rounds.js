App.RoundsRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('user', 'current').then(function(model) {
      return model.get('scorecards');
    });
  }
});
