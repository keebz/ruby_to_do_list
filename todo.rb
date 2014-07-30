require './lib/task'
require './lib/list'

@place_list = []

@current_list = nil
def main_menu
  loop do
    puts "\n\n"
    puts "Press 'p' to enter a new place/location for tasks"
    puts "Type 'places' to see a list of all your current places/locations"
    puts "Press 'x' to exit."
    place_choice = gets.chomp
    if place_choice == 'p'
      add_place
      list_places

    elsif place_choice == "places"
      list_places

        puts "Type the number of the place you would like to modify or 'main' for menu"
        option = gets.chomp
        if option == 'main'
          puts "Back to main menu"

        else
        selected_place = option.to_i
        @current_list = @place_list[selected_place-1]

        puts "Press 'a' to add a task or 'l' to list all of your tasks"
        puts "Press 'd' to DELETE a task"
        main_choice = gets.chomp
        if main_choice == 'a'
          add_task
        elsif main_choice == 'l'
          list_tasks
        elsif main_choice == 'd'
          list_tasks
          puts "Which task would you like to delete?"
          task_to_delete = gets.chomp.to_i
          @current_list.tasks.delete_at(task_to_delete - 1)
          puts "Task deleted!\n\n"
          list_tasks
        else
          puts "Sorry, that wasn't a valid option."
        end
      end
    elsif place_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def add_place
  puts "Enter a place/location"
  user_place = gets.chomp
  @place_list << List.new(user_place)
  puts "Place added. \n\n"
end

def list_places
  puts "Here are all of your places:"

  @place_list.each do |place|
    location = @place_list.index(place)
    puts (location + 1).to_s + ": " + place.location
  end
  puts "\n"
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  puts "Priority level? (1-5)"
  user_priority = gets.chomp
  puts "Date Due?"
  user_due_date = gets.chomp

  @current_list.add_task(Task.new(user_description + " Priority Level:" + user_priority + " Date Due:" + user_due_date))
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @current_list.tasks.each do |task|
    location = @current_list.tasks.index(task)
    puts (location + 1).to_s + ": " + task.description
  end
  puts "\n"
end

main_menu
