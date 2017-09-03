document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');

    ctx.fillStyle = 'black'; //background
    ctx.fillRect(0, 0, 500, 500);

    ctx.fillStyle = 'green';
    ctx.fillRect(60, 30, 200, 150);

    ctx.beginPath();
    ctx.arc(300, 180, 60, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.fillStyle = 'red';
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(300, 350);
    ctx.lineTo(105, 0);
    ctx.lineTo(5, 105);
    ctx.fillStyle = 'orange';
    ctx.fill();


});
