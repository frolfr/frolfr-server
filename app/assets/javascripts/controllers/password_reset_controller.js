App.PasswordResetController = Ember.Controller.extend({
  showResetSuccess: false,
  showResetFailure: false,

  actions: {
    reset: function() {
      var _this = this;
      var resetAttempt = this.store.createRecord('passwordReset', {
        email: this.get('email')
      });
      var onSuccess = function() {
        _this.set('showResetSuccess', true);
        _this.set('showResetFailure', false);
      };
      var onFailure = function() {
        _this.set('showResetSuccess', false);
        _this.set('showResetFailure', true);
      };


      resetAttempt.save().then(onSuccess, onFailure);
    }
  }
});
