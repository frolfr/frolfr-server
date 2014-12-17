App.UserRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('user', params.id)
  },

  setupController: function(controller, model) {
    this._super(controller, model);
    controller.set('jointRounds', this.store.find('jointRound', { user_id: model.id }));
  }
});
