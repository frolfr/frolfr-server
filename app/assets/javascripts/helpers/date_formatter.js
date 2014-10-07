Ember.Handlebars.helper('displayDate', function(value) {
  return moment().format('dddd, MMM Do YYYY');
});
