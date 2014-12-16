App.CoursesNewRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.createRecord('course');
  }
});
