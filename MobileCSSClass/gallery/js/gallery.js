(function () {
	// reset the gallery site when page loads.
	// if hash points to the #frame container
	// remove it.
	if (location.hash == '#frame') { 
		location.hash = '';
	}

	// shows the correct pic based on the clicked thumbnail
	function setPic() {
		var newPicLoc = this.src.replace('-thumb', '');
		var picHolder = document.querySelector('#frame .body'); 
		picHolder.style.backgroundImage = 'url(' + newPicLoc + ')';
		location.hash = "#frame";
	}

	function addMoreThumbnails(images) {
		images.forEach(function (thumb) {
			var item = thumb.parentNode;
			var extra = 0;
			var clone;
			while (extra++ < 4) {
				clone = item.cloneNode(true);
				item.insertAdjacentElement('afterEnd', clone);
			}
		});
		return [].slice.call(document.querySelectorAll('.thumbnails img'), null);
	}

	function setClickHandler(images) {
		images.forEach(function (thumb) {
			thumb.addEventListener('click', setPic, false);
		});
	}

	// init the gallery thumbnails
	document.addEventListener('DOMContentLoaded', function () {
		var images = document.querySelectorAll('.thumbnails img');
		images = [].slice.call(images, 0);
		images = addMoreThumbnails(images);
		setClickHandler(images);
	}, false);

})();
