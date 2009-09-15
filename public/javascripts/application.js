// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var createColorPath = function(startColor, endColor, distance) {
var colorPath = [],
	colorPercent = 1.0,
  distance = (distance < 100) ? distance : 100;
do {
  colorPath[colorPath.length] = setColorHue(longHexToDec(startColor), colorPercent, longHexToDec(endColor));	
  colorPercent -= ((100/distance)*0.01);
} while (colorPercent>0);
return colorPath;
},
setColorHue = function(originColor, opacityPercent, maskRGB) {
var returnColor = [];
for (var i=0; i<originColor.length; i++)
  returnColor[i] = Math.round(originColor[i]*opacityPercent) + Math.round(maskRGB[i]*(1.0-opacityPercent));
return returnColor;
},
longHexToDec = function(longHex) {
return new Array(toDec(longHex.substring(0,2)),toDec(longHex.substring(2,4)),toDec(longHex.substring(4,6)));
},
rgbToHex = function(rgb){
  var decColor = rgb[2] + 256 * rgb[1] + 65536 * rgb[0];
  return decColor.toString(16);
},
toDec = function(hex) {
  return parseInt(hex,16);
},
toHex = function(dec){
  return dec.toString(16);
};
jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} })
function thumbs_down(thumbometer_id){
  $.ajax({
  url: 'thumbs/down.js',
  type: 'get',
  data: {thumbometer_id: thumbometer_id},
  dataType: 'script'
  });
  $.sound.play('../sounds/uh_oh.mp3');
  $('div#t' + $('#current_step').val() + ' > div').remove();
  $('#current_step').val(parseInt($('#current_step').val())-1);
  
}
function thumbs_up(){
  $.sound.play('../sounds/woo_hoo.mp3');
  draw_thumbometer_div(parseInt($('#total_steps').val()), parseInt($('#current_step').val()));
  $('#current_step').val(parseInt($('#current_step').val())+1);
}
function draw_thumbometer_div(total_steps, step_to_draw){
   colours = createColorPath('FF0000','00FF00', total_steps+1);
   $('div#t' + (step_to_draw + 1)).gradient({ from: rgbToHex(colours[step_to_draw]), to: rgbToHex(colours[step_to_draw+1]) , direction: 'vertical'});
}
