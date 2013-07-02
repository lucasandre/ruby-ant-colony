require_relative "aco/aco"
require_relative "aco/ant"

class ACOTsp < ACO
  # Strength of pheromone on decision probability (between 0 and 1)
  Alpha = 1
  # Strength of heuristic on decision probability (between 0 and 1)
  Beta = 1
  # Rate of pheromone evaporation (between 0 and 1)
  Rho = 0.5
  # Rate of pheromone increase
  Q = 1.0

  def initialize(start_vertex, max_iterations = 5, num_ants = 15)
    super(
      ACO.test_enviroment,
      start_vertex,
      max_iterations,
      num_ants,
      alpha: Alpha, beta: Beta, rho: Rho, q: Q
    )
  end

  def run
    super(@start_vertex)
  end
end

class Ant
  def reached_end?
    has_all_vertices = @current_enviroment.vertices.keys.all? do |vertex|
      @path.include?(vertex)
    end
    has_all_vertices and @current_enviroment.has_edge?(@path.first, @path.last)
  end
end

a = ACOTsp.new('A')
a.run
puts "Solution: #{a.solution}"