App.ReviewsIndexController = Ember.ArrayController.extend({
  needs: ['currentUser'],
  currentUser: Ember.computed.alias('controllers.currentUser'),

  sortProperties: ['createdAt'],
  sortAscending: false,

  filteredReviews: function() {
    return this.get('arrangedContent').filter(function(review) {
      return !review.get('isDirty');
    });
  }.property('arrangedContent.@each.isDirty'),

  isAlreadyReviewed: function () {
    var currentUserId = this.get('currentUser.id'),
        currentUserReview = this.get('content').findBy('user.id', currentUserId);

    return !!currentUserReview;
  }.property('content'),

  averageRating: function() {
    var sumOfRatings = this.get('filteredReviews').reduce(function (total, review) {
          return total + review.get('rating');
        }, 0),
        reviewsCount = this.get('filteredReviews').length

    return sumOfRatings / reviewsCount;
  }.property('filteredReviews.@each.rating'),

  averageRatingRoundedToNearestHalf: function() {
    return (Math.round(this.get('averageRating') * 2) / 2).toFixed(1);
  }.property('averageRating')
});
