App.FriendableUsersController = Ember.ArrayController.extend({
  query: "",
  user: null,

  results: function() {
    var query = this.get('query').toLowerCase();
    return this.filter(function(user) {
      return query !== "" && user.get('fullName').toLowerCase().indexOf(query) != -1;
    });
  }.property('query', 'model'),

  hasNoUser: function() {
    return Ember.isEmpty(this.get('user.id'));
  }.property('user'),

  clearStaleUser: function() {
    if (this.get('hasNoUser')) {
      return;
    }  else if (this.get('query') !== this.formatSuggestion(this.get('user'))) {
      this.set('user', null);
    }
  }.observes("query", "user"),

  actions: {
    updateFriendField: function(user) {
      this.set('user', user);
    },

    addFriend: function() {
      console.log("NOT IMPLEMENTED!!!");
      console.log("you're gonna be friends with ", this.get('user.fullName'));
      this.set('user', null);
      this.set('query', "");
    }
  },

  // stuff for AutoCompleteComponent

  formatSuggestion: function(user) {
    return user.get('fullName');
  },

});
