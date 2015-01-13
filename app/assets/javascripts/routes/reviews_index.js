App.ReviewsIndexRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.modelFor('course').get('reviews');
  }
});
