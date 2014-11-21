App.SessionsController = Ember.Controller.extend({
  needs: ['currentUser'],

  init: function() {
    this._super();
    if (Ember.$.cookie('token') && Ember.$.cookie('email')) {
      this.setupAuthHeader(Ember.$.cookie('token'), Ember.$.cookie('email'));
      this.setupCurrentUser();
    }
  },

  attemptedTransition: null,
  token: Ember.$.cookie('token'),
  email: Ember.$.cookie('email'),

  reset: function() {
    this.setProperties({
      email: null,
      password: null,
      token: null
    });
    Ember.$.ajaxSetup({
      headers: {
        'Authorization': 'Token none'
      }
    });
  },

  tokenChanged: function() {
    if (Ember.isEmpty(this.get('token'))) {
      Ember.$.removeCookie('token');
      Ember.$.removeCookie('email');
    } else {
      var twentyYears = 365 * 20;
      Ember.$.cookie('token', this.get('token'), { expires: twentyYears });
      Ember.$.cookie('email', this.get('email'), { expires: twentyYears });
    }

  }.observes('token'),

  actions: {
    login: function() {
      var _this = this;

      var attemptedTransition = this.get('attemptedTransition');
      var data = this.getProperties('email', 'password');

      // clear form fields
      this.setProperties({email: null, password: null});

      Ember.$.post('/api/authorizations', data).then(function(response) {
        _this.setupAuthHeader(response.token, data.email);

        _this.setProperties({
          token: response.token,
          email: data.email
        });

        _this.setupCurrentUser();

        if (attemptedTransition) {
          attemptedTransition.retry();
          _this.set('attemptedTransition', null);
        } else {
          _this.transitionToRoute('index');
        }

      }, function(error) {
        if (error.status === 422) {
          alert("Invalid password. Please try again.");
        }
      });
    },
    loginWithCredentials: function(email, password) {
      this.set('email', email);
      this.set('password', password);
      this.send('login');
    },
  },

  // private
  setupAuthHeader: function(token, email) {
    Ember.$.ajaxSetup({
      headers: {
        'Authorization': 'Token token="' + token + '",email="' + email + '"'
      }
    });
  },

  setupCurrentUser: function() {
    var _this = this;
    this.store.find('user', 'current').then(function(user) {
      _this.get('controllers.currentUser').set('model', user);
    });
  }
});
