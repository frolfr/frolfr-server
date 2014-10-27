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
    this.resetCurrentUser();
  },

  tokenChanged: function() {
    if (Ember.isEmpty(this.get('token'))) {
      Ember.$.removeCookie('token');
      Ember.$.removeCookie('email');
    } else {
      Ember.$.cookie('token', this.get('token'));
      Ember.$.cookie('email', this.get('email'));
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

        var key = _this.get('store').createRecord('apiKey', {
          authToken: response.token,
          email: data.email
        });
        key.save();

        _this.setProperties({
          token: response.token,
          email: data.email
        });

        _this.setupCurrentUser();

        if (attemptedTransition) {
          attemptedTransition.retry();
          _this.set('attemptedTransition', null);
        } else {
          _this.transitionToRoute('courses');
        }

      }, function(error) {
        if (error.status === 422) {
          alert("Invalid password. Please try again.");
        }
      });
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
    var user = this.store.find('user', 'current');
    this.get('controllers.currentUser').set('model', user);
  },

  resetCurrentUser: function() {
    this.get('controllers.currentUser').set('model', null);
  }
});
