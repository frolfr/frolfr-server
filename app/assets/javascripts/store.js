DS.RESTAdapter.reopen({
  namespace: 'api'
});

App.ApplicationStore = DS.Store.extend({

});

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
App.ApplicationAdapter = DS.ActiveModelAdapter.extend({

});

App.ApiKeyAdapter = DS.LSAdapter.extend({
  namespace: 'frolfr'
});
