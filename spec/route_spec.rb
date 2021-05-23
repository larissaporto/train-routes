require 'spec_helper'
require 'route'

describe 'Route' do
    graph = {'A': {'B': 5, 'D': 5, 'E': 7},
        'B': {'C': 4},
        'C': {'D': 8, 'E': 2},
        'D': {'C': 8, 'E': 6},
        'E': {'B': 3}
    }
    route = Route.new(graph)

    it 'must show distance' do
        expect(route.check_route_length(['A', 'B', 'C'])).to equal(9)
        expect(route.check_route_length(['A', 'D'])).to equal(5)
        expect(route.check_route_length(['A', 'D', 'C'])).to equal(13)
        expect(route.check_route_length(['A', 'E', 'B', 'C', 'D'])).to equal(22)
    end
    it 'and must show ne nil if there is no route' do
        no_route = route.check_route_length(['A', 'B', 'A'])
        expect(no_route).to be_nil
    end
    it 'must show the shortest path' do
        expect(route.check_shotest_path('A', 'C')).to equal(9)
        expect(route.check_shotest_path('B', 'B')).to equal(9)
    end
end