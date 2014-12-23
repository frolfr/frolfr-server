App.CoursesRoute = App.AuthenticatedRoute.extend({
    model: function() {
      return this.store.find('course');
    }
});
