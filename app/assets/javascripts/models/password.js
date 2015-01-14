App.Password = DS.Model.extend({
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string'),
  passwordResetToken: DS.attr('string'),
  email: DS.attr('string')
});
