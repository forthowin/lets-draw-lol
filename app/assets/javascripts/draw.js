$(document).ready(function(){
  var a=false;var b,c="";var d=document.getElementById("canvas-area");
  var e=d.getContext("2d");e.strokeStyle="black";
  e.lineWidth=5;e.lineCap="round";
  e.fillStyle="#fff";e.fillRect(0,0,d.width,d.height);
  $("#clr > div").click(function(){e.strokeStyle=$(this).css("background-color")});
  $("#canvas-area").mousedown(function(d){a=true;e.save();b=d.pageX-this.offsetLeft;c=d.pageY-this.offsetTop});

  $(document).mouseup(function(){a=false});
  $(document).click(function(){a=false});

  $("#canvas-area").mousemove(function(d){
    if(a==true){
      e.beginPath();
      e.moveTo(d.pageX-this.offsetLeft,d.pageY-this.offsetTop);
      e.lineTo(b,c);
      e.stroke();
      e.closePath();
      b=d.pageX-this.offsetLeft;
      c=d.pageY-this.offsetTop
    }
  });
});