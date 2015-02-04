App.CourseStatLogRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('courseStatLog', this.modelFor('course').id);
  }
});
