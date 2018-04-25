// using AJAX to get the daily horoscope

$(document).ready(function() {
  $(".pad-img").click(function (event) {
    let sign = event.target.id
   $.get(`http://node-horoscopes.herokuapp.com/api/horoscopes/today/${sign}/`, function (myResponse) {
     $(".horoscope").html("")
     $(`#${sign}`).next().html(myResponse.date + "<br>" + myResponse.horoscope)
    })
  })
});

let signId;
let signId2;
let signElement;
let sign2Element;
let click = 1

// allow user to select 2 signs and get the compatiablity back using AJAX

$(".compat-img").click(function (event) {
   if (click == 1) {
    signId = event.target.id
    signElement = event.target
    $("#sign1").html(signElement.cloneNode(true))
    click = 2;
   }
   else {
    sign2Id = event.target.id
    sign2Element = event.target
    $("#sign2").html(sign2Element.cloneNode(true))
    $.get(`http://node-horoscopes.herokuapp.com/api/horoscopes/dating/${signId}/${sign2Id}/`, function (myResponse) {
    $("#compatiable").html(myResponse.text)
    click = 1;
   })
  }
});
