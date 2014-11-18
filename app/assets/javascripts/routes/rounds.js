App.RoundsRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('scorecard');
  }
});
