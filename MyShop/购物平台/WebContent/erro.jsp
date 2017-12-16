<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>错误页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Artistic Error Page Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files -->
<!-- /font files -->
<!-- css files -->
<link href="${ctx}/css/errostyle.css" rel="stylesheet" type="text/css" media="all" />
<!-- /css files -->
</head>
<body>
	<div style="background:url('${ctx}/images/cut.jpg');height:200px;">
	<div id="cavdiv" style="width:700px;height: 200px;margin-left:230px" >
        <canvas id="people"  style="background: rgba(255,255,155,0); position: absolute; z-index: 2">您的浏览器不支持canvas标签。</canvas>
        <canvas id="background"  style="position: absolute; z-index: 1">您的浏览器不支持canvas标签。</canvas>
        <canvas id="box"  style="background: rgba(255,255,155,0);position: absolute; z-index: 2">您的浏览器不支持canvas标签。</canvas>
    
		</div>
	</div>
	<div class="w3layouts-bg">
		
		<div class="agileits-content">
			<h2><span>4</span><span>0</span><span>4</span></h2>
	
		</div>
		<div class="w3layouts-right">
			<div class="w3ls-text">
				<h3>we're sorry!</h3>
				<h4 class="w3-agileits2">the page you requested could not be found.</h4>
				<p>Please go back to the <a href="index.jsp">Home</a> page </p>
				<p class="copyright">© 2017  Error Page. All Rights Reserved </p>
	
			</div>
				
		</div>
		<div class="clearfix"></div>
	</div>
<script  type="text/javascript">
var eventjs = {
    //添加事件
    bind: function(elem, type, handler){
        if (elem.addEventListener) {
            elem.addEventListener(type, handler, false);
        } else if(elem.attachEvent){
            //IE
            elem.attachEvent("on" + type, handler);
        }else{
            elem["on" + type] = handler;
        };
    },
    //删除事件
    unbind: function(elem, type ,handler){
        if (elem.removeEventListener) {
            elem.removeEventListener(type, handler, false);
        } else if(elem.detachEvent){
            //IE
            elem.detachEvent("on" + type, handler)
        }else{
            elem["on" + type] = handler;
        };
    },
    //获取事件
    getEvent: function(event){
        return event ? event : window.event;
    },
    //获取键盘code
    getCharCode: function(event){
        if (typeof event.charCode == "number") {
            console.log('char code');
            return event.charCode;
        } else{
            return event.keyCode;
        };
    },
    getDirection: function(event){
        var keyCode = event.which || event.keyCode;
        switch(keyCode){
            case 1:
            case 38:
            case 269: //up
                return 'up';
                break;
            case 2:
            case 40:
            case 270:
                return 'down';
                break;
            case 3:
            case 37:
            case 271:
                return 'left';
                break;
            case 4:
            case 39:
            case 272:
                return 'right';
                break;
            case 339: //exit
            case 240: //back
                return 'back';
                break;
        }
    }
};
</script>
<script type="text/javascript">
(function(){
    // canvas
    var canvas = document.getElementById('people');
    var ctx = canvas.getContext('2d');

    var backcan = document.getElementById('background');
    var backctx = backcan.getContext('2d');

    var boxcan = document.getElementById("box");
    var boxctx = boxcan.getContext("2d");

    //div 
            var div = document.getElementById('cavdiv');
            var scrollLeft = div.scrollLeft;
    //background base 
    var backgroundImage = new Image();
       backgroundImage.src = "${ctx}/images/back1.jpg";

       var background = {
        imageX: 0,  // 图像定位坐标
        imageY: 0,
        width:800,
        height: 400
       };

    //player base
    var playerImage = new Image();
    playerImage.src = '${ctx}/images/peo.png';
    var player = {
        x: 50,       // 在canvas中的坐标
        y: 23,
        imageX: 0,  // 图像定位坐标
        imageY: 0,
        width: 50,  // 图像显示区域大小
        height: 60,
        jumping: false //是否跳跃
    };
    var game = false;
    var gravity = -0.4; //重力加速度
    var vy = 12; // 跳跃初速度

    //box base 
    var boxImage = new Image();
    boxImage.src = '${ctx}/images/box2.png';
    var boxArrays  = new Array();
        var box = {
             x: 600,       // 在canvas中的坐标
             y: 23,
             imageX: 0,  // 图像定位坐标
             imageY: 0,
             width: 50,  // 图像显示区域大小
             height: 40,
             id:0
        };
   boxArrays[0] = box;

   function  isCollsionWithRect() {
        for (var i = 0; i < boxArrays.length; i++) {
         if (player.x >= boxArrays[i].x && player.x >= boxArrays[i].x + boxArrays[i].width) {
         
         } else if (player.x <= boxArrays[i].x && player.x +player.width <= boxArrays[i].x) {
         
         } else if (canvas.height - player.height - player.y <= boxcan.height -boxArrays[i].y- boxArrays[i].id*(boxArrays[i].height-4) && canvas.height - player.height - player.y + player.height <= boxcan.height -boxArrays[i].y- boxArrays[i].id*(boxArrays[i].height-4)) {   
           
         }else {
           if(confirm("游戏结束~ 您要继续吗？")) {
                 history.go(0);
            }
           }
        };
        
        
     }

    function clean () {
        // clear canvas
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    }

    function BackgroundClean () {
        backctx.clearRect(0, 0, backcan.width, backcan.height);
    }
    function BoxClean () {
       boxctx.clearRect(0, 0, boxcan.width, boxcan.height);
    }

    function Init () {
        // init player
        playerImage.onload = _drawPlayer;
        // init BackGround
        backgroundImage.onload =  _drawBackground;
    }

    function playerMove () {
                player.imageX +=50;
                if(player.imageX>=150) {
                    player.imageX=0;
              }
        clean();
        _drawPlayer();
    }
    
    function playerJump () {
             
        player.y += vy;
        player.imageX = 100;
        player.imageY = 0;
        vy +=gravity;

        if(player.y<23) {
             player.y = 23;
             player.imageX = 0;
             vy=12;
             player.jumping = false;
             clean();
            _drawPlayer();
            clearInterval(sid);
            pid = setInterval(playerMove,100);
            return;
        }

            clean();
         _drawPlayer();         
}

  
    function BackgroundLoop() {
        
        if(scrollLeft>background.width)
    {
        scrollLeft=0;
         boxArrays[0].x =600;    
    }
    else
    {
        scrollLeft+=3;
    }
    BackgroundClean();
    _drawBackground();
    for (var i = 0; i < boxArrays.length; i++) {

        boxArrays[i].x-=3;
        BoxClean();
     _drawBox(boxArrays);
    };
    
    }
    function NewBox () {
            if(boxArrays[0].x == player.x+player.width+107) {
                var box1 = {
                    x: 0,       // 在canvas中的坐标
                    y: 23,
                    imageX: 0,  // 图像定位坐标
                    imageY: 0,
                    width: 50,  // 图像显示区域大小
                    height: 40,
                    id:0
                }
                box1.x = Math.ceil(Math.random()*700+500);
                box1.id = Math.ceil(Math.random()*3);
                boxArrays [1] = box1;
            }
    }
   function _drawBackground () {
        backctx.drawImage(backgroundImage, scrollLeft,0, background.width-scrollLeft,background.height, 0, 0, background.width-scrollLeft, background.height);
         backctx.drawImage(backgroundImage,0,0,scrollLeft, background.height,background.width-scrollLeft,0,scrollLeft,background.height);
    }
    function _drawPlayer () {
        ctx.drawImage(playerImage, player.imageX, player.imageY, player.width, player.height, player.x, canvas.height - player.height - player.y, player.width, player.height);
    }
    function _drawBox (value) {
        for (var i = 0; i <value.length ; i++) {
            for (var j = 1; j < value[i].id+1; j++) {
                 boxctx.drawImage(boxImage,value[i].imageX,value[i].imageY, value[i].width,value[i].height, value[i].x,boxcan.height -value[i].y- j*(value[i].height-4), value[i].width,value[i].height);
            };
            
        };
    }


    function playerAction (value) {
        var posX = 0;
        var posY = 0;
        switch(value){
            case 'up':
            if(!game) {
                 pid = setInterval(playerMove,60);
                  setInterval(BackgroundLoop,10);
                  box.id = Math.ceil(Math.random()*3);
                   setInterval(NewBox,10);
                   setInterval(isCollsionWithRect,10);
                 game = true;
             }else {
                if(!player.jumping) {
                    player.jumping = true;
                         clearInterval(pid);
                         sid = setInterval(playerJump,10);  
                     }    
                 }   
                break;
            case 'right':
            if(!game) {
                 pid = setInterval(playerMove,60);
                  setInterval(BackgroundLoop,10);
                   box.id = Math.ceil(Math.random()*3);
                   setInterval(NewBox,10);
                   setInterval(isCollsionWithRect,10);
                 game = true;
                }   
                break;
            case 'down':
            if(!game) {
                 pid = setInterval(playerMove,60);
                  setInterval(BackgroundLoop,10);
                   box.id = Math.ceil(Math.random()*3);
                   setInterval(NewBox,10);
                   setInterval(isCollsionWithRect,10);
                 game = true;
                }   
                break;
            case 'left':
            if(!game) {
                 pid = setInterval(playerMove,60);
                  setInterval(BackgroundLoop,10);
                   box.id = Math.ceil(Math.random()*3);
                   setInterval(NewBox,10);
                   setInterval(isCollsionWithRect,10);
                 game = true;
                } 
                break;
        };
        return {x: player.x, y: player.y};
    }

    var init = (function(options){
        options = options || {};
        canvas.width = options.width;
        canvas.height = options.height;
        backcan.width = options.width;
        backcan.height = options.height;
        boxcan.width = options.width;
        boxcan.height = options.height;
        Init();
        eventjs.bind(document, 'keydown', function(event){
            var d = eventjs.getDirection(event);
            playerAction(d);
        });
    })({width:800, height:400});

})();
</script>
</body>
</html>