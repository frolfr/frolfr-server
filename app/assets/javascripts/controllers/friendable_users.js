App.FriendableUsersController = Ember.ArrayController.extend({
  selection: null,
  query: null,

  noUserSelected: function() {
    return Ember.isEmpty(this.get('selection'));
  }.property('selection'),

  actions: {
    addFriend: function() {
      var _this = this;

      var newFriend = this.store.createRecord('friend',
        this.get("selection").toJSON({includeId: true})
      );

      newFriend.save().then(function(savedFriend) {
        // This user is now our friend, so remove them from the list of friendable users
        var selectedUser = _this.store.find('friendableUser', _this.get('selection.id'));
        selectedUser.then(function(selectedUser) {
          selectedUser.deleteRecord();
        });

        // Clear out the form
        _this.set('selection', null);
        _this.set('query', null);
      });

    }
  }
});
