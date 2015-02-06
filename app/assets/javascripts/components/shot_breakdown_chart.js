App.ShotBreakdownChartComponent = Ember.Component.extend({
  chartOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        format: '<b>{point.percentage:.1f}',
        style: {
          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
        }
      }
    }
  },

  series: function() {
    var birdies = this.get('birdies'),
        bogeys = this.get('bogeys'),
        pars = this.get('pars');

    return [{
      type: 'pie',
      name: 'Turns',
      data: [
       ['Birdies', birdies],
       ['Bogeys', bogeys],
       ['Pars', pars]
      ]
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
