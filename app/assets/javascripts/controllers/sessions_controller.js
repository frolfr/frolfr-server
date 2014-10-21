App.SessionsController = Ember.Controller.extend({
  actions: {
    login: function() {
      var _this = this;

      var attemptedTransition = this.get('attemptedTransition');
      var data = this.getProperties('email', 'password');

      // clear form fields
      this.setProperties({email: null, password: null});

      Ember.$.post('/api/authorizations', data).then(function(response) {
        Ember.$.ajaxSetup({
          headers: {
            'Authorization': 'Token token="' + response.token + '",email="' + data.email + '"'
          }
        });
        console.log(response.token);

        var key = _this.get('store').createRecord('apiKey', {
          authToken: response.token,
          email: data.email
        });
        key.save();

        if (attemptedTransition) {
          attemptedTransition.retry();
          _this.set('attemptedTransition', null);
        } else {
          _this.transitionToRoute('courses');
        }

      }, function(error) {
        if (error.status === 422) {
          alert("BAD PASSWORD");
        }
        console.log(error);
      });
    },

    logout: function() {

    }
  }
});
