App.RoundsRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('user', 'current').then(function(model) {
      return model.get('scorecards');
    });
  },

  afterModel: function(scorecards) {
    return Promise.all(scorecards.map(function(s) { return s.get('round'); }));
  }
});
