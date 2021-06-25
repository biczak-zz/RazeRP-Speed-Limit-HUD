window.addEventListener('message', (event) => {
	if (event.data.type === 'visibility') {
		if (event.data.data === true) {
			document.getElementById('container').classList.remove('hidden');
		} else {
			document.getElementById('container').classList.add('hidden');
		}
	}

	if (event.data.type === 'speedLimitData') {
		document.getElementById('speed-limit').innerHTML = event.data.data;
	}
});