function displayDate(){
	if(document.getElementById("demo").innerHTML==="Javascript"){
		document.getElementById("demo").innerHTML=new Date();
		document.getElementById("btn").innerHTML="Javascript";
		document.getElementById("javascript").style.display="none";
	}
	else{
		document.getElementById("demo").innerHTML="Javascript";
		document.getElementById("btn").innerHTML="Date";
		document.getElementById("javascript").style.display="block";
	}
}
function calll(){
	var cal=document.getElementById("cal").value;
	var mon=document.getElementById("mon").innerHTML;
	var mon1=mon.split(/[$,.]/);
	alert(cal+","+mon1[1]);
	//document.getElementById("mon").style.display="block";
	var res;
	if(cal!=""){
		res=Number(mon1[1])+Number(cal);
		document.getElementById("mon").innerHTML="Thank you for $"+res+".";
		document.getElementById("mon").style.display="block";
	}
	else if((Number(mon1[1]))>0){
		res=Number(mon1[1]);
		document.getElementById("mon").innerHTML="Thank you for $"+res+".";
		document.getElementById("mon").style.display="block";
		//break;
	}
	else{
		//break;
	}/**/
}
function showOrhide(){
	if(document.getElementById("list").style.display==="none"){
		document.getElementById("list").style.display="block";
	}
	else{
		document.getElementById("list").style.display="none";
	}
}
function ot(num){
	if(num==0){
		document.getElementById("text").style.display="block";
	}
	else{
		document.getElementById("text").style.display="none";
	}
}
function calcurlate(){
	var shi=document.getElementById("cal").value;
	var res;
	if((shi.split("+")).length==2){
		res=Number(shi.split("+")[0]) + Number(shi.split("+")[1]);
	}
	else if((shi.split("-")).length==2){
		res=Number(shi.split("-")[0]) - Number(shi.split("-")[1]);
	}
	else if((shi.split("*")).length==2){
		res=Number(shi.split("*")[0]) * Number(shi.split("*")[1]);
	}
	else if((shi.split("/")).length==2){
		res=Number(shi.split("/")[0]) / Number(shi.split("/")[1]);
	}
	else{
		res="error";
	}
	document.getElementById("res").innerHTML=res;
}
function c1(){
	var shi=document.getElementById("cal").value;
	var res;
	try{
		if((shi.split("+")).length==2){
		res=Number(shi.split("+")[0]) + Number(shi.split("+")[1]);
		}
		else if((shi.split("-")).length==2){
		res=Number(shi.split("-")[0]) - Number(shi.split("-")[1]);
		}
		else if((shi.split("*")).length==2){
		res=Number(shi.split("*")[0]) * Number(shi.split("*")[1]);
		}
		else if((shi.split("/")).length==2){
		res=Number(shi.split("/")[0]) / Number(shi.split("/")[1]);
		}
		else{
		res="error";
		}
	}
	catch(err){
		res="error";
	}
	document.getElementById("res").innerHTML=res;
}
function calall(){
	var shi=document.getElementById("cal").value;
	var fir,rep;
	var arr1=new Array(),arr2=new Array(),arr3=new Array();
	while(shi.indexOf("+")>=0 || shi.indexOf("-")>=0 || shi.indexOf("/")>=0 || shi.indexOf("*")>=0){
		if((shi.indexOf("*") < shi.indexOf("/") && shi.indexOf("*")!=-1) || (shi.indexOf("*")!=-1 && shi.indexOf("/")==-1)){
			arr1=shi.split("*");
			arr2=arr1[0].split(/[-,+,*,/]/);
			arr3=arr1[1].split(/[-,+,*,/]/);
			fir=Number(arr2[arr2.length-1]) * Number(arr3[0]);
			rep=arr2[arr2.length-1]+"*"+arr3[0];
			shi=shi.replace(rep,fir);
		}
		else if((shi.indexOf("*") > shi.indexOf("/") || shi.indexOf("*")==-1) && shi.indexOf("/")!=-1){
			arr1=shi.split("/");
			arr2=arr1[0].split(/[-,+,*,/]/);
			arr3=arr1[1].split(/[-,+,*,/]/);
			fir=Number(arr2[arr2.length-1]) / Number(arr3[0]);
			rep=arr2[arr2.length-1]+"/"+arr3[0];
			shi=shi.replace(rep,fir);			
		}
		else{
			if((shi.indexOf("+") < shi.indexOf("-") || shi.indexOf("-")==-1) && shi.indexOf("+")!=-1){
				arr1=shi.split("+");
				arr2=arr1[0].split(/[-,+,*,/]/);
				arr3=arr1[1].split(/[-,+,*,/]/);
				fir=Number(arr2[arr2.length-1]) + Number(arr3[0]);
				rep=arr2[arr2.length-1]+"+"+arr3[0];
				shi=shi.replace(rep,fir);				
			}
			else if((shi.indexOf("+") > shi.indexOf("-") || shi.indexOf("+")==-1) && shi.indexOf("-")!=-1){
				arr1=shi.split("-");
				arr2=arr1[0].split(/[-,+,*,/]/);
				arr3=arr1[1].split(/[-,+,*,/]/);
				fir=Number(arr2[arr2.length-1]) - Number(arr3[0]);
				rep=arr2[arr2.length-1]+"-"+arr3[0];
				shi=shi.replace(rep,fir);				
			}
			else{break;}
		}
	}
	document.getElementById("res").innerHTML=shi;
}
function sprr(){
	var shi=document.getElementById("cal").value;
	var res,fir,rep;
	var arr1=new Array(),arr2=new Array(),arr3=new Array();
	arr1=shi.split("/");
	arr2=arr1[0].split(/[-,+,*,/]/);
	arr3=arr1[1].split(/[-,+,*,/]/);
	fir=Number(arr2[arr2.length-1]) / Number(arr3[0]);
	rep=arr2[arr2.length-1]+"/"+arr3[0];
	res=shi.replace(rep,fir);
	document.getElementById("res").innerHTML=res;
}
function addHandler(element, type, handler){
    if (element.addEventListener){
        element.addEventListener(type, handler, false);
    } else if (element.attachEvent){
        element.attachEvent("on" + type, handler);
    } else {
        element["on" + type] = handler;
    }
}