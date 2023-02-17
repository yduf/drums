\version "2.18.0"
% Exercise from [Développez votre repère rythmique ! Cédric Hilaire](https://youtu.be/WzqY9P0no8M?list=PLh9akXp2EH2C6RTdD0seakR16MFHay1We)

% Core
%     Snare Drum:     snare           sn
%     Side Stick:     sidestick       ss
%     Bass Drum:      bassdrum        bd
%     Hi Hat:         hihat           hh
%     Stepped Hi Hat: pedalhihat      hhp
%     Ride Cymbal:    ridecymbal      cymr
    
% 4 piece kit
%     Rack Tom:       hightom         tomh
%     Floor Tom:      lowtom          toml
    
% 5 piece kit
%     High Rack Tom:  highmidtom      tommh
%     Low Rack Tom:   lowmidtom       tomml
%     Floor Tom:      highfloortom    tomhf

% Cymbals
%     Crash:          crashcymbal     cymcr
%     Splash:         splashcymbal    cymsp
%     China:          chinesecymbal   cymch
%     Bell of ride:   ridebell        rb

\paper {
  indent = #0
  ragged-right = ##f
  ragged-bottom = ##t
}


#(define mydrums '(
                    ( ridecymbal    cross    #f   5)	
                    ( ridecymbala   xcircle  #f   5)
                    ( crashcymbal   cross    #f   6)	
                    ( splashcymbal  harmonic #f   6)
                    ( pedalhihat    cross    #f  -5)	
                    ( hihat         cross    #f   5)
                    ( snare         default  #f   1)	
                    ( sidestick     cross    #f   1)
                    ( lowmidtom     default  #f   2)	
                    ( lowtom        default  #f  -1)
                    ( hightom       default  #f   3)	
                    ( bassdrum      default  #f  -3)))

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))

up = \drummode { 
% Stems Up notes go here
  hh8[ hh] <hh sn>[ hh] hh[ hh] <hh sn>[ hh]
  \makePercent s1
  \makePercent s1
  hh8[ hh] <hh sn>[ hh] hh[ hh] 
  toml16[ toml toml toml]

  \break
  hh8[ hh] <hh sn>[ hh] hh[ hh] <hh sn>[ hh]
  \makePercent s1
  \makePercent s1
  hh8[ hh] <hh sn>[ hh] 
  tomml16[ tomml tomml tomml]
  toml16[ toml toml toml]

  \break
  hh8[ hh] <hh sn>[ hh] hh[ hh] <hh sn>[ hh]
  \makePercent s1
  \makePercent s1
  hh8[ hh] 
  tomh16[ tomh tomh tomh]
  tomml16[ tomml tomml tomml]
  toml16[ toml toml toml]

  \break
  hh8[ hh] <hh sn>[ hh] hh[ hh] <hh sn>[ hh]
  \makePercent s1
  \makePercent s1
  sn16[ sn16 sn16 sn16]
  tomh16[ tomh tomh tomh]
  tomml16[ tomml tomml tomml]
  toml16[ toml toml toml]
}

down = \drummode { 
% Stems Down notes go here
  bd4 r4 bd8[ bd] r4
  \makePercent s1
  \makePercent s1
  bd4 r4 bd8[ bd] r4

  \break
  bd4 r4 bd8[ bd] r4
  \makePercent s1
  \makePercent s1
  bd4 r4 r4 r4

  \break
  bd4 r4 bd8[ bd] r4
  \makePercent s1
  \makePercent s1
  bd4 r4 r4 r4

  \break
  bd4 r4 bd8[ bd] r4
  \makePercent s1
  \makePercent s1
  r4 r4 r4 r4
}

\drums
{ <<
\set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
\numericTimeSignature 
      \new DrumVoice { \voiceOne \up }
      \new DrumVoice { \voiceTwo \down }
    >>
}