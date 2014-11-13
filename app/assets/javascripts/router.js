// For more information see: http://emberjs.com/guides/routing/

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
});

App.Router.map(function() {
  this.resource('sessions', function() {
    this.route('login');
  });
  this.resource('courses');
  this.resource('course', { path: '/courses/:id' });
  this.resource('friends');
  this.resource('profile');
  this.resource('users', function() {
    this.route('new');
  });
  this.resource('turns', { path: '/rounds/:round_id/holes/:hole_number' });
});
