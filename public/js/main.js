/* Copyright 2013 Chris Wilson 
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
	window.audio = new Audio();
const volumeSlider = document.getElementById('volume-slider');

const outputContainer = document.getElementById('volume-output');
	const durationContainer = document.getElementById('duration');
	const playIconContainer = document.getElementById('play-icon');
	const seekSlider = document.getElementById('seek-slider');
const currentTimeContainer = document.getElementById('current-time');
	var playState="pause";




	const calculateTime = (secs) => {
  const minutes = Math.floor(secs / 60);
  const seconds = Math.floor(secs % 60);
  const returnedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`;
  return `${minutes}:${returnedSeconds}`;
}
const displayDuration = () => {
  durationContainer.textContent = calculateTime(window.audio.duration);
}

if (window.audio.readyState > 0) {
  displayDuration();
  setSliderMax();
} else {
  window.audio.addEventListener('ended', () => {

//	  if (window.audio && !window.audio.paused){
//            window.audio.pause();
//	  }
//  window.audio.currentTime=0;
//  seekSlider.value = Math.floor(window.audio.currentTime);
//
//    playState = 'pause';
//    playIconContainer.innerHTML =(playIconContainer.dataset.play);

  });
  window.audio.addEventListener('loadedmetadata', () => {

  if(playState === 'pause') {
	  if (window.audio && !window.audio.paused){
            window.audio.pause();
	  }
	  //window.audio.currentTime=0;
  seekSlider.value = 0;
    displayDuration();
  setSliderMax();
    window.audio.play();
    playState = 'play';

    playIconContainer.innerHTML=(playIconContainer.dataset.pause);
  } else {
	  if (window.audio && !window.audio.paused){
            window.audio.pause();
	  }
    displayDuration();
  setSliderMax();

    playState = 'pause';
    playIconContainer.innerHTML =(playIconContainer.dataset.play);

  }
  });
}


const setSliderMax = () => {
  seekSlider.max = Math.floor(window.audio.duration);
}






playIconContainer.addEventListener('click', () => {
  if(playState === 'pause') {
    window.audio.play();
    playState = 'play';

    playIconContainer.innerHTML=(playIconContainer.dataset.pause);
  } else {
	  if (window.audio && !window.audio.paused){
            window.audio.pause();
	  }

    playState = 'pause';
    playIconContainer.innerHTML =(playIconContainer.dataset.play);

  }
});
window.audio.addEventListener('timeupdate', () => {
  seekSlider.value = Math.floor(window.audio.currentTime);
  currentTimeContainer.textContent = calculateTime(seekSlider.value);
});


seekSlider.addEventListener('input', () => {

  window.audio.currentTime = seekSlider.value;


  if(!window.audio.paused) {
	  whilePlaying();
  }
});

seekSlider.addEventListener('change', () => {
  window.audio.currentTime = seekSlider.value;



  if(!window.audio.paused) {
	  whilePlaying();
  }
});
const whilePlaying = () => {
  seekSlider.value = Math.floor(window.audio.currentTime);
  currentTimeContainer.textContent = calculateTime(seekSlider.value);
}


volumeSlider.addEventListener('input', (e) => {
  const value = e.target.value;

  outputContainer.textContent = value;
  window.audio.volume = value / 100;
});
const muteIconContainer = document.getElementById('mute-icon');

muteIconContainer.addEventListener('click', () => {
  if(muteState === 'unmute') {
    muteAnimation.playSegments([0, 15], true);
    window.audio.muted = true;
    muteState = 'mute';
  } else {
    muteAnimation.playSegments([15, 25], true);
    window.audio.muted = false;
    muteState = 'unmute';
  }
});
function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
} 

const mymic=document.getElementById("record");
if (mymic){
window.AudioContext = window.AudioContext || window.webkitAudioContext;

var audioContext = new AudioContext();
audioContext.sinkId=$("#toselectoutput").html();
var audioInput = null,
    realAudioInput = null,
    inputPoint = null,
    audioRecorder = null;

var rafID = null;
var analyserContext = null;
var canvasWidth, canvasHeight;
var recIndex = 0;

/* TODO:

- offer mono option
- "Monitor input" switch
*/

function saveAudio() {
    audioRecorder.exportWAV( doneEncoding );
    // could get mono instead by saying
    // audioRecorder.exportMonoWAV( doneEncoding );
}

function gotBuffers( buffers ) {
    var canvas = document.getElementById( "wavedisplay" );

    drawBuffer( canvas.width, canvas.height, canvas.getContext('2d'), buffers[0] );

    // the ONLY time gotBuffers is called is right after a new recording is completed - 
    // so here's where we should set up the download.
    audioRecorder.exportWAV( doneEncoding );
}

function doneEncoding( blob ) {
    Recorder.setupDownload( blob, "myRecording" + ((recIndex<10)?"0":"") + recIndex + ".wav" );
    if (!($("#playit")[0])){
      $("#controls").append("<audio id=\"playit\" src=\"\" controls></audio>");
    }
    document.getElementById("playit").src=document.getElementById("save").href;
    recIndex++;
    var url=URL.createObjectURL(blob);
    var recordingblog=null;
    var formData=new FormData($("#myform")[0]);
    var recording=new Blob([blob]);
    formData.append("recording",recording);
    formData.append("accompaniment_id",$("[name=myaccomp]:checked").val());
    formData.append("partonly",($("[name=recordpart]")[0].checked ? "1" : "0"));
	if ($(".slider").hasClass("micro")){
    formData.append("micro",("1"));
	}else{
    formData.append("micro",("0"));
	}
   
    $.ajax({type:"POST",url:"/audio/save/"+$("#myid").html(),
    processData: false,
    contentType: false,
       data: formData,
       success:function(data){
           $("#text").html(data);
          document.getElementById("overlay").style.display = "block";
           
       }
     });
}

function toggleRecording( e ) {
    if (e.classList.contains("recording")) {
        // stop recording
        audioRecorder.stop();
        
        e.classList.remove("recording");
        audioRecorder.getBuffers( gotBuffers );
        try{
            

            window.myaccompaniment.pause();}catch(e){console.log(e);}
    } else {
        // start recording
        if (!audioRecorder)
            return;
        if (!mymic)
            return;
        e.classList.add("recording");
        audioRecorder.clear();
        audioRecorder.record();
        try{
        console.log($("#myaccompaniment"+String($("[name=myaccomp]:checked")[0].value))[0].src);
        window.myaccompaniment=$("#myaccompaniment"+String($("[name=myaccomp]:checked")[0].value))[0].parentElement;
        //window.myaccompaniment=new Audio($("#myaccompaniment"+String($("[name=myaccomp]:checked")[0].value))[0].src);
            window.myaccompaniment.currentTime = 0;
		
        window.myaccompaniment.setSinkId($("#toselectoutput").html())
                .then(function(){
                    window.myaccompaniment.play();
        });
		
            
    }catch(e){console.log(e);
    }
    
    }
}

function convertToMono( input ) {
    var splitter = audioContext.createChannelSplitter(2);
    var merger = audioContext.createChannelMerger(2);

    input.connect( splitter );
    splitter.connect( merger, 0, 0 );
    splitter.connect( merger, 0, 1 );
    return merger;
}

function cancelAnalyserUpdates() {
    window.cancelAnimationFrame( rafID );
    rafID = null;
}

function updateAnalysers(time) {
    if (!analyserContext) {
        var canvas = document.getElementById("analyser");
        canvasWidth = canvas.width;
        canvasHeight = canvas.height;
        analyserContext = canvas.getContext('2d');
    }

    // analyzer draw code here
    {
        var SPACING = 3;
        var BAR_WIDTH = 1;
        var numBars = Math.round(canvasWidth / SPACING);
        var freqByteData = new Uint8Array(analyserNode.frequencyBinCount);

        analyserNode.getByteFrequencyData(freqByteData); 

        analyserContext.clearRect(0, 0, canvasWidth, canvasHeight);
        analyserContext.fillStyle = '#F6D565';
        analyserContext.lineCap = 'round';
        var multiplier = analyserNode.frequencyBinCount / numBars;

        // Draw rectangle for each frequency bin.
        for (var i = 0; i < numBars; ++i) {
            var magnitude = 0;
            var offset = Math.floor( i * multiplier );
            // gotta sum/average the block, or we miss narrow-bandwidth spikes
            for (var j = 0; j< multiplier; j++)
                magnitude += freqByteData[offset + j];
            magnitude = magnitude / multiplier;
            var magnitude2 = freqByteData[i * multiplier];
            analyserContext.fillStyle = "hsl( " + Math.round((i*360)/numBars) + ", 100%, 50%)";
            analyserContext.fillRect(i * SPACING, canvasHeight, BAR_WIDTH, -magnitude);
        }
    }
    
    rafID = window.requestAnimationFrame( updateAnalysers );
}

function toggleMono() {
    if (audioInput != realAudioInput) {
        audioInput.disconnect();
        realAudioInput.disconnect();
        audioInput = realAudioInput;
    } else {
        realAudioInput.disconnect();
        audioInput = convertToMono( realAudioInput );
    }

    audioInput.connect(inputPoint);
}

function gotStream(stream) {
    inputPoint = audioContext.createGain();
    // Create an AudioNode from the stream.
    let newStream = new MediaStream(stream.getTracks());
    console.log(stream.getTracks(),stream,newStream);
    let audioTrack = newStream.getAudioTracks()[0];
    let audioTracks = newStream.getAudioTracks();
    
    console.log(audioTracks);
    newStream.removeTrack(audioTrack);
    console.log(newStream.getTracks());
    
    //realAudioInput = audioContext.createMediaStreamSource(newStream);
    realAudioInput = audioContext.createMediaStreamSource(stream);
    audioInput = realAudioInput;
    audioInput.connect(inputPoint);

//    audioInput = convertToMono( input );

    analyserNode = audioContext.createAnalyser();
    analyserNode.fftSize = 2048;

    inputPoint.connect( analyserNode );

    audioRecorder = new Recorder( inputPoint );

    zeroGain = audioContext.createGain();
    zeroGain.gain.value = 0.0;
    inputPoint.connect( zeroGain );
    zeroGain.connect( audioContext.destination );
    updateAnalysers();
}

function initAudio() {
        if (!navigator.getUserMedia)
            navigator.getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
        if (!navigator.cancelAnimationFrame)
            navigator.cancelAnimationFrame = navigator.webkitCancelAnimationFrame || navigator.mozCancelAnimationFrame;
        if (!navigator.requestAnimationFrame)
            navigator.requestAnimationFrame = navigator.webkitRequestAnimationFrame || navigator.mozRequestAnimationFrame;
/*  {
            "audio": {
                "mandatory": {
                    "googEchoCancellation": "false",
                    "googAutoGainControl": "false",
                    "googNoiseSuppression": "false",
                    "googHighpassFilter": "false",
                    "deviceId": $("#my_devices").val(),
                },
                
                "optional": []
            },*/

        if (!navigator.mediaDevices?.enumerateDevices) {
  console.log("enumerateDevices() not supported.");
} else {
     navigator.getUserMedia(
        {
            "audio": {
                 
                mandatory:{
                    "googEchoCancellation": "false",
                    "googAutoGainControl": "false",
                    "googNoiseSuppression": "false",
                    "googHighpassFilter": "false",
                    "suppressLocalAudioPlayback":"false",
                    "deviceId": $("#toselect").html(),
                   
            channelCount: 2,
                    }
                
            },
        }, gotStream, function(e) {
            alert('Error getting audio');
            console.log(e);
        });
  // List cameras and microphones.
		 navigator.mediaDevices
    .enumerateDevices()
    .then((devices) => {
	    function adddevice(device){
        console.log(`${device.kind}: ${device.label} id = ${device.deviceId}`);
        if (device.kind === 'audiooutput'){
                              $("#my_devices_output").prepend("<option value=\""+String(device.deviceId)+"\">"+String(device.kind)+" "+String(device.label)+"</option>")
                              } else if(device.kind === 'audioinput') {
                  $("#my_devices").prepend("<option value=\""+String(device.deviceId)+"\">"+String(device.kind)+" "+String(device.label)+"</option>")
                                  
                              }
                              
        
	    }


	    const orderPromisses = devices.map(device => adddevice(device));
         Promise.all(orderPromisses).then(arrayOfResponses => {
             // do your stuff
             $("#my_devices").val($("#toselect").html());
             $("#my_devices_output").val($("#toselectoutput").html());
   
         })




    })
    .catch((err) => {
      console.error(`${err.name}: ${err.message}`);
    });

}
        
}


window.addEventListener('load', initAudio );
}
