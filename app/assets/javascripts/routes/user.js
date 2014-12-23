App.UserRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('user', params.id);
  },

  afterModel: function(model, transition) {
    var _this = this;
    return this.store.find('jointRound', { user_id: model.id }).then(function(jointRounds) {
      _this.set('jointRounds', jointRounds);
    });
  },

  setupController: function(controller, model) {
    this._super(controller, model);
    controller.set('jointRounds', this.get('jointRounds'));
  }
});
