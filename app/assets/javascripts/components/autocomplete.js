App.AutoCompleteComponent = Ember.TextField.extend({
  // This component won't work without a `source`.
  // Sources need to implement three methods:
  // - processQuery(query, callback)
  //    This should retrieve a list of suggestions based on
  //    `query`, then invoke `callback` on the list.
  //
  // - formatSuggestion(suggestion)
  //    This should return a displayable string for the given
  //    suggestion.
  //
  // - setSuggestion(suggestion)
  //    This is invoked when a suggestion is selected.

  didInsertElement: function() {
    this._super();
    var $input = this.$();
    var _this = this;
    $input.typeahead(null, {
      displayKey: this.get('source').formatSuggestion,
      source: function(query, callback) {
        _this.get('source').processQuery(query, callback);
      }
    });

    var onComplete = function(event, suggestion) {
      _this.get('source').setSuggestion(suggestion);
    };

    $input.on('typeahead:autocompleted', onComplete);
    $input.on('typeahead:selected', onComplete);
    $input.on('keypress', function() {
      _this.get('source').setSuggestion(null);
    });
    //
  }
});
