App.TurnsRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('turn', {
      round_id: params.round_id, hole_number: params.hole_number
    });
  }
});
