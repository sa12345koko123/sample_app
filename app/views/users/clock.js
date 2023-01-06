// clock関数を1000ミリ秒ごと(毎秒)に実行する
setInterval(clock, 1000);

function clock()
{
	var weeks = new Array("Sun","Mon","Thu","Wed","Thr","Fri","Sat");
	var now = new Date();
	var y = now.getFullYear();
	var mo = now.getMonth() + 1;
	var d = now.getDate();
	var w = weeks[now.getDay()];
	var h = now.getHours();
	var mi = now.getMinutes();
	var s = now.getSeconds();

	if (mo < 10) mo = "0" + mo;
	if (d < 10) d = "0" + d;
	if (mi < 10) mi = "0" + mi;
	if (s < 10) s = "0" + s;

	document.getElementById("time_date").innerHTML =  y + "/" + mo + "/" + d + " (" + w + ")";
	document.getElementById("time_time").innerHTML = h + ":" + mi + ":" + s;
	document.getElementById("time_frame").style.fontSize =  window.innerWidth / 10 + "px";
}