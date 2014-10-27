App.IndexRoute = App.AuthenticatedRoute.extend({
  redirect: function() {
    this.transitionTo('courses');
  }
});
