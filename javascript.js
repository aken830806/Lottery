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

var coordX = 0;
var coordY = 0;
  
window.onmousemove = coordHandler;
window.ontouchstart = coordHandler;
window.ontouchmove = coordHandler;
window.ontouchend = coordHandler;
  
function coordHandler(event) {
  event.preventDefault();
  var firstTouch;
  switch (event.type) {
      case 'mousemove':
        coordX = event.clientX;
        coordY = event.clientY;
        break;
      case 'touchstart':
        pjs.touchStart();
        firstTouch = event.touches[0];
        coordX = firstTouch.clientX;
        coordY = firstTouch.clientY;
        break;
      case 'touchmove':
        firstTouch = event.touches[0];
        coordX = firstTouch.clientX;
        coordY = firstTouch.clientY;
        pjs.touchMove();
        break;
      case 'touchend':
        pjs.touchEnd();
        break;
  }
  console.log(event.type);
}
