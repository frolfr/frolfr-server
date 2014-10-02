App.CoursesRoute = Ember.Route.extend({
    model: function() { return this.store.find('course'); }
});
