// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	// newTask();


	$('#header form').on('submit', function(e){
			e.preventDefault();
			var input = $(this).serializeArray();
			console.log(input)
			
			$.ajax({
				type: 'post',
				url: '/tasks',
				data: input,
			})
			.done(function(response){
				$('#todo-list').append(response);
				$('form')[0].reset();
			})
			// .fail(function(jqXHR, textStatus, error){
			// 	console.log(jqXHR, textStatus, error)
			// })

	})

})

// var newTask = function(){



// }