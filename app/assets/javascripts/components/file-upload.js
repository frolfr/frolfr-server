App.FileUploadComponent = EmberUploader.FileField.extend({
  url: '',
  imageUrl: null,

  filesDidChange: function() {
    var uploadUrl = this.get('url');
    var files = this.get('files');
    var uploader = EmberUploader.Uploader.create({
      url: uploadUrl
    });
    var _this = this;

    if (!Ember.isEmpty(files)) {
      uploader.upload(files[0]).then(function(data) {
        _this.set('imageUrl', data.user.avatar_url)
      });
    }
  }.observes('files')
});
