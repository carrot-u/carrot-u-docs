def mop_floor
  puts "The floor has been mopped."
end

def clean_toilet
  puts "The toilet has been cleaned"
end

def wash_dishes
  puts "The dishes have been washed."
end

def make_bed
  puts "The beds have been made."
end

def vaccuum(room)
  puts "The #{room} has been vacuumed."
end

def dust(room)
  puts "The #{room} has been dusted."
end

def clean_room(room)
  if room == "bedroom"
    vaccuum(room)
    make_bed
  elsif room == "kitchen"
    mop_floor
    wash_dishes
  elsif room == "bathroom"
    mop_floor
    clean_toilet
  else
    puts "The #{room} requires no specific cleaning processes."
  end

  dust(room)
  puts "The #{room} has been cleaned."
  puts "*" * 40
  puts "\n"
  sleep(1)
end

def clean_house(rooms)
  rooms.each do |room|
    clean_room(room)
  end
end

rooms = ["water closet", "parlor", "study", "kitchen", "bathroom", "livingroom", "bedroom"]

clean_house(rooms)
