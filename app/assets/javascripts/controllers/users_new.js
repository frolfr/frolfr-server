App.UsersNewController = Ember.Controller.extend({
  actions: {
    createUser: function() {
      var self = this;
      var fields = this.get('fields');

      if (App.User.validPassword(fields)) {
        var user = this.store.createRecord('user', fields);

        user.save().then(function(user) {
          var email = user.get('email');
          var password = self.get('fields').password;

          Ember.$.post('/api/authorizations', {
            email: email,
            password: password
          }).then(function(response) {
            // Use setupCurrentUser... (the next line will be removed eventually)
            self.transitionToRoute('sessions.login')
          });
        });
      } else {
        this.set('showPasswordError', true)
      }
    }
  }
});
