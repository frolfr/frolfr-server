App.SessionsController = Ember.Controller.extend({
  init: function() {
    this._super();
    if (Ember.$.cookie('token') && Ember.$.cookie('currentUser')) {
      this.setupAuthHeader(Ember.$.cookie('token'), Ember.$.cookie('currentUser').email);
    }
  },

  attemptedTransition: null,
  token: Ember.$.cookie('token'),
  currentUser: Ember.$.cookie('currentUser'),

  reset: function() {
    this.setProperties({
      currentUser: null,
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
      Ember.$.removeCookie('currentUser');
    } else {
      Ember.$.cookie('token', this.get('token'));
      Ember.$.cookie('currentUser', this.get('currentUser'));
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
          authToken: response.token
        });
        key.save();

        _this.store.find('user', response.user_id).then(function(user) {

          // set this controller token & current user properties
          // based on the data from the user and access_token
          _this.setProperties({
            token:       response.token,
            currentUser: user.getProperties("id", "email", "firstName", "lastName", "middleName")
          });

          // set the relationship between the User and the ApiKey models & save the apiKey object
          key.set('user', user);
          key.save();

          user.get('apiKeys').content.push(key);

          // check if there is any attemptedTransition to retry it or go to the secret route
          if (attemptedTransition) {
            attemptedTransition.retry();
            _this.set('attemptedTransition', null);
          } else {
            _this.transitionToRoute('courses');
          }

        });





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
});
