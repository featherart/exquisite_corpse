$(function() {
  var $canvas = $("#drawing");
  if($canvas.length == 0) {
    return;
  }
  var $clear = $("#clear");
  var $form = $("#new_drawing");
  var $hidden = $("#drawing_image");
  var button_is_down = false;
  var context = $canvas[0].getContext('2d');
  var erase = false;
  var $radio_val = $('input:radio[name=draw_erase]');
  //var $draw_or_erase = "";
  //var $draw_or_erase = $('input[name="draw_erase"]').val();
  //var $draw_or_erase = $('input[name="draw_erase"]:checked').val();
  //var draw_or_erase1 = $('input[name="draw_erase1"]:checked').val();
  //var draw_or_erase2 = $('input[name="draw_erase2"]:checked').val();
  //alert(draw_or_erase);

  $(document).mouseup(function(e) {
    if(button_is_down) {
      console.log("in mouseup" + erase);
      var x = e.pageX - this.offsetLeft;
      var y = e.pageY - this.offsetTop;
      context.lineTo(x,y);
      context.stroke();
    }
    button_is_down = false;
    $('body').removeClass('noselect');
  });

  $canvas.mousedown(function(e) {
    console.log("in mousedown" + erase);
    var x = e.pageX - this.offsetLeft;
    var y = e.pageY - this.offsetTop;
    context.beginPath();
    context.moveTo(x,y);
    $('body').addClass('noselect');
    button_is_down = true;
  });

  $(document).mousemove(function(e) {
    if(button_is_down) {
      console.log("in mousemove" + erase);
      var x = e.pageX - $canvas[0].offsetLeft;
      var y = e.pageY - $canvas[0].offsetTop;
      context.lineTo(x,y);
      context.stroke();
    }
    // prevent elastic scrolling
    document.body.addEventListener('touchmove',function(event){
    event.preventDefault();
    },false); // end body:touchmove
  });

  // save drawing
  $form.submit(function(e) {
    var opt = drawing_drawing_type_id.selectedIndex;
    if( opt == 0 ) {
      alert("Please select a drawing type");
      e.preventDefault();
    }
    else {
      var url = $canvas[0].toDataURL('image/png'),
          img = document.createElement('img'),
          drawings_target = $('#drawings_target');

      img.src = url;     
      drawings_target.append(img);
      $hidden.val(url);
    }
  });

  // allow erasing
  //$("input:radio[name=draw_erase]").click(function() {
  $radio_val.click(function() {
    erase = false;
    console.log(erase);
    //$('canvas#draw').css('cursor', 'url(image/another-cursor.cur)');
    $('canvas#drawing').css('cursor', 'cursor: hand');
    var value = $(this).val();

    //alert(value);
    if(value == "erase") {
      erase = true;
      console.log(erase);
    }
    else {
      erase = false;
    }
  });
  /*
  $radio_val.click(function(){
    $draw_or_erase = this.val();
    alert('clicked! ' + $draw_or_erase);
    //erase = true;
    //console.log(erase);
  }); */
   // allow erasing
   /*
  $("#draw_erase").click(function(){
    alert('clicked! ' + draw_or_erase2);
  }); */

  

  function clearCanvas() {
    context.clearRect(0,0,$canvas.width(),$canvas.height());   
  }

  $clear.click(clearCanvas);
  clearCanvas();
});
