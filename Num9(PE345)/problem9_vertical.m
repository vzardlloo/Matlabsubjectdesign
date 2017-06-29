function[solution] = problem9_vertical(index,next,solution)


                if index>=1 && index<=9

                    solution(1:9,next) = 0;

                elseif index>=10 && index<=18

                    solution(10:18,next) = 0;

                elseif index>=19 && index<=27

                    solution(19:27,next) = 0;

                elseif index>=28 && index<=36

                    solution(28:36,next) = 0;

                elseif index>=37 && index<=45

                    solution(37:45,next) = 0;

                elseif index>=46 && index<=54

                    solution(46:54,next) = 0;

                elseif index>=55 && index<=63

                    solution(55:63,next) = 0;

                elseif index>=64 && index<=72

                    solution(64:72,next) = 0;

                elseif index>=73 && index<=81

                    solution(73:81,next) = 0;

                end

                

end

