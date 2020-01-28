class Player
  attr_accessor :name, :life_points
  

  def initialize(name)
    @name = name
    @life_points = 10
  end 

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end 

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué!"
    end
  end 

  def attacks(other_player)
    puts "#{@name} attaque #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "Il lui inflige #{damage} points de dommages."
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end 

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end 

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    rand(1..6)
    power_weapon = rand(1..6)
    puts "tu as trouvé une arme de niveau #{power_weapon}"
    if power_weapon > @weapon_level
      return power_weapon = @weapon_level + power_weapon - 1
      puts "Prends cette arme"
    else power_weapon <= @weapon_level
      puts "fuck!"
    end 
  end 

  def search_health_pack
    rand(1..6)
    result = rand(1..6)

    if result == 1
      puts "Tu n'as rien trouvé..."
    elsif result == 6 
      @life_points + 80
      puts "Waow"
    else 
      @life_points + 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    end 
    return result
  end 

end 