App.PasswordEditRoute = Ember.Route.extend({
  model: function(params) {
    var password = this.store.createRecord('password', {
      passwordResetToken: params.password_reset_token
    });

    this.store.find('passwordReset', params.password_reset_token).then(function(passwordReset){
      password.set('email', passwordReset.get('email'));
    });

    return password;
  }
});
