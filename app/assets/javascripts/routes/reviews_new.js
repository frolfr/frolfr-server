App.ReviewsNewRoute = App.AuthenticatedRoute.extend({

  model: function() {
    return this.store.createRecord('review');
  },

  actions: {
    submitReview: function (review) {
      console.log(review.get('rating'));
      review.save();
    }
  }
});
