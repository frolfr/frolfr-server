App.ReviewsNewController = Ember.ObjectController.extend({

  ratingChoices: [1,2,3,4,5,6,7,8,9,10],

  actions: {
    submitReview: function () {
      var _this = this;
      var review = this.get('content');
      review.save().then(function () {
        _this.transitionToRoute('reviews.index');
      });
    }
  }

});


