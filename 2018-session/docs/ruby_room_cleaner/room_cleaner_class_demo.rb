# room = "bedroom"

rooms = ["bedroom", "kitchen", "bathroom", "livingroom"]

def clean_house(rooms)
  rooms.each do |room|
    clean_room(room)
  end
end

def clean_room(room)
  if room == "bedroom" # the room is a bedroom
    make_bed
    vacuum(room)
  elsif room == "kitchen"
    mop_floor
  else
    puts "This room doesn't require any special processes."
  end
  dust(room)
  puts "The " + room + " has been cleaned!"
end

def make_bed
  puts "The beds have been made."
end

def vacuum(room)
  puts "The #{room} has been vacuumed."
end

def dust(room)
  puts "The #{room} has been dusted!"
end

def mop_floor
  puts "The floor has been mopped."
end

clean_house(rooms)

# def clean_rooms(room, other_room)
#   puts "The " + room + " has been cleaned!"
#   puts "The " + other_room + " has been cleaned!"
# end


# def add_two_numbers
#   5 + 3
# end

# def add_two_numbers(num_1, num_2)
#   puts num_1 + num_2
#   num_1 + num_2
# end

# def add_two_numbers(num_1, num_2)
#   if (num_1 + num_2) > 0
#     num_1 + num_2
#   else
#     puts "The result is negative."
#   end
# end







