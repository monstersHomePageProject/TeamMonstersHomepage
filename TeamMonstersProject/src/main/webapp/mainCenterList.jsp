<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <style>
    *{margin:0; padding: 0;}
    .sample{margin:0 20px}
    .responsive-img{width:100%}
  </style>
<meta charset="UTF-8">
<title>MainCentreImage</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
   <script>
   $(document).ready(function() {
	   $('img[usemap]').rwdImageMaps();
   });
   </script>
</head>
<body>
<div class = "imageMap">

<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="./img/ImageMap.png" usemap="#image-map">

<map name="image-map">
    <area target="_self" alt="out1" title="out1" href="mainAction.jsp?plPosition=1" coords="281,151,347,233" shape="rect">
    <area target="_self" alt="out2" title="out2" href="mainAction.jsp?plPosition=1" coords="536,128,601,205" shape="rect">
    <area target="_self" alt="out3" title="out3" href="mainAction.jsp?plPosition=1" coords="998,152,1060,232" shape="rect">
    <area target="_self" alt="in4" title="in4" href="mainAction.jsp?plPosition=2" coords="226,266,286,349" shape="rect">
    <area target="_self" alt="in5" title="in5" href="mainAction.jsp?plPosition=2" coords="610,199,674,277" shape="rect">
    <area target="_self" alt="in6" title="in6" href="mainAction.jsp?plPosition=2" coords="999,270,1057,351" shape="rect">
    <area target="_self" alt="pitcher" title="pitcher" href="mainAction.jsp?plPosition=3" coords="587,291,671,382" shape="rect">
    <area target="_self" alt="catcher" title="catcher" href="mainAction.jsp?plPosition=4" coords="596,501,674,595" shape="rect">
    <area target="_self" alt="DirCoach" title="DirCoach" href="mainAction.jsp?plPosition=5" coords="1058,487,1219,610" shape="rect">
    <area target="_self" alt="Employeed" title="Employeed" href="mainAction.jsp?plPosition=6" coords="87,470,225,605" shape="rect">
</map>

</div>
</body>
</html>