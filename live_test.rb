
#### TOOLS

def piano
  live_loop :piano do
    sync :tick
    3.times do
      sample :ambi_piano, rate: 1
      sleep 2
    end
    
    sample :ambi_piano, rate: 1
    sleep 1
    
    sample :ambi_piano, rate: 0.9
    sleep 1
  end
end

#### DRUMS
def boom
  live_loop :boom do
    sync :tick
    with_fx :flanger, depth: 0.5, amp: 1, delay: 0.2 do
      sample :bd_haus, amp: 2, rate: 1
    end
  end
end

def hit
  live_loop :hithat do
    sync :tick
    sleep 1.75
    sample :elec_hi_snare, rate: 1
    sleep 0.25
  end
end

#### SYNTHS
def dsaw(note, sleep)
  synth :dsaw, note: note
  sleep sleep
end

def pro
  counter = 0
  live_loop :pro do
    sync :tick
    use_synth :prophet
    play(scale :e3, :minor)[counter % 4], release: 8, cutoff: rrand(70, 130)
    counter += 1
    sleep 4
  end
end

##### LIVE

in_thread do
  loop do
    cue :tick
    sleep 0.5
  end
end

boom
hit
pro