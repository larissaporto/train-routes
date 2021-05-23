require_relative './lib/route'

graph = {
    'A': {
        'B': 5, 'D': 5, 'E': 7
    },
    'B': {
        'C': 4
    },
    'C': {
        'D': 8, 'E': 2
    },
    'D': {
        'C': 8, 'E': 6
    },
    'E': {
        'B': 3
    }
}

route = Route.new(graph)

puts route.check_route_length(['A', 'B', 'C'])
puts route.check_route_length(['A', 'D'])
puts route.check_route_length(['A', 'D', 'C'])
puts route.check_route_length(['A', 'E', 'B', 'C', 'D'])
puts route.check_route_length(['A', 'E', 'D'])
#puts route.check_max('C', 'C', 3)
#puts route.check_exact('A', 'C', 4)
puts route.check_shotest_path('A', 'C')
puts route.check_shotest_path('B', 'B')
#puts route.check_max('C', 'C', 30)
puts route.result_all_path('A', 'C')