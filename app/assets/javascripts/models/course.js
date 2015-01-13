App.Course = DS.Model.extend({
    city: DS.attr('string'),
    state: DS.attr('string'),
    country: DS.attr('string'),
    name: DS.attr('string'),
    status: DS.attr('string'),
    location: DS.attr('string'),
    roundsPlayed: DS.attr('number'),
    imageUrl: DS.attr('string'),
    scorecards: DS.hasMany('scorecard', { async: true }),
    holes: DS.hasMany('hole', { async: true }),
    holeCount: DS.attr('number'),

    isApproved: function() {
        return this.get('status') === 'approved';
    }.property('status'),

    hasImage: function() {
        return !Ember.isEmpty(this.get('imageUrl'));
    }.property('imageUrl'),

    imageUploadPath: function() {
      return "/api/courses/" + this.get('id') + "/course_images";
    }.property('id')
});

App.AvailableCourse = App.Course.extend();
