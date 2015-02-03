App.RoundsIndexController = Ember.ArrayController.extend({
  sortProperties: ['createdAt'],
  sortAscending: false,

  page: 1,
  perPage: 10,

  pagedContent: function() {
    var start = (this.get('page') - 1) * this.get('perPage');
    var end = this.get('page') * this.get('perPage');

    return this.get('arrangedContent').slice(start, end);
  }.property('arrangedContent.@each', 'page', 'perPage'),

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
      return 'fa fa-arrow-up';
    } else {
      return 'fa fa-arrow-down';
    }
  }.property('sortAscending'),

  isFirstPage: function() {
    return this.get('page') == 1;
  }.property('page'),

  totalPages: function() {
    return Math.ceil(this.get('arrangedContent').length / this.get('perPage'));
  }.property('page', 'perPage', 'arrangedContent.length'),

  isLastPage: function() {
    return this.get('page') == this.get('totalPages');
  }.property('page', 'totalPages'),

  actions: {
    sortBy: function(property) {
      var isAscending = !this.get('sortAscending');

      this.set('sortProperties', [property]);
      this.set('sortAscending', isAscending);
      this.set('page', 1);
    },

    nextPage: function() {
      this.incrementProperty('page');
    },

    previousPage: function() {
      this.decrementProperty('page');
    },

    deleteRound: function(round) {
      if (window.confirm('Are you sure you want to delete this round?')) {
        round.then(function(round) {
          round.get('scorecards').map(function(scorecard) {
            scorecard.deleteRecord();
          });
          round.destroyRecord();
        });
      }
    }
  }
});
