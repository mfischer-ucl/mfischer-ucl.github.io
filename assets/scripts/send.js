document.getElementById('submit').addEventListener('click', function() {
    var formData = {
        video1: document.querySelector('input[name="video1"]:checked').value,
        video2: document.querySelector('input[name="video2"]:checked').value,
        video3: document.querySelector('input[name="video3"]:checked').value,
        video4: document.querySelector('input[name="video4"]:checked').value,
        video5: document.querySelector('input[name="video5"]:checked').value
    };
    fetch('https://script.google.com/macros/s/AKfycbxDLj3wPUgYfh-xYAbkHVWQM5F19A5rowWyphynWjbwlCwLr4qcWGyYiIHsohxvlMNX/exec', {
        method: 'POST',
        body: JSON.stringify(formData),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error('Error:', error));
});