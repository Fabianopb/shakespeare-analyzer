var ANALYZER = (function() {
  'use strict';
  window.onload = function() {
		$.ajax({
		  type: "GET",
		  contentType: "application/json; charset=utf-8",
		  url: 'results_data',
		  dataType: 'json',
		  success: function (data) {
		    console.log(data);
		  },
			error: function (error) {
				console.log(error);
		  }
		});

	};
})();
