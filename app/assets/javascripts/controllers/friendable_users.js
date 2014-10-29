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
      var _this = this;

      var newFriend = this.store.createRecord('friend',
        this.get("selectedUser").toJSON({includeId: true})
      );

      newFriend.save().then(function(savedFriend) {
        // This user is now our friend, so remove them from the list of friendable users
        var selectedUser = _this.store.find('friendableUser', _this.get('selectedUser.id'));
        selectedUser.then(function(selectedUser) {
          selectedUser.deleteRecord();
        });

        // Clear out the form
        _this.set('selectedUser', null);
        _this.set('query', "");
      });

    }
  },

  // stuff for AutoCompleteComponent

  formatSuggestion: function(user) {
    return user.get('fullName');
  },

});
