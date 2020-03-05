#Global parameterized functions
define :n do |n, s|
  play n, sustain: s*0.8
  sleep s
end
define :n2 do |n, n2, s|
  play n, sustain: s*0.8
  play n2, sustain: s*0.8
  sleep s
end
define :n3 do |n, n2, n3, s|
  play n, sustain: s*0.8
  play n2, sustain: s*0.8
  play n3, sustain: s*0.8
  sleep s
end
define :s do |sleepTime|
  sleep sleepTime
end
define :playArray do |noteArray, sleepArray|
  i=0
  noteArray.length.times do
    n noteArray[i], sleepArray[i]
    i+=1
  end
end
define :arpeggio do |noteArray,travelTime, sust|
  iterations = noteArray.length;
  in_thread do
    iterations.times do
      delayTime = travelTime/iterations
      play noteArray[tick]#, release: (sust-delayTime) * 0.7
      sleep delayTime
    end
  end
  sleep sust
end
define :cchord do |noteArray, sust|
  play_pattern_timed noteArray, 0
  sleep sust
end
#samples for the first song
gummibear = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/gummy bear.wav"
wiisports = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/wiisports intro.wav"
sfrog = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/beats/crazy frog A.wav"
sshakira = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/beats/shakira A.wav"


#declare variables
use_bpm 120
measureTime = 4
sampleTime = 16

#play the first song
print "first song beginning"
sample gummibear
sleep sample_duration gummibear
sample wiisports
sleep 3.5
live_loop :frogbass do
  3.times do
    sample sfrog, amp: 2
    sleep sampleTime
  end
  print "frog finished"
  stop
end
#sleep sampleTime

live_loop :shakirabass do
  4.times do
    sample sshakira
    sleep sampleTime
  end
  print "shakira finished"
  stop
end
#sleep sampleTime

use_synth :saw
use_synth_defaults amp: 0.2, release: 0.2, attack: 0

#measure 1
n2 :d4, :fs4, 1
define :chorusmajority do
  n2 :fs4, :a4, 0.5
  n2 :a4, :cs5, 0.5
  s 0.5
  n2 :fs4, :a4, 0.5
  s 0.5
  n2 :d4, :fs4, 0.5
end
chorusmajority

#measure 2
n :d4, 0.5
n :d4, 0.5
n :d4, 0.5
s 0.5
s 1
s 0.5
n :cs4, 0.5

#measure 3
n :d4, 0.5
n2 :d4, :fs4, 0.5
chorusmajority

#measure 4
n3 :e5, :gs4, :e4, 1.5
n3 :eb5, :g4, :eb4, 0.5
n3 :d5, :fs4, :d4, 1
s 1

#measure 5
n :gs4, 1
n :cs5, 0.5
n :fs4, 0.5
s 0.5
n :cs5, 0.5
s 0.5
n :gs4, 0.5

#measure 6
s 0.5
n :cs5, 0.5
s 0.5
n :g4, 0.5
n :fs4, 0.5
s 0.5
n2 :cs4, :e4, 0.5
s 0.5

#measure 7
n3 :e4, :c4, :fs3, 0.5
n3 :e4, :c4, :fs3, 0.5
n3 :e4, :c4, :fs3, 0.5
s 1.5
n3 :e4, :c4, :fs3, 0.5
n3 :e4, :c4, :fs3, 0.5

#measure 8
n3 :e4, :c4, :fs3, 0.5
s 1.5
n3 :ds4, :b3, :gs3, 1
n3 :d4, :bb3, :g3, 1

#measure 9
n3 :cs4, :a3, :fs3, 1
n2 :fs4, :a4, 0.5
n2 :a4, :cs5, 0.5
s 0.5
n2 :fs4, :a4, 0.5
s 0.5
n2 :ds4, :fs4, 0.5

#measure 10
n2 :d4, :e4, 0.5
n2 :d4, :e4, 0.5
n2 :d4, :e4, 0.5
s 0.5
n2 :e4, :gs4, 0.5
n2 :e4, :gs4, 0.5
n2 :e4, :gs4, 0.5
s 0.5

#measure 11
sleep 0.5
n2 :d4, :fs4, 0.5
chorusmajority

#measure 12
n3 :cs5, :gs4, :e4, 2
n3 :b4, :fs4, :d4, 1
s 1
#FROG STOPS HERE

#measure 13
n :b4, 0.5
n :g4, 0.5
n :d4, 0.5
n :cs4, 1
n :b4, 0.5
n :g4, 0.5
n :cs4, 0.5

#measure 14
n :a4, 0.5
n :fs4, 0.5
n :c4, 0.5
n :b3, 1
n :f4, 0.5
n :d4, 0.5
n :b3, 0.5

#measure 15
n3 :e4, :cs4, :b3, 0.5
n3 :e4, :cs4, :b3, 0.5
n3 :e4, :cs4, :b3, 0.5
s 2
n :as4, 0.5

#measure 16
n :b4, 0.5
n :cs5, 0.5
n :d5, 0.5
n :fs5, 0.5
n :a5, 1
s 1


live_loop :shakirabass do
  2.times do
    sample sshakira
    sleep sampleTime
  end
  print "shakira2 finished"
  stop
end

#initialize variables for song1-2 transition
#FUNKY song 1 to song 2 transition
menatwork1 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/beats/menatwork 1 D.wav"
menatwork2 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/beats/menatwork 2 D.wav"
siren = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/storm siren.wav"
rap1 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/rap/rap1.wav"
rap2 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/rap/rap2.wav"
rap3 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/rap/rap3.wav"
rap4 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/rap/rap4.wav"
rap5 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/rap/rap5.wav"
rap6 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/rap/rap6.wav"
raps = [rap1, rap2, rap3, rap4, rap5, rap6]
#The men at work bass will fade in before becoming the norm
#funkyamp will increase (funky transition)

print "Transition 1-2"
funkyAmp = 0.2
EndLoops = false
live_loop :funkybass do
  sample menatwork1, amp: funkyAmp
  #play random rap sample
  chosenSample = dice(raps.length)-1
  sample raps[chosenSample], amp: 0.6
  sleep sampleTime
  if (funkyAmp < 1) then
    funkyAmp += 0.2
  end
  #if the second song has started playing, stop
  if (EndLoops == true) then
    stop
  end
end
sleep sampleTime*2

live_loop :storm_siren do
  sample siren, amp: 1
  stop
end
sleep sampleTime

print "song 2 beginning"
live_loop :part2bassline do
  with_fx :bitcrusher, mix: 0 do
    4.times do
      sample menatwork2
      sleep 16
    end
    1.times do
      sample menatwork2
      sample menatwork1
      sleep 16
    end
    sample menatwork2
    sample menatwork1
    sleep 16
    fadeamp = 1
    fadeout = sample menatwork2, amp: fadeamp, amp_slide: 0.0625
    fadeout2 = sample menatwork1, amp: fadeamp, amp_slide: 0.0625
    while (fadeamp > 0) do
        #will slowly fade out the amps at a linear rate of -0.0625 per 1/2 a second
        control fadeout, amp: fadeamp
        control fadeout2, amp: fadeamp
        sleep 1
        fadeamp -= 0.0625
        print "amp for song 2 fadeout: "
        print fadeamp
      end
    end
    stop
  end
  
  use_synth :fm
  live_loop :breakbotChords do
    use_synth_defaults amp: 0.6
    define :breakbotChords1 do
      arpeggio [:bb3, :c4, :d4, :f4], 0.5, 3
      cchord [:bb3, :c4, :d4, :f4], 0.75
      cchord [:a3, :cs4, :e4, :g4], 4.25
      2.times do
        cchord [:a4, :f4, :d4], 0.75
        cchord [:g4, :e4, :c4], 0.25
        s 0.5
        cchord [:f4, :d4, :bb3], 2.5
      end
    end
    breakbotChords1
    #measure 5
    cchord [:bb3, :c4, :d4, :f4], 3
    n :f4, 0.25
    n :g4, 0.25
    n :a4, 0.25
    cchord [:a3, :cs4, :e4, :g4], 4.25
    
    cchord [:a4, :f4, :d4], 0.75
    cchord [:g4, :e4, :c4], 0.25
    s 0.5
    cchord [:f4, :d4, :a3], 2.5
    
    cchord [:a4, :f4, :d4], 0.75
    cchord [:g4, :e4, :c4], 0.25
    s 0.5
    cchord [:f4, :d4, :b3], 2.5
    
    #measure 9
    breakbotChords1
    
    #measure 13
    cchord [:bb3, :c4, :d4, :f4], 3
    cchord [:bb3, :c4, :d4, :f4], 0.75
    cchord [:a3, :cs4, :f4, :g4], 4.25
    2.times do
      cchord [:a4, :f4, :d4], 0.75
      cchord [:g4, :e4, :c4], 0.25
      s 0.5
      cchord [:f4, :d4, :a3], 2.5
    end
    #measure 17
    2.times do
      cchord [:a4, :f4, :d4], 0.75
      cchord [:g4, :e4, :c4], 0.25
      s 0.5
      cchord [:a4, :f4, :d4], 2
      cchord [:f4, :d4, :bb3], 2
      
      cchord [:g4, :e4, :c4], 2
      s 0.5
    end
    cchord [:a4, :f4, :d4], 0.75
    cchord [:g4, :e4, :c4], 0.25
    s 0.5
    cchord [:a4, :f4, :d4], 2
    cchord [:a4, :f4, :d4, :bb3], 2 #Crosses over to next measure
    #measure 22-24
    cchord [:g4, :e4, :c4, :g3], 2
    cchord [:a4, :f4, :d4], 2
    
    cchord [:f4, :d4, :a3], 2
    cchord [:f4, :d4, :bb3], 4.5
    
    stop
  end
  
  #measures 1-25
  use_synth_defaults amp: 0.5
  
  #Stop the FUNKY transition rap loops
  EndLoops = true
  #measures 1-4
  s 0.5
  7.times do
  n :f5, 0.5 end
  
  breakbotMelodyArray = [:g5,:a5, :r,   :g5,  :a5, :bb5, :a5, :g5, :g5, :f5,:r,:g5, :a5, :bb5, :a5, :g5, :g5,:f5, :r]
  breakbotSleepArray = [0.75, 0.5, 2.25, 0.5, 0.5, 0.25, 0.5, 0.5, 0.5,0.25,1, 0.5, 0.5, 0.25, 0.5, 0.5, 0.5,0.25, 1.5]
  playArray breakbotMelodyArray, breakbotSleepArray
  
  #measures 5-8
  breakbotMelodyArray = [:r,:a5,:d5,:d5,:f5, :r,  :f5,:a5,:g5,:g5,:e5, :d5, :c5,:r,:c6,:a5,:a5,:g5,:a5,:r,   :c6,:a5,:a5,:g5,:a5,:r]
  breakbotSleepArray = [0.5,0.5,0.5,0.25,0.5,0.75,0.5,0.5,0.5,0.5,0.75,0.75,0.5,1, 0.5,0.5,0.5,0.25,1,1.25, 0.5,0.5,0.5,0.25,1,1.25]
  playArray breakbotMelodyArray, breakbotSleepArray
  
  #measures 9-12
  s 0.5
  7.times do
  n :f5, 0.5 end
  
  breakbotMelodyArray = [:g5,:a5, :r,     :a5, :bb5, :a5, :g5, :g5, :f5,:r, :a5, :bb5, :a5, :g5, :g5,:f5, :r]
  breakbotSleepArray = [0.75, 0.5, 2.75, 0.5, 0.25, 0.5, 0.5, 0.5,0.25,1.5, 0.5, 0.25, 0.5, 0.5, 0.5,0.25, 1.5]
  playArray breakbotMelodyArray, breakbotSleepArray
  
  #measures 13-16
  breakbotMelodyArray = [:r,:d5,:d5,:e5,:f5,:a5, :r,:a5,:g5,:g5,:e5, :d5, :c5,:r,:c6,:a5,:a5,:g5,:a5,:r,   :c6,:a5,:a5,:g5,:a5, :r,   :a5, :f5]
  breakbotSleepArray = [0.5,0.5,0.5,0.25,0.5,1, 0.25,0.5,0.5,0.5,0.75,0.75,0.5,1, 0.5,0.5,0.5,0.25,0.5,1.75, 0.5,0.5,0.5,0.25,0.5,0.75, 0.5, 0.5]
  playArray breakbotMelodyArray, breakbotSleepArray
  
  #measures 17-21
  breakbotMelodyArray = [:g5,:a5,:r,:d5,:bb5,:a5,:g5,:a5,:f5,:d5,:r,:d5,:d5,:bb5,:a5,:g5,:a5,:d5,:r,:d5]
  breakbotSleepArray = [0.5,0.5, 2.5,0.5,1,1,1,1,0.5,0.5,2,0.5,0.5,1,1,1,1,1,2.5,0.5]
  playArray breakbotMelodyArray, breakbotSleepArray
  
  #measures 22-24
  breakbotMelodyArray = [:bb5,:a5,:g5,:a5,:f5,:d5,:r,:d5,:e5,:f5,:g5,:a5,:c6,:a5,:a5,:g5,:a5,:a5,:a5]
  breakbotSleepArray = [1,1,1,1,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.75,0.75,0.5]
  playArray breakbotMelodyArray, breakbotSleepArray
  sleep 8
  
  #initialize song 3 variables
  wiiresort1 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/wii resort 1.wav"
  wiiresort2 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/wii resort 2.wav"
  scream1 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/screaming 1.wav"
  scream2 = "C:/Users/charles_nott/Desktop/FINAL custom clean/samples/sfx/screaming 2.wav"
  
  print "transitioning to song 3"
  sample wiiresort1, amp: 3
  sleep sample_duration wiiresort1
  sample wiiresort2, amp: 3
  songOver = false
  impalabassamp = 0.2
  
  print "playing song 3"
  define :playArrayImpala do |noteArray, sleepArray|
    i=0
    noteArray.length.times do
      use_synth_defaults amp: impalabassamp, release: 1
      if (impalabassamp <= 0) then
        use_synth_defaults amp: 0, release: 1
      end
      n noteArray[i], sleepArray[i]
      print i
      i+=1
    end
  end
  live_loop :impalabassloop do
    define :impalabass do
      use_synth :chiplead
      
      #measure 1
      impalaNoteArray = [:cs3,:cs3,:cs3,:cs4,:ds4,:cs4]
      impalaSleepArray = [0.75,0.25,1,0.1,0.9,1]
      playArrayImpala impalaNoteArray, impalaSleepArray
      
      #measure 2
      impalaNoteArray = [:cs3, :cs4, :ds4, :cs4, :ds4, :cs4,:b3]
      impalaSleepArray = [1, 0.1, 0.9, 0.1, 0.4,0.5,1]
      playArrayImpala impalaNoteArray, impalaSleepArray
      
      #measure 3
      impalaNoteArray = [:e3, :e3, :e3, :e4, :fs4, :e4]
      impalaSleepArray = [0.75, 0.25, 1, 0.1, 0.9, 1]
      playArrayImpala impalaNoteArray, impalaSleepArray
      
      #measure 4
      impalaNoteArray = [:e3, :cs4, :ds4, :cs4, :ds4, :cs4,:b3,:gs3]
      impalaSleepArray = [1, 0.1, 0.9, 0.1, 0.4, 0.5,0.5,0.5]
      playArrayImpala impalaNoteArray, impalaSleepArray
      #16 sleeps total
    end
    impalabass
    if (songOver == true) then
      sample siren, start: 1, finish: 0, amp: 0.1
      live_loop :fadeimpala do
        impalabassamp -= 0.01
        print "amp for fading bassline: "
        print impalabassamp
        if (impalabassamp <= 0) then
          print "Song Over"
          stop
        end
        sleep 1
      end
      while (impalabassamp > 0) do
          impalabass
        end
        print "Song ending"
        stop
      end
    end
    sample scream1, amp: 2
    sleep 32
    sample scream2, amp: 0.6
    sleep sample_duration  scream2
    songOver = true