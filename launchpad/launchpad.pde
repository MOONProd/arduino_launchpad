
//import processing.sound.*;

Serial myPort;

String val;

Minim minim = new Minim(this);

void setup()                    
{
   printArray(Serial.list());
   myPort = new Serial(this, Serial.list()[3], 9600);
   size(700,700);
   background(255);
   
   in = minim.getLineIn(Minim.MONO);
   out = minim.getLineOut (Minim.STEREO);
   recorder = minim.createRecorder(in, "./file/myrecording.wav");
   
   playH_Mi = minim.loadFile("./piano_sound/H_Mi.mp3");
   playH_Re = minim.loadFile("./piano_sound/H_Re.mp3");
   playH_Ra = minim.loadFile("./piano_sound/H_Ra.mp3");
   playH_Do = minim.loadFile("./piano_sound/H_Do.mp3");
   playH_Sol = minim.loadFile("./piano_sound/H_Sol.mp3");
   playH_Pa = minim.loadFile("./piano_sound/H_Pa.mp3");
   playH_MiFlat = minim.loadFile("./piano_sound/H_MiFlat.mp3");
   playSi = minim.loadFile("./piano_sound/Si.mp3");
   playRa = minim.loadFile("./piano_sound/Ra.mp3");
   playMi = minim.loadFile("./piano_sound/Mi.mp3");
   playPa = minim.loadFile("./piano_sound/Pa.mp3");
   playRe = minim.loadFile("./piano_sound/Re.mp3");
   playSol = minim.loadFile("./piano_sound/Sol.mp3");
   playSolFlat = minim.loadFile("./piano_sound/SolFlat.mp3");
}

void draw()                    
{
  if(myPort.available() > 0) {
    key = myPort.readChar();
    force = myPort.read();
  }

  if(key == 'A'){
    noStroke();
    fill(241,95,95);
    ellipse(87.5,87.5,30,30);
    playH_Do.rewind();
    playH_Do.play();
  }
  
  if(key == 'B'){
    noStroke();
    fill(242,150,97);
    ellipse(262.5,87.5,30,30);
    playH_Re.rewind();
    playH_Re.play();
  }
  
  if(key == 'C'){
    noStroke();
    fill(242,203,97);
    ellipse(437.5,87.5,30,30);
    playH_MiFlat.rewind();
    playH_MiFlat.play();
  }
  
  if(key == 'D'){
    noStroke();
    fill(229,216,92);
    ellipse(612.5,87.5,30,30);
    playH_Mi.rewind();
    playH_Mi.play();
  }
  
  if(key == 'E'){
    noStroke();
    fill(188,229,92);
    ellipse(87.5,262.5,30,30);
    playH_Pa.rewind();
    playH_Pa.play();
  }
  
  if(key == 'F'){
    noStroke();
    fill(134,229,127);
    ellipse(262.5,262.5,30,30);
    playH_Sol.rewind();
    playH_Sol.play();
  }
  
  if(key == 'G'){
    noStroke();
    fill(92,209,229);
    ellipse(437.5,262.5,30,30);
    playH_Ra.rewind();
    playH_Ra.play();
  }
  
  if(key == 'H'){
    noStroke();
    fill(103,153,255);
    ellipse(612.5,262.5,30,30);
    playRe.rewind();
    playRe.play();
  }
  
  if(key == 'I'){
    noStroke();
    fill(107,102,255);
    ellipse(87.5,437.5,30,30);
    playMi.rewind();
    playMi.play();
  }
  
  if(key == 'J'){
    noStroke();
    fill(165,102,255);
    ellipse(262.5,437.5,30,30);
    playPa.rewind();
    playPa.play();
  }
  
  if(key == 'K'){
    noStroke();
    fill(243,97,220);
    ellipse(437.5,437.5,30,30);
    playSolFlat.rewind();
    playSolFlat.play();
  }
  
  if(key == 'L'){
    noStroke();
    fill(243,97,166);
    ellipse(612.5,437.5,30,30);
    playSol.rewind();
    playSol.play();
  }
  
  if(key == 'M'){
    noStroke();
    fill(166,166,166);
    ellipse(87.5,612.5,30,30);
    playRa.rewind();
    playRa.play();
  }
  
  if(key == 'N'){
    noStroke();
    fill(140,140,140);
    ellipse(262.5,612.5,30,30);
    playSi.rewind();
    playSi.play();
  }
  
  if(force > 120) {
    if(recorder.isRecording()){
      recorder.endRecord();
      recorded = true;
    }
    else {
      recorder.beginRecord();
    }
  }
  
  if(force < 3) {
    if(player != null) {
      player.unpatch(out);
      player.close();
    }
    player = new FilePlayer(recorder.save());
    println("Done Saving.");
    player.patch(out);
  }
}

void stop() {
  in.close();
  if(player != null){
    player.close();
  }
  minim.stop();
  
  super.stop();
}
