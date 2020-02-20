require "colorize"

class BabyDragon 
  attr_reader :name, :fullness_level, :thirst_level

  def initialize(name)
    @name = name 
    @is_asleep = false 
    @fullness_level = 10  # hungry: 0, full: 10
    @thirst_level = 10  #thirsty: 0, full: 10
    @time = 0
    puts "#{name} was born!🐲\n".bold
    puts "       \\****__              ____".green                                              
    puts "         |    *****\\_      --/ *\\-__".green                                          
    puts "         /_          (_    ./ ,/----'".green                                         
    puts "Art by     \\__         (_./  /".green                                                
    puts " Ironwing     \\__           \\___----^__".green                                       
    puts "               _/   _                  \\ ".green                                      
    puts "        |    _/  __/ )\\\"\\ _____         *\\   ".green                               
    puts "        |\\__/   /    ^ ^       \\____      )   ".green                                
    puts "         \\___--\\\"                    \\_____ )  \n\n\n".green
  end 

  def eat
    puts "\n\n#{@name} eats popcorn, cheeze-its, seaweed, cheetos, burritos🍿🍔🍕"

    @fullness_level = 10

    # Passage of time happens
    passage_of_time 
  end 

  def drink 
    puts "\n\n#{@name} is super thirsty. Drink sangria🍷"

    @thirst_level = 10

    # Passage of time happens
    passage_of_time
  end 
  
  def takes_a_nap 
    puts "\n\n#{@name} curls up and dozes off..."
   
    @is_asleep = true

    # Passage of time happens
    3.times do 
      passage_of_time 
    end 

    @is_asleep = false
  end 

  def play 
    puts "\n\n#{@name} chills out next to the fireplace and eats a lot of salty snacks🛀"

    @fullness_level -= 1
    @thirst_level -= 1

    # Passage of time happens
    passage_of_time 
  end 

  def fight(another_dragon) 
    puts "\n\n#{@name} fought with #{another_dragon}🔥🧨"

    @fullness_level -= 1
    @thirst_level -= 1

    passage_of_time 
  end 

  def cry 
    puts "\n\n#{@name} cried! 😭"

    @fullness_level -= 1
    @thirst_level -= 5

    passage_of_time 
  end 

  def passage_of_time 
    @time += 1
    puts "#{@time} hour(s) has passed..⏰".blue

    if @thirst_level > 0 
      @thirst_level -= 1
    else # if thirsty 
      if @is_asleep 
        @is_asleep = false 
        puts "#{@name} was super thirsty! #{@name} died!😵".red.on_light_yellow.bold.blink
        exit
      end 
    end 

    if @fullness_level > 0 
      @fullness_level -= 1
    else #if hungry
      if @is_asleep  # if sleeping
        @is_asleep = false # awake
        puts "#{@name} woke up!"
      end 
      puts "#{@name} was super hangry! They ATE YOU! >:(\n\n" 
      exit  
    end    
  end 
end 

puff = BabyDragon.new("Puff The Magic Dragon")
sprinkles = BabyDragon.new("Sprinkles Dragon")


sprinkles.play
sprinkles.takes_a_nap
sprinkles.eat
sprinkles.drink
sprinkles.cry
sprinkles.takes_a_nap
puff.fight(sprinkles.name)
sprinkles.eat


until (sprinkles.fullness_level == 0)
  sprinkles.play
  sprinkles.takes_a_nap
  puff.fight(sprinkles.name)
end
