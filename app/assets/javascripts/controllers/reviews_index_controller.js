App.ReviewsIndexController = Ember.ArrayController.extend({
  needs: ['currentUser'],
  currentUser: Ember.computed.alias('controllers.currentUser'),

  sortProperties: ['createdAt'],
  sortAscending: false,

  isAlreadyReviewed: function () {
    var currentUserId = this.get('currentUser.id'),
        currentUserReview = this.get('content').findBy('user.id', currentUserId);

    return !!currentUserReview;
  }.property('content')

});
