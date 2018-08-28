(function (doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function () {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            if (clientWidth >= 750) {
                docEl.style.fontSize = '100px';
            } else {
                docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
            }
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);

/*鍒ゆ柇妯珫灞�*/
var system = {};
var p = navigator.platform;
system.win = p.indexOf("Win") == 0;
system.mac = p.indexOf("Mac") == 0;
system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
if (system.win || system.mac || system.xll) {
    //鐢佃剳璁块棶
    console.log(system.win || system.mac || system.xll);
} else {
    //鎵嬫満璁块棶
    function reurl() {
        location.reload();
    }
    window.addEventListener("onorientationchange" in window ? "orientationchange" : "resize", function () {
        var bod = document.getElementsByTagName("body")[0];
        var ht = bod.innerHTML;
        if (window.orientation === 180 || window.orientation === 0) {
            bod.innerHTML = ht;
            reurl();
        }
        if (window.orientation === 90 || window.orientation === -90) {
            bod.innerHTML = "<div style='margin-top:20%;'><h1 style='text-align:center;'>璇蜂笉瑕佹í灞忔煡鐪�!</h1></div>";
        }
    }, false);
}