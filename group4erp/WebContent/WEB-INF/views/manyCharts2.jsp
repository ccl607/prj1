<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/WEB-INF/views/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YES4조 전사적자원관리 시스템 </title>

<style>
:root {
  --blue : #1B9DD9;
  --grey : #F5F6FA;
  --light-grey : #707070;
  --dark-grey : #5F5F5F;
  --border-radius : 20px;
  --green : #BCCF11;
  --red : #E20D18;
  --yellow : #FEC107;
  --silver : #C1C1C1;
  --bronze : #AC7D18;
}

html, body {
  margin: 0;
  font-family: 'Montserrat', sans-serif;
  
  background-color : var(--grey);
}

#app {
  height : 80em;
  width : 10vw;
  /* margin-top : 1em; */
  display : grid;
}

.slider-container {
  border-radius : 10px;
  display : flex;
  width : 15em;
  margin-left: auto;
  margin-right: auto;
  background-color : white;
  color : var(--dark-grey);
}

.slider-container .option {
  border-radius : 10px;
  width : 5em;
  margin : 0em;
  padding : .5em;
  text-align : center;
}

.slider-container .option.highlighted {
  background-color : var(--red);
  color : white;
}

.podium-places-container {
  display: flex;
  width : 50%;
  margin-left: auto;
  margin-right : auto;
  justify-content : center;
}

.podium {
  display : grid;
  grid-template-columns: 1fr 3fr;
  width : 15em;
  background-color : white;
  margin : 2.5em;
  border-radius : 20px;
  color : white;
}

.podium .position {
  border-right-style: solid;
  border-color: var(--grey);
  border-width : .4em;

}

.podium .position {
  width : 3em;
  position : relative;
}

.podium.gold .position {
  width : 5em;
}

.podium .class-information {
 padding : 0em;
}

.podium.bronze, .podium.silver {
  width : 13.5em;
  height : 7em;
  margin-top : 5em;
}

.podium.silver .position div,
.podium.bronze .position div {
  position : absolute;
  top : .2em;
  left : .1em;
  font-size : 4em;
}

.podium.gold .position div {
  position : absolute;
  top : .1em;
  left : .1em;
  font-size : 6em;
}



.podium.bronze .class-information .title, .podium.silver .class-information .title {
  margin-top : .5em;
  font-size : 1.1em;
}

.podium.bronze .class-information .steps, .podium.silver .class-information .steps {
  margin-top : .5em;
  font-size : 1.1em;
}

.podium.gold .class-information .title {
  margin-top : .5em;
  font-size : 1.4em;
}

.podium.gold .class-information .steps {
  margin-top : .5em;
  font-size : 1.4em;
}



.podium.bronze {
  background-color : var(--bronze);
}

.podium.silver {
  background-color : var(--silver);
}

.podium.gold {
  background-color : var(--yellow);
  height : 9em;
  width : 20em;
}


.list-item {

  width : 80%;
 margin-left: auto;
  margin-right: auto;
  background-color : white;
  margin-bottom : 1em;
  border-radius : 20px;
  height : 3em;
  position : relative;

}

.list-item .position {
  position : absolute;
  left : 3em;
}


.list-item .position {
  position : absolute;
  left : 1.5em;
  top : .4em;
  font-size : 2.5em;
  color : var(--red);
}

.list-item .class-information {
  
  position : absolute;
  left : 15em;
  top : .5em;
}

.list-item .steps {
  position : absolute;
  right : 2em;
  top : .4em;
  font-size : 2.5em;
  color : var(--red);
}

.list-item .class-information .title {
  font-size : 1.5em;
  color : var(--red);
}

.list-item .class-information .year {
  margin-top : .25em;
}

.leaderboards-container{
	height:30%
}


.list-item.highlighted, 
.list-item.highlighted .class-information .year,
.list-item.highlighted .class-information .title,
.list-item.highlighted .steps,
{
  background-color : var(--red);
  color : white !important;
}
</style>



<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body>
<div id="app"></div>

<script src='https://cdnjs.cloudflare.com/ajax/libs/react/0.13.0/react.min.js'></script>
<script id="rendered-js">
let title = 'Blackbirds';
let yearGroup = 'Year 3';
let steps = '1,345';

let app =
React.createElement("div", { className: "leaderboards-container" },
/*
React.createElement("div", { className: "slider-container" },
React.createElement("div", { className: "option" }, "Daily"),

React.createElement("div", { className: "option highlighted" }, "Momth")),

React.createElement("div", { className: "option" }, "Termly")),
*/

React.createElement("div", { className: "podium-places-container" },
React.createElement("div", null,
React.createElement("div", { className: "podium silver" },
React.createElement("div", { className: "position" },
React.createElement("div", null, "2")),



React.createElement("div", { className: "class-information" },
React.createElement("div", { className: "title" },
'${bestSellers[1].book_name}'),

React.createElement("div", { className: "year-group" },
'${bestSellers[1].cat_name}'),

React.createElement("div", { className: "steps" },
'${bestSellers[1].soldcnt}'+'권')))),

React.createElement("div", null,
React.createElement("div", { className: "podium gold" },
React.createElement("div", { className: "position" },
React.createElement("div", null, "1")),



React.createElement("div", { className: "class-information" },
React.createElement("div", { className: "title" },
'${bestSellers[0].book_name}'),

React.createElement("div", { className: "year-group" },
		'${bestSellers[0].cat_name}'),

React.createElement("div", { className: "steps" },
		'${bestSellers[0].soldcnt}'+'권')))),


React.createElement("div", null,
React.createElement("div", { className: "podium bronze" },
React.createElement("div", { className: "position" },
React.createElement("div", null, "3")),



React.createElement("div", { className: "class-information" },
React.createElement("div", { className: "title" },
		'${bestSellers[2].book_name}'),

React.createElement("div", { className: "year-group" },
		'${bestSellers[2].cat_name}'),

React.createElement("div", { className: "steps" },
		'${bestSellers[2].soldcnt}'+'권'))))),



React.createElement("div", { className: "places-list-container" },
React.createElement("div", { className: "list-item" },
React.createElement("div", { className: "position" }, "4"),


React.createElement("div", { className: "class-information" },
React.createElement("div", { className: "title" },
		'${bestSellers[3].book_name}'),

React.createElement("div", { className: "year" },
		'${bestSellers[3].cat_name}')),


React.createElement("div", { className: "steps" },
		'${bestSellers[3].soldcnt}'+'권')),



React.createElement("div", { className: "list-item" },
React.createElement("div", { className: "position" }, "5"),


React.createElement("div", { className: "class-information" },
React.createElement("div", { className: "title" },
		'${bestSellers[4].book_name}'),

React.createElement("div", { className: "year" },
		'${bestSellers[4].cat_name}')),


React.createElement("div", { className: "steps" },
		'${bestSellers[4].soldcnt}'+'권'))));

React.render(app, document.getElementById('app'));
//# sourceURL=pen.js
    </script>

</body>
</html>