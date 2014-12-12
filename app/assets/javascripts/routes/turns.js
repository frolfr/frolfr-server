App.TurnsRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    var holeNumber = params.hole_number,
        roundId = this.modelFor('round').id;

    return this.store.find('turn', {
      round_id: roundId, hole_number: holeNumber
    });
  }
});
