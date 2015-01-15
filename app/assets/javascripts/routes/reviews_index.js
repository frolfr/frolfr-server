App.ReviewsIndexRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.modelFor('course').get('reviews').filter(function(review) {
      return !review.get('isDirty');
    });
  }
});
