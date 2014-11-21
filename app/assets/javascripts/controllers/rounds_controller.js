App.RoundsController = Ember.ArrayController.extend({
  sortProperties: ['createdAt'],
  sortAscending: false,

  actions: {
    sortBy: function(property) {
      isAscending = !this.get('sortAscending');

      this.set('sortProperties', [property]);
      this.set('sortAscending', isAscending);
    }
  }
});
