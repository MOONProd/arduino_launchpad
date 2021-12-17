import ddf.minim.*;
import ddf.minim.ugens.*;

import processing.serial.*;

AudioInput in;
AudioRecorder recorder;
FilePlayer player;
AudioOutput out;
boolean recorded;

AudioPlayer playH_Mi;   
AudioPlayer playH_Re; 
AudioPlayer playH_Ra; 
AudioPlayer playH_Do; 
AudioPlayer playH_Sol;
AudioPlayer playH_Pa;
AudioPlayer playH_MiFlat;
AudioPlayer playSi;
AudioPlayer playRa;
AudioPlayer playMi;
AudioPlayer playPa;
AudioPlayer playRe;
AudioPlayer playSol;
AudioPlayer playSolFlat;

int H_Do;
int H_Re;
int H_MiFlat;
int H_Mi;
int H_Pa;
int H_Sol;
int H_Ra;

int Re;
int Mi;
int Pa;
int SolFlat;
int Sol;
int Ra;
int Si;

int force;
