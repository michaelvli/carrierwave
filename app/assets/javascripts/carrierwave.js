$(function() {
	$('#new_video').fileupload({
		dataType: "script", // a script ("videos/create.js.erb") from the server will be executed after the file uploads
		// add function is triggered each time a video is added, providing an object, "data", which can be used to fetch information such as the file object (files.[0])
		add: function (e, data) { 
			types = /(\.|\/)(mp4|mov)$/i;
			file = data.files[0];
			if (types.test(file.type) || types.test(file.name))
			{
				data.context = $(tmpl("template-upload", data.files[0]));
				$('#new_video').append(data.context);
				data.submit(); // triggers uploading of the file
			}
			else
			{
				alert("#{file.name} is not a .mp4 or .mov video file")
			}
		},
		progress: function (e, data) { // progress callback function which updates the progress bar
			if (data.context)
			{
				progress = parseInt(data.loaded / data.total * 100, 10);
				data.context.find('.bar').css('width', progress + '%'); // find the progress bar and change the width value
			}	
		}
	});
});
