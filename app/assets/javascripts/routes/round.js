App.RoundRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('round', params.id)
  }
});
