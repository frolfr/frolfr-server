App.Course = DS.Model.extend({
<<<<<<< HEAD
    city: DS.attr('string'),
    state: DS.attr('string'),
    country: DS.attr('string'),
    name: DS.attr('string'),
    status: DS.attr('string'),
    location: DS.attr('string'),
    roundsPlayed: DS.attr('number'),
    imageUrl: DS.attr('string'),
    rounds: DS.hasMany('round', { async: true }),
    holes: DS.hasMany('hole', { async: true })
});
