App.AutoCompleteComponent = Ember.TextField.extend({
  // This component won't work without a `source`.
  //
  // Sources need to have two properties:
  //   - query
  //   - results
  // When a user types into the autocomplete field, the component
  // will update the source's `query` property, then ask the source
  // for `results`. It is up to the source to compute results based
  // on the given query.
  //
  // Additionally, the source should implement the following method:
  //   - formatSuggestion(suggestion)
  //     This should return a displayable string for the given
  //     suggestion.
  //
  didInsertElement: function() {
    this._super();
    var $input = this.$();
    var _this = this;
    $input.typeahead({
      highlight: true,
      hint: false
    }, {
      displayKey: this.get('source').formatSuggestion,
      source: function(query, callback) {
        // Normally we could just bind this.value to source.query.
        // But we need to make sure that the value gets propogated
        // to the source *before* we ask for results, hence this
        // manual `set` call.
        _this.set("source.query", query);

        var results = _this.get('source.results');
        callback(results);
      }
    });

    $input.on('typeahead:selected', function(event, suggestion) {
      _this.sendAction('gotSuggestion', suggestion);
    });
  }

});
