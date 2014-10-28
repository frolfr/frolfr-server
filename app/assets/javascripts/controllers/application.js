App.ApplicationController = Ember.Controller.extend({
    needs: ['currentUser'],
    currentUser: Ember.computed.alias('controllers.currentUser')
});
