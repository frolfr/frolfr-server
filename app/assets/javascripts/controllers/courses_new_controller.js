App.CoursesNewController = Ember.ObjectController.extend({
  stateAbbreviations: ["","AK","AL","AR","AZ","CA","CO",
    "CT","DC","DE","FL","GA","GU","HI","IA","ID","IL",
    "IN","KS","KY","LA","MA","MD","ME","MH","MI","MN",
    "MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV",
    "NY","OH","OK","OR","PA","PR","PW","RI","SC","SD",
    "TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"],

  actions: {
    save: function() {
      var _this = this,
          course = this.get('model');

      course.save().then(function() {
        _this.transitionToRoute('index');
        // TODO: It'd be nice to have some sort of notification
      })
    }
  }
});
