App.RoundsIndexController = Ember.ArrayController.extend({
  sortProperties: ['createdAt'],
  sortAscending: false,

  currentSortProperty: function() {
    return this.get('sortProperties').get('0');
  }.property('sortProperties'),

  sortCourseName: function() {
    return this.isSortedBy('courseName');
  }.property('currentSortProperty', 'sortDirection'),

  sortCreatedAt: function() {
    return this.isSortedBy('createdAt');
  }.property('currentSortProperty', 'sortDirection'),

  sortTotalScore: function() {
    return this.isSortedBy('totalScore');
  }.property('currentSortProperty', 'sortDirection'),

  isSortedBy: function(property) {
    if (this.get('currentSortProperty') === property) {
      return this.get('sortDirection');
    } else {
      return '';
    }
  },

  sortDirection: function() {
    if (this.get('sortAscending')) {
      return 'fi fi-arrow-up';
    } else {
      return 'fi fi-arrow-down';
    }
  }.property('sortAscending'),

  actions: {
    sortBy: function(property) {
      var isAscending = !this.get('sortAscending');

      this.set('sortProperties', [property]);
      this.set('sortAscending', isAscending);
    }
  }
});
