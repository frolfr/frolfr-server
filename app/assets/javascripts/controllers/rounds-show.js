App.RoundsShowController = Ember.ObjectController.extend({

  scorecardsTable: function () {
    // this all can really use some refacoring.  really it's just here now to provide proof of concept and show that all the resources are coming in.
    var rows = []

    var round = this.get('content');
    var scorecards = round.get('scorecards');

    if (scorecards.get('length') > 0) {
      var holes = this.get('holes');
      if (holes) {
        rows = holes.map( function (hole) {
          var row = []
          var holeNumber = hole.get('number')
          row.pushObject(holeNumber);
          scorecards.forEach( function (card) {

            var turn = card.get('turns').find(function (turn) {
              console.log(parseInt(turn.get('holeNumber')) == holeNumber);
              return parseInt(turn.get('holeNumber')) == holeNumber
            });

            row.pushObject(turn.get('score'));
          });
          return row
        });
      }
    }

    return rows
  }.property('content.scorecards.length', 'course', 'course.holes.length'),


  course: function () {
    var courseId = this.get('content.courseId');
    return this.store.find('course', courseId);
  }.property('content.course'),


  holes: function () {
    var holes
    var course = this.get('course');

    if (course) {
      console.log('here : course');
      holes = course.get('holes');
      
    }
    
    return holes
  }.property('course', 'course.holes')

});


