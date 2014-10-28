App.RoundsShowController = Ember.ObjectController.extend({

  // init: function () {
  //   var roundPromise = this.get('content');
  //   var scorecardsPromise = roundPromise.get('scorecards');
  //   var holesPromise = this.get('holes');

  //   var roundRecap = this.get('RoundRecapArray')
  //   var roundRecapTable = roundRecap.create(roundPromise, scorecardsPromise, holesPromise)
  //   this.set('roundRecapTable', roundRecapTable);
  // },

  scorecardsTable: function () {
    var rows
    var roundPromise = this.get('content');
    var scorecardsPromise = roundPromise.get('scorecards');
    var holesPromise = this.get('holes');

    Promise.all([
      roundPromise, 
      scorecardsPromise, 
      holesPromise 
    ]).then( function (values) {
      var params = { 
        round: values[0], 
        scorecards: values[1],
        holes: values[2] 
      }
      rows = this.getPlayerScoresByHoleNumber(params);
    });
    return rows

  }.property('content.scorecards.length', 'course', 'course.holes.length'),

  getPlayerScoresByHoleNumber: function (params) {
    _this = this
    params.holes.map( function (hole) {
      var row = []
      var holeNumber = hole.get('number')
      var userScores = _this.findScoresFor(params.scorecards, holeNumber);

      row.pushObject(holeNumber);
      row.pushObjects(userScores);
      return row
    });
  },

  findScoresFor: function (holenumber) {
    scorecards.forEach( function (card) {
      var scorecard = this.findScoreFor(card);
      row.pushObject(scorecard, holenumber);
    });
  },

  findScoreFor: function (scorecard, holenumber) {
    var turn = scorecard.get('turns').find(function (turn) {
      return parseInt(turn.get('holeNumber')) == holeNumber
    });
  },

  course: function () {
    var courseId = this.get('content.courseId');
    return this.store.find('course', courseId);
  }.property('content.course'),


  holes: function () {
    var holes
    var course = this.get('course');

    if (course) {
      holes = course.get('holes');
    }
    
    return holes
  }.property('course', 'course.holes')

});


