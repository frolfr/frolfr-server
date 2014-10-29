App.FriendableUsersController = Ember.ArrayController.extend({
  query: "",
  selectedUser: null,

  results: function() {
    var query = this.get('query').toLowerCase();
    return this.filter(function(user) {
      return query !== "" && user.get('fullName').toLowerCase().indexOf(query) != -1;
    });
  }.property('query', 'model'),

  noUserSelected: function() {
    return Ember.isEmpty(this.get('selectedUser.id'));
  }.property('selectedUser'),

  clearStaleUser: function() {
    if (this.get('noUserSelected')) {
      return;
    }  else if (this.get('query') !== this.formatSuggestion(this.get('selectedUser'))) {
      this.set('selectedUser', null);
    }
  }.observes("query", "selectedUser"),

  actions: {
    updateSelectedUser: function(user) {
      this.set('selectedUser', user);
    },

    addFriend: function() {
      console.log("NOT IMPLEMENTED!!!");
      console.log("you're gonna be friends with ", this.get('selectedUser.fullName'));
      this.set('selectedUser', null);
      this.set('query', "");
    }
  },

  // stuff for AutoCompleteComponent

  formatSuggestion: function(user) {
    return user.get('fullName');
  },

});
