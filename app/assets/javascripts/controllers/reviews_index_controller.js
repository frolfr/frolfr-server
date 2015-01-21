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
  }.property('content')

});
