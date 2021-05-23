class Route
    attr_reader :graph
    A_VERY_HIGH_NUMBER = 123456789
    def initialize(graph)
        @graph = graph
    end

    def check_route_length(city_array)
        edge = 0
        city_array.each_with_index do |value, index|
            node = value
            if index < city_array.length() -1
                next_node = city_array[index + 1]
                if graph.dig(node.to_sym, next_node.to_sym)
                    edge = edge + graph[node.to_sym][next_node.to_sym]
                else
                    return puts 'No route'
                end
            end
        end
    return edge
    end
    
    def check_shotest_path(source, target)
        nodes = graph[source.to_sym].keys
        distance = {}
        previous = {}
        for node in ['A', 'B','C', 'D', 'E']
            distance[node.to_sym] = A_VERY_HIGH_NUMBER
            previous[node.to_sym] = -1
        end
        marker = source
        while nodes.any?
            unvisited = nil
            for n in nodes
                if (unvisited.nil?) or (distance[n] < distance[unvisited])
                    unvisited = n
                end
                
            end
            if (distance[unvisited] == A_VERY_HIGH_NUMBER)
                distance[unvisited] = graph[source.to_sym][unvisited.to_sym]
            end
            nodes = nodes - [unvisited]

            for neighbor in graph[unvisited].keys
                new_dist = distance[unvisited] + graph[unvisited][neighbor]
                if new_dist < distance[neighbor]
                    distance[neighbor] = new_dist
                    previous[neighbor] = unvisited
                end
                for n in graph[neighbor].keys
                    new_dist = distance[neighbor] + graph[neighbor][n]
                    if new_dist < distance[n]
                        distance[n] = new_dist
                        previous[n] = neighbor
                    end
                end
            end
        end
        return distance[target.to_sym]
    end

    def check_all_paths(source, target, visited, path=[])
        visited[source] = true
        path.append(source)
        if source == target
            path
        else
            graph[source.to_sym].keys.each do |neighbor|
                check_all_paths(neighbor, target, visited, path) unless visited[neighbor]
            end
        end
        path.pop()
        visited[source]= false
    end

    def result_all_path(source, target)
        visited = {}
        for node in graph.keys
            visited[node] = false
        end
        path = []

        check_all_paths(source, target, visited, path)
        
    end

   
end
