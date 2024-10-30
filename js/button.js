document.getElementById('nav-toggle').addEventListener('click', function() {
    document.getElementById('overlay').style.display = 'flex';
});

document.getElementById('closebtn').addEventListener('click', function() {
    document.getElementById('overlay').style.display = 'none';
});