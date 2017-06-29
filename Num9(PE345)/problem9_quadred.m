function[solution] = problem9_quadred(solution)


quad(1,:) = [1 2 3 10 11 12 19 20 21];

quad(2,:) = [4 5 6 13 14 15 22 23 24];

quad(3,:) = [7 8 9 16 17 18 25 26 27];

quad(4,:) = [28 29 30 37 38 39 46 47 48];

quad(5,:) = [31 32 33 40 41 42 49 50 51];

quad(6,:) = [34 35 36 43 44 45 52 53 54];

quad(7,:) = [55 56 57 64 65 66 73 74 75];

quad(8,:) = [58 59 60 67 68 69 76 77 78];

quad(9,:) = [61 62 63 70 71 72 79 80 81];


for z = 1:9

    checker = solution(quad(z,:),:);

    for i = 1:9

        j = 9*(i-1)+1;

        if length(find(checker(j:j+8)))==1

            n = find(checker(j:j+8));

            solution(quad(z,n),:) = 0;

            solution(quad(z,n),i) = 7;

        end

    end

end


end

%  Problem96_vertical

function[solution] = problem96_vertical(index,next,solution)


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

