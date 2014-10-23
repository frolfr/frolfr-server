App.CourseRoute = App.AuthenticatedRoute.extend({
  model: function(params) { return this.store.find('course', params.id); }
});
