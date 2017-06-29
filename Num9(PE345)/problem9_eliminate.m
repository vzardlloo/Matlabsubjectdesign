function[solution,final] = problem9_eliminate(solution,final)

%     while any(final(1:9:19)==0)==1

        for index = 1:81

        if length(find(solution(index,:))) == 1

            next = find(solution(index,:));

            final(index) = next;

%                 Horizontal eliminations

                x = mod(index,9);

                if x == 0

                    x = 9;

                end

                solution(x:9:81,next) = 0;

%                 Vertical eliminations

                solution = problem9_vertical(index,next,solution);

%                 Eliminate in the same quadrant

                solution = problem9_quadrant(index,next,solution);

        end

        end


end

