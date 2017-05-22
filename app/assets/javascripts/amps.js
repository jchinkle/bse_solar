amps_options = {
  chart: {
    type: 'area'
  },
  title: {
    text: 'Max Solar Amps'
  },
  subtitle: {
    text: 'Sever The Tether'
  },
  xAxis: {
    title: {
      text: 'Hours ago'
    },
    reversed: true
  },
  yAxis: {
    title: {
      text: 'Max Amps'
    }
  },
  tooltip: {
    split: true,
    valueSuffix: 'A'
  },
  plotOptions: {
    line: {
      enableMouseTracking: true
    }
  },
  series: [ 
    { name: "Max Total Charge Amps",
      data: [],
      color: '#668D3C',
      fillOpacity: 0.25},
    { name: "Rooftop Total Charge Amps",
      data: [],
      color: '#06C2F4',
      fillOpacity: 0.45},
    { name: "Aux Total Charge Amps",
      data: [],
      color: '#FF8642',
      fillOpacity: 0.55}
  ]
}


ah_options = {
  chart: {
    type: 'area'
  },
  title: {
    text: 'Amp Hours from Solar'
  },
  subtitle: {
    text: 'Sever The Tether'
  },
  xAxis: {
    title: {
      text: 'Hours ago'
    },
    reversed: true
  },
  yAxis: {
    title: {
      text: 'Amp Hours'
    }
  },
  tooltip: {
    split: true,
    valueSuffix: 'AH'
  },
  plotOptions: {
    line: {
      enableMouseTracking: true
    }
  },
  series: [ 
    { name: "Total Amp Hours Collected",
      data: [],
      color: '#668D3C',
      fillOpacity: 0.25},
    { name: "Rooftop Total AH",
      data: [],
      color: '#06C2F4',
      fillOpacity: 0.45},
    { name: "Aux Total AH",
      data: [],
      color: '#FF8642',
      fillOpacity: 0.55}
  ]
}

$.get('amps.json', function(data) {
  $.each(data, function(index, hour) {
    amps_options.series[0].data.push([index, hour.max_total_charge_amps]);
    amps_options.series[1].data.push([index, hour.chargers[0].max_charge_amps]);
    amps_options.series[2].data.push([index, hour.chargers[1].max_charge_amps]);

    ah_options.series[0].data.push([index, hour.chargers[0].charge_amp_hours + hour.chargers[1].charge_amp_hours]);
    ah_options.series[1].data.push([index, hour.chargers[0].charge_amp_hours]);
    ah_options.series[2].data.push([index, hour.chargers[1].charge_amp_hours]);
  });
  // Create the chart
  var a_chart = new Highcharts.Chart('container_amps', amps_options);
  var ah_chart = new Highcharts.Chart('container_amphours', ah_options);
});
