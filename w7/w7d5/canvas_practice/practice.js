document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = "blue";
  ctx.fillRect(20, 10, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "orange";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "orange";
  ctx.fill();

  const tri = canvas.getContext('2d');

  tri.beginPath();
  tri.moveTo(75, 50);
  tri.lineTo(100, 75);
  tri.lineTo(100, 25);
  tri.fillStyle = "yellow";
  ctx.fill();
});
