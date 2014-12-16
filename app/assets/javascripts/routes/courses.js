App.CoursesRoute = App.AuthenticatedRoute.extend({
    model: function() {
      var store = this.store;

      store.find('course');

      return store.filter('course', function(course) {
        return course.get('isApproved');
      });
    }
});
