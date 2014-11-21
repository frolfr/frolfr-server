App.RoundsController = Ember.ArrayController.extend({
  sortProperties: ['createdAt'],
  sortAscending: false,

  currentSortProperty: function() {
    return this.get('sortProperties').get('0');
  }.property('sortProperties'),

  sortCourseName: function() {
    if (this.get('currentSortProperty') === 'courseName') {
      return this.get('sortDirection');
    } else {
      return '';
    }
  }.property('currentSortProperty', 'sortDirection'),

  sortCreatedAt: function() {
    if (this.get('currentSortProperty') === 'createdAt') {
      return this.get('sortDirection');
    } else {
      return '';
    }
  }.property('currentSortProperty', 'sortDirection'),

  sortTotalScore: function() {
    if (this.get('currentSortProperty') === 'totalScore') {
      return this.get('sortDirection');
    } else {
      return '';
    }
  }.property('currentSortProperty', 'sortDirection'),

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
