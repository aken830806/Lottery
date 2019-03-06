// javascript reference to our sketch
var pjs = undefined;
var bound = false;

// bind JS to the p5 sketch for two way communication
function bindJavaScript() {
  if(Processing) { pjs = Processing.getInstanceById("sketch"); }
  if (pjs !== undefined && pjs.bindJavaScript !== undefined) {
    pjs.bindJavaScript(this);
    bound = true; }
  if(!bound) setTimeout(bindJavaScript, 250);
}

// schedule binding
bindJavaScript();

var coordY = 0;
  
window.onmousemove = mouseHandler;
window.ontouchstart = touchHandler;
window.ontouchmove = touchHandler;
window.ontouchend = touchHandler;

function mouseHandler(event) {
  switch (event.type) {
      case 'mousemove':
        coordY = event.clientY;
        break;
  }
  console.log(event.type);
}

function touchHandler(event) {
  event.preventDefault();
  var firstTouch = event.touches[0];
  switch (event.type) {
      case 'touchstart':
        coordY = firstTouch.clientY;
        pjs.touchStart();
        break;
      case 'touchmove':
        coordY = firstTouch.clientY;
        pjs.touchMove();
        break;
      case 'touchend':
        pjs.touchEnd();
        break;
  }
  console.log(event.type);
}
