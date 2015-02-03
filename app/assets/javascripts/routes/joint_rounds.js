App.JointRoundsRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('jointRound', { user_id: this.modelFor('user').id });
  }
});
