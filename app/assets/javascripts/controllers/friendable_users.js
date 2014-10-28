App.FriendableUsersController = Ember.ArrayController.extend({
  search: "",
  user: null,

  searchResults: function() {
    var search = this.get('search').toLowerCase();
    return this.filter(function(user) {
      return search !== "" && user.get('fullName').toLowerCase().indexOf(search) != -1;
    });
  }.property('search', 'this.@each.fullName'),

  actions: {
    addFriend: function() {
      console.log("NOT IMPLEMENTED!!!");
      console.log("you're gonna be friends with ", this.get('user.fullName'));
    }
  },

  // stuff for AutoCompleteComponent

  processQuery: function(query, callback) {
    this.set('search', query);
    callback(this.get('searchResults'));
  },

  formatSuggestion: function(user) {
    return user.get('fullName');
  },

  setSuggestion: function(suggestion) {
    this.set('user', suggestion);
  }

});
