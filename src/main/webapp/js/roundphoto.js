var index = 1, timer;

function init() {
    eventBind();
    autoPlay();
}

init();

function autoPlay() {
    timer = setInterval(function () {
        animation(-1350);
        dotIndex(true);
    }, 2000)
}

function stopAutoPlay() {
    clearInterval(timer);
}

function dotIndex(add) {
    if (add) {
        index++;
    }
    else {
        index--;
    }
    if (index > 5) {
        index = 1;
    }
    if (index < 1) {
        index = 5;
    }
    dotActive();
}

function dotActive() {
    var dots = document.getElementsByClassName("dot");
    var len = dots.length;
    for (var i = 0; i < len; i++) {
        dots[i].className = "dot";
    }

    for (var i = 0; i < len; i++) {
        /*此处可以不用parseInt，当不用全等时*/
        if (index === parseInt(dots[i].getAttribute("index"))) {
            dots[i].className = "dot active";
        }
    }
}

function eventBind() {
    /*点的点击事件*/
    var dots = document.getElementsByClassName("dot");
    var len = dots.length;
    for (var i = 0; i < len; i++) {
        (function (j) {
            dots[j].onclick = function (e) {
                var ind = parseInt(dots[j].getAttribute("index"));
                animation((index - ind) * (-1350));
                /*显示点击的图片*/
                index = ind;
                dotActive();
            }
        })(i)
    }
    /*容器的hover事件*/
    var con = document.getElementsByClassName("container")[0];
    /*鼠标移动到容器上时，停止制动滑动，离开时继续滚动*/
    con.onmouseover = function (e) {
        stopAutoPlay();
    }
    con.onmouseout = function (e) {
        autoPlay();
    }
    /*箭头事件的绑定*/
    var pre = document.getElementsByClassName("pre")[0];
    var next = document.getElementsByClassName("next")[0];
    pre.onclick = function (e) {
        dotIndex(false);
        animation(1350);
    }
    next.onclick = function (e) {
        dotIndex(true);
        animation(-1350);
    }
}

function animation(offset) {
    var lists = document.getElementsByClassName("list")[0];
    var left = parseInt(lists.style.left.slice(0, lists.style.left.indexOf("p"))) + offset;
    if (left < -6750) {
        lists.style.left = "-1350px";
    }
    else if (left > -1350) {
        lists.style.left = "-6750px";
    }
    else {
        lists.style.left = left + "px";
    }
}