var ANALYZER = (function() {
  'use strict';

  var containerId;

  var drawGraph = function(data) {
    var width = 800;
    var barHeight = 20;
    var height = barHeight * data.length;
    var margin = { top: 25, right: 50, bottom: 25, left: 140 };

    var x = d3.scale.linear()
      .range([0, width])
      .domain([0, d3.max(data, function(d) {
        return d.lines;
      })]);

    var y = d3.scale.ordinal()
      .rangeRoundBands([0, height])
      .domain(data.map(function(d) {
        return d.speaker;
      }));

    var xAxis = d3.svg.axis()
      .scale(x)
      .orient('bottom')
      .ticks(10);

    var yAxis = d3.svg.axis()
      .scale(y)
      .orient('left');

    var svg = d3.select('#' + containerId).append('svg')
      .attr('width', width + margin.left + margin.right)
      .attr('height', height + margin.top + margin.bottom)
      .append('g')
      .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

    svg.append('g')
      .attr('class', 'x axis')
      .call(xAxis)
      .attr('transform', 'translate(0' + (-margin.top) + ')');

    svg.append('g')
      .attr('class', 'y axis')
      .call(yAxis);

    svg.selectAll('.data-bar')
      .data(data)
      .enter().append('rect')
      .attr('y', function(d, i) {
        return i * barHeight;
      })
      .attr('width', function(d) {
        return x(d.lines);
      })
      .attr('height', barHeight - 1)
      .style('fill', '#2d5d87');

    svg.selectAll('.data-label')
      .data(data)
      .enter().append('text')
      .attr('x', function(d) {
        return x(d.lines) + 5;
      })
      .attr('y', function(d, i) {
        return i * barHeight;
      })
      .attr('dy', '.9em')
      .text(function(d) {
        return d.lines;
      });

  };

  var getData = function() {
    $.ajax({
      type: 'GET',
      contentType: 'application/json; charset=utf-8',
      url: 'results_data',
      dataType: 'json',
      success: function(data) {
        drawGraph(data);
      },
      error: function(error) {
        console.log(error);
      }
    });
  };

  return {
    renderGraph: function(id) {
      containerId = id;
      getData();
    }
  };

})();
