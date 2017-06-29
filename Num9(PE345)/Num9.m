
%  Main script, calls many sub functions

clc;clear all;close all

n = 9;

fid = fopen('soduku.txt');

tic

answer = 0;

num = 0;

for grid = 1:49

    grid_num = fgetl(fid);

    sudoku = zeros(n,n);

    solution = zeros(81,n);

    final    = zeros(n,n);

    for i = 1:n

        solution(1:81,i) = i;

    end

    

%     index = 0;

    

    for i = 1:9

        line = fgetl(fid);

        for j = 1:9

            next = str2double(line(j));

            sudoku(i,j) = next;

            index = (9*(j-1)) + i;

            if next~=0

                solution(index,:) = 0;

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

    solution = problem9_quadred(solution);

    for i = 1:81

        if length(find(solution(i,:)))==1

            final(i) = find(solution(i,:));

        end

    end

%     solution = problem96_quadred(solution);

    index = 0;

%     Choose any number that is alone in a solution's row, re-eliminate

check_new = zeros(n,n);

guess = 0;

    while any(final(1:81)==0)==1

        [solution,final] = problem9_eliminate(solution,final);

        solution = problem9_quadred(solution);

        if check_new==(final==sudoku)

            for I = 1:81

                if length(find(solution(I,:))) < 4

                if length(find(solution(I,:))) >= 2

                    guess = find(solution(I,:));

                    break

                end

                end

            end

        else

            check_new = (final==sudoku);

        end

        if length(guess)>1

            break

        end

    end


while length(guess)>1

        for j = 1:length(guess)

            check_new = zeros(n,n);

            solution2 = solution;

            solution2(I,:) = 0;

            solution2(I,guess(j)) = guess(j);

            final2 = final;

            if I == 81

                guess = 0;

                break

            end

            while any(final2(1:81)==0)==1

                [solution2,final2] = problem9_eliminate(solution2,final2);

                solution2 = problem9_quadred(solution2);

%                 fprintf('The guess is %.0d at %.0d in %s\n',guess(j),I,grid_num)


                if check_new==(final2==sudoku)

                    if j == length(guess)

                        for I = I+1:81

                            if length(find(solution(I,:))) < 5

                                if length(find(solution(I,:))) >= 2

                                    guess = find(solution(I,:));

                                    break

                                end

                            end

                        end

                        break

                    else

                        break

                    end

                else

                    check_new = (final2==sudoku);

                end

                if any(final2(1:81)==0)==0

                    final = final2;

                    guess = 0;

                    break

                end

            end

            if any(final(1:81)==0)==0

                break

            end

        end

end

    if any(final==0)~=1

        num = num + 1;

    else

%         fprintf('%s fails\n',grid_num)

    end

    N = zeros(1,3);

    ANSWER(1) = num2str(final(1));

    ANSWER(2) = num2str(final(10));

    ANSWER(3) = num2str(final(19));

    answer = answer + str2double(ANSWER);

end
toc 
fclose(fid);
