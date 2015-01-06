App.FileUploadComponent = EmberUploader.FileField.extend({
  url: '',

  filesDidChange: (function() {
    var uploadUrl = this.get('url');
    var files = this.get('files');
    var uploader = EmberUploader.Uploader.create({
      url: uploadUrl
    });

    if (!Ember.isEmpty(files)) {
      uploader.upload(files[0]).then(function(data) {
      });
    }
  }).observes('files')
});
