App.TurnsRoute = App.AuthenticatedRoute.extend({
  setupController: function(controller, model) {
    this._super(controller, model);

    var round = this.modelFor('round'),
        roundId = round.id,
        holeCount = round.get('holeCount');

    controller.setProperties({
      roundId: roundId,
      holeCount: holeCount
    });
  },

  model: function(params) {
    var holeNumber = params.hole_number,
        roundId = this.modelFor('round').id;

    return this.store.find('turn', {
      round_id: roundId, hole_number: holeNumber
    });
  }
});
