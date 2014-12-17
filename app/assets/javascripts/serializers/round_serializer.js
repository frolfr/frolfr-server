App.RoundSerializer = App.ApplicationSerializer.extend({
  attrs: { players: { embedded: 'always' } }
});
