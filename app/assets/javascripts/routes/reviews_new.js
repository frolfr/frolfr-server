App.ReviewsNewRoute = App.AuthenticatedRoute.extend({

  model: function() {
    return this.store.createRecord('review', {
      course: this.modelFor('course')
    });
  }

});
