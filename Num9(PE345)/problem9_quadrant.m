function[solution] = problem9_quadrant(index,next,solution)


%                 Eliminate in the same quadrant

                if (index>=1 && index<=3) || (index>=10 && index<=12) || (index>=19 && index<=21)

                    solution(1:3,next) = 0;

                    solution(10:12,next) = 0;

                    solution(19:21,next) = 0;

                elseif (index>=4 && index<=6) || (index>=13 && index<=15) || (index>=22 && index<=24)

                    solution(4:6,next) = 0;

                    solution(13:15,next) = 0;

                    solution(22:24,next) = 0;

                elseif (index>=7 && index<=9) || (index>=16 && index<=18) || (index>=25 && index<=27)

                    solution(7:9,next) = 0;

                    solution(16:18,next) = 0;

                    solution(25:27,next) = 0;

%                     next 3 verticals

                elseif (index>=28 && index<=30) || (index>=37 && index<=39) || (index>=46 && index<=48)

                    solution(28:30,next) = 0;

                    solution(37:39,next) = 0;

                    solution(46:48,next) = 0;

                elseif (index>=31 && index<=33) || (index>=40 && index<=42) || (index>=49 && index<=51)

                    solution(31:33,next) = 0;

                    solution(40:42,next) = 0;

                    solution(49:51,next) = 0;

                elseif (index>=34 && index<=36) || (index>=43 && index<=45) || (index>=52 && index<=54)

                    solution(34:36,next) = 0;

                    solution(43:45,next) = 0;

                    solution(52:54,next) = 0;

%                     last 3 verticals

                elseif (index>=55 && index<=57) || (index>=64 && index<=66) || (index>=73 && index<=75)

                    solution(55:57,next) = 0;

                    solution(64:66,next) = 0;

                    solution(73:75,next) = 0;

                elseif (index>=58 && index<=60) || (index>=67 && index<=69) || (index>=76 && index<=78)

                    solution(58:60,next) = 0;

                    solution(67:69,next) = 0;

                    solution(76:78,next) = 0;

                elseif (index>=61 && index<=63) || (index>=70 && index<=72) || (index>=79 && index<=81)

                    solution(61:63,next) = 0;

                    solution(70:72,next) = 0;

                    solution(79:81,next) = 0;

                end

end

