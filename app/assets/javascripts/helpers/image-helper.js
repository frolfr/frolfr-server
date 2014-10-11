Ember.Handlebars.helper('imageHelper', function(url) {
  var image = '<img data-interchange="[' + url + ', (small)]"</img>';
  return new Ember.Handlebars.SafeString(image);
});
