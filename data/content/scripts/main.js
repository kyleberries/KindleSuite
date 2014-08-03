var _={
	id:function(id,cx){return (cx||document).getElementById(id);},
	cls:function(cls,cx){return (cx||document).getElementsByClassName(cls);},
	nms:function(nm,cx){return (cx||document).getElementsByName(nm);},
	tags:function(tag,cx){return (cx||document).getElementsByTagName(tag);},
	css:function(css,cx){return (cx||document).querySelector(css);},
	csss:function(css,cx){return (cx||document).querySelectorAll(css);}
};
var wincmd=_.id('wincmd'),header=wincmd.parentNode,
	maxbtn=_.tags('a',header)[1];
for(var i=0,cmds=_.tags('a',header);i<cmds.length;i++){
	cmds[i].onclick=function(){
		this.rel=window.commands[this.rel]();
		return false;
	};
}
header.addEventListener('dblclick',function(){
	maxbtn.click();
});
window.addEventListener('mousedown',function(e){
	if(maxbtn.rel=='maximize'&&(e.target==header||~[].indexOf.call(header.childNodes,e.target))){
		window.movedrag=[e.pageX,e.pageY];
	}
});
window.addEventListener('mousemove',function(e){
	if(window.movedrag) {
		var pos=window.movedrag;
		window.frame.move(e.screenX-pos[0],e.screenY-pos[1]);
	}
});
window.addEventListener('mouseup',function(e){
	if(window.movedrag){
		window.movedrag=false;
	}
});
(function(){
	var step=10,cpu={txt:_.id('cpu_per'),graph:_.id('cpu_graph'),before:0,step:0},
		ram={used:_.id('ram_used'),total:_.id('ram_total'),per:_.id('ram_per'),graph:_.id('ram_graph'),before:0,step:0};
		sizeshow=function(byte){
			var units=['MB','GB'],result=byte,b=1024,i=0;
			while(result>b){
				i++;
				result/=b;
			}
			return result.toFixed(2)+units[i];
		};
	cpu.canvas=cpu.graph.getContext('2d');
	ram.canvas=ram.graph.getContext('2d');
	
	setInterval(function(){
		window.sysinfo.cpuUsage(function(rate){
			var per=~~(rate*100),cap=cpu.canvas.getImageData(0,0,cpu.graph.width,cpu.graph.height);
			//console.log(cpu.step+'/'+cap.width);
			cpu.txt.innerHTML=per+'%';
			if((cpu.step+step)>cap.width){
				var min=(cpu.step+step)-cap.width;
				cpu.canvas.clearRect(0,0,cap.width,cap.height);
				cpu.canvas.putImageData(cap,-step,0);
				cpu.step-=step;
			}
			cpu.canvas.strokeStyle='green';
			cpu.canvas.beginPath();
			cpu.canvas.moveTo(cpu.step,100-cpu.before);
			cpu.canvas.lineTo((cpu.step+=step),100-per);
			cpu.canvas.stroke();
			cpu.canvas.closePath();
			cpu.before=per;
		});
		_.id('stat_txt').innerHTML='System Uptime : '+(function(time){
			var result='',units=['seconds','minutes','hours','days'],times={days:0,hours:0,minutes:0,seconds:~~time};
			for(var i=0,len=units.length;i<len;i++){
				if(i+1>=len) break;
				var t=i==3?24:60,u=units[i],n=units[i+1];
				if(times[u]>=t){
					times[n]=~~(times[u]/t);
					times[u]%=t;
				}
				result=times[u]+' '+(times[u]==1?u.replace(/s$/,''):u)+' '+result;
			}
			return result;
		})(window.sysinfo.sysUptime());
		_.id('os_txt').innerHTML=window.sysinfo.platform();
		var totalram=+window.sysinfo.totalmem(),usedram=totalram-window.sysinfo.freemem(),ramper=~~(usedram/totalram*100),
			cap=ram.canvas.getImageData(0,0,ram.graph.width,ram.graph.height);
		ram.used.innerHTML=sizeshow(usedram);
		ram.total.innerHTML=sizeshow(totalram);
		ram.per.innerHTML=ramper;
		if((ram.step+step)>cap.width){
			var min=(ram.step+step)-cap.width;
			ram.canvas.clearRect(0,0,cap.width,cap.height);
			ram.canvas.putImageData(cap,-step,0);
			ram.step-=step;
		}
		ram.canvas.strokeStyle='green';
		ram.canvas.beginPath();
		ram.canvas.moveTo(ram.step,100-ram.before);
		ram.canvas.lineTo((ram.step+=step),100-ramper);
		ram.canvas.stroke();
		ram.canvas.closePath();
		ram.before=ramper;
	},1000);
}).call(null);

window.addEventListener('contextmenu',function(e){e.preventDefault();});