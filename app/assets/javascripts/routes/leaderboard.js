App.LeaderboardRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.modelFor('course').get('scorecards');
  }
});
