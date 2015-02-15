App.ShotBreakdownChartComponent = Ember.Component.extend({
  chartOptions: function() {
    return {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.percentage:.1f}</b>',
          style: {
            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
          }
        }
      },
      credits: {
        enabled: false
      },
      colors: this.get('colors')
    }
  }.property(),

  colors: function() {
    var eagleColor = ['#00BFFF', this.get('eagles')],
        birdieColor = ['#9FF781', this.get('birdies')],
        parColor = ['#BDBDBD', this.get('pars')],
        bogeyColor = ['#F78181', this.get('bogeys')],
        doubleColor = ['#B40404', this.get('doubles')];

    return [eagleColor, birdieColor, parColor, bogeyColor, doubleColor].filter(function(colorData){
      return colorData.get('lastObject') !== 0;
    }).map(function(colorData) {
      return colorData.get('firstObject');
    });
  }.property(),

  series: function() {
    var birdies = ['Birdies', this.get('birdies')],
        bogeys = ['Bogeys', this.get('bogeys')],
        pars = ['Pars', this.get('pars')],
        eagles = ['Eagles', this.get('eagles')],
        doubles = ['Double Bogey or Worse', this.get('doubles')];

    var data = [eagles, birdies, pars, bogeys, doubles].filter(function(shotData) {
      return shotData.get('lastObject') !== 0;
    })

    return [{
      type: 'pie',
      name: 'Turns',
      data: data
    }];
  }.property(),

  didInsertElement: function () {
    var chart = this.get('chartOptions');
    chart.series = this.get('series');
    chart.title = '';

    $('.chart').highcharts(chart);
  },

  willDestroyElement: function () {
    $('.chart').highcharts().destroy();
  }
});
