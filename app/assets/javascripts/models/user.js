App.User = DS.Model.extend({
    firstName: DS.attr('string'),
    middleName: DS.attr('string'),
    lastName: DS.attr('string'),
    email: DS.attr('string'),
    apiKeys: DS.hasMany('apiKey')
});
