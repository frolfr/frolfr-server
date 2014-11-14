App.RoundRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('round', params.id)
  }
});
