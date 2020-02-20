require "colorize"

class BabyDragon 
  attr_reader :name, :fullness_level, :thirst_level

  def initialize(name, ascii)
    @name = name 
    @is_asleep = false 
    @fullness_level = 10  # hungry: 0, full: 10
    @thirst_level = 10  #thirsty: 0, full: 10
    @time = 0
    @ascii = ascii 

    puts "#{name} was born. 🐲".bold
    puts ascii
  end 

  def eat
    puts "\n\n#{@name} eats popcorn, cheeze-its, seaweed, cheetos, burritos🍿🍔🍕"

    @fullness_level = 10

    passage_of_time 
  end 

  def drink 
    puts "\n\n#{@name} is super thirsty. Drink sangria🍷"

    @thirst_level = 10

    passage_of_time
  end 
  
  def takes_a_nap 
    puts "\n\n#{@name} curls up and dozes off...🥱😴💤🛌"
   
    @is_asleep = true

    3.times do 
      passage_of_time 
    end 

    @is_asleep = false
  end 

  def play 
    puts "\n\n#{@name} chills out next to the fireplace 🔥and eats a lot of salty snacks🥰"

    @fullness_level -= 1
    @thirst_level -= 1

    passage_of_time 
  end 

  def fight(another_dragon) 
    puts "\n\n#{@name} fought with #{another_dragon}🥊"

    puts "
            _)               (_
           _) \\\ /\\%/\\ /\\_/\\ / (_
           _)  \\\(0 0) (0 0)//  (_
          )_ -- \\(oo) (oo)/ -- _(
            )_ / /\\\__,__//\\ \\ _(
             )_ /   --;--   \\ _(
         *.    ( (  )) ((  ) )    .*
           '...(____)z z(____)...'
    ".red.bold

    @fullness_level -= 1
    @thirst_level -= 1

    passage_of_time 
  end 

  def cry 
    puts "\n\n#{@name} cried! 😭😭😭"

    @fullness_level -= 1
    @thirst_level -= 5

    passage_of_time 
  end 

  def passage_of_time 
    @time += 1
    
    puts "#{@time} hour(s) have passed..⏰".blue

    if @thirst_level > 0 
      @thirst_level -= 1
    else 
      if @is_asleep 
        @is_asleep = false 
        puts "\n\n#{@name} was super thirsty! #{@name} died!😵\n".red.on_light_yellow.bold.blink
        exit
      end 
    end 

    if @fullness_level > 0 
      @fullness_level -= 1
    else 
      if @is_asleep  
        @is_asleep = false 
        puts "#{@name} woke up!"
      end 
      puts "\n\n#{@name} was super hangry! They ATE YOU! >:(" 
      exit  
    end    
  end 
end 

puff_pic = "
         \****__              ____                                              
         |    *****\_      --/ *\-__                                          
         /_          (_    ./ ,/----'                                         
           \\__         (_./  /                                                
              \\__           \\___----^__                                       
               _/   _                  \\                                      
        |    _/  __/ )\\\"\\ _____         *\\                                    
        |\\__/   /    ^ ^       \\____      )                                   
         \\___--\\\"                    \\_____ )                                  
".cyan.bold

sprinkles_pic = "
            ۪|\\___/|\n
            (,\\  /,)\\\\
            /     /  \\\\
            (@_^_@)/   \\\\
            W//W_/     \\\\
            (//) |        \\\\
          (/ /) _|_ /   )  \\\\
        (// /) '/,_ _ _/  (~^-.\\
      (( // )) ,-{        _    `.\\
     (( /// ))  '/\      /      |\\
    (( ///))     `.   {       }\\
    ((/ ))    .----~-.\   \-'\\
              ///.----..>   \\
              ///-._ _  _ _}\\
".green.bold

puff = BabyDragon.new("Puff The Magic Dragon", puff_pic)
sprinkles = BabyDragon.new("Sprinkles Dragon", sprinkles_pic)

sprinkles.play
sprinkles.takes_a_nap
sprinkles.eat
sprinkles.drink
sprinkles.takes_a_nap
sprinkles.fight(puff.name)
sprinkles.cry
sprinkles.drink
sprinkles.eat

until (sprinkles.fullness_level == 0)
  sprinkles.play
  sprinkles.takes_a_nap
end
