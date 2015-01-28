App.AutoCompleteComponent = Ember.TextField.extend({
  selection: null,
  model: null,
  displayKey: null,
  classNames: ['form-control'],

  didInsertElement: function() {
    this._super();
    var $input = this.$();
    var _this = this;

    $input.typeahead({
      highlight: true,
      hint: false
    }, {
      displayKey: function(suggestion) { return _this.format(suggestion); }, // JAVASCRIPT!!!!!
      source: function(query, callback) {
        if (query === '') {
          return [];
        }

        var lowerQuery = query.toLowerCase();

        callback(_this.get('model').filter(function(item) {
          return _this.format(item).toLowerCase().indexOf(lowerQuery) != -1;
        }));
      }
    });

    $input.on('typeahead:selected', function(event, suggestion) {
      _this.set('selection', suggestion);
    });

    $input.on('keydown', function() { _this.clearStaleSelection(); });
  },

  format: function(suggestion) {
    return suggestion.get(this.get('displayKey'));
  },

  clearStaleSelection: function() {
    if (Ember.isEmpty(this.get('selection'))) {
      return;
    }

    if (this.get('value') !== this.format(this.get('selection'))) {
      this.set('selection', null);
    }
  }

});
