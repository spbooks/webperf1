var person = {
    firstname:"John",
    lastname:"Doe",
    age:50,
    eyecolor:"blue"
};
function DayOfWeek(day, month, year) {
    var a = Math.floor((14 - month) / 12);
    var y = year - a;
    var m = month + 12 * a - 2;
    var d = (day + y + Math.floor(y / 4) - Math.floor(y / 100) +
             Math.floor(y / 400) + Math.floor((31 * m) / 12))  % 7;
    return d;
}
var visits = getCookie("counter");

if (visits) {
     visits = parseInt(visits) + 1;
     document.write("By the way, you have been here " + visits + " times.");
}
else {
     visits = 1;
     document.write("By the way, this is your first time here.");
}
setCookie("counter", visits);

function myFunction() {
    var x = document.getElementById("demo");
    x.style.fontSize = "25px";           
    x.style.color = "red"; 
}
var myPix = new Array("images/pathfinder.gif", "images/surveyor.gif", "images/surveyor98.gif");
var thisPic = 0;

function processPrevious() {
     if (document.images && thisPic > 0) {
          thisPic--;
          document.myPicture.src = myPix[thisPic];
     }
}

function processNext() {
     if (document.images && thisPic < 2) {
          thisPic++;
          document.myPicture.src = myPix[thisPic];
     }
}