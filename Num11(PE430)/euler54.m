function output = euler54
	% Solves Project Euler Problem 54
	% numandina@gmail.com
	
	%% Storing Hands in Cells
	
	fid = fopen('poker.txt');
	c = textscan(fid,'%c');
	nz = c{1}; % in nz is one column containing all the characters
	
	% we have 1,000 hands for each player, and nz is of length 20,000 characters.
	% this is because each hand for each player will have 10 characters (5
	% cards, which each card given a number and a suit).
	
	% in the next step we will take each hand for each player and store them in
	% cells (take each consecutive 20 characters, split them in half, then
	% store each ten as one hand for one player). check the next loop to see this.
	
	p1 = cell(1e3,1);
	p2 = cell(1e3,1);
	
	c = 0;
	
	for k = 1:2:2e3
		
		c = c + 1;
		
		p1{c} = nz(k*10-9:k*10); % each consecutive 10 characters constitute one hand
		p2{c} = nz(k*10+1:k*10+10);
		
	end
	
	% by now we will have two 1000-element cells (p1,p2), with each of their
	% elements containing one hand for each player (i.e. p1{3} means third hand
	% for player 1, which will be playing against p2{3}).
	
	%% Formatting
	
	s = 0; % number of hands won by player 1
	
	for k = 1:1e3 % go through each of the 1000 hands
		
		h1 = p1{k}; % hand for p1 as column vector
		h2 = p2{k};	% hand for p2
		
		c1 = repmat(' ',5,2); % preallocating a 5x2 matrix for each hand
		c2 = repmat(' ',5,2);
		
		% for the next loop, we already have each hand as 10 consectuve
		% characters (value, suit), so take each consecutive two characters
		% and store them as a row.
		for j = 1:5
			
			c1(j,:) = h1(j*2-1:j*2).'; % reshape each hand as 5x2 matrix
			c2(j,:) = h2(j*2-1:j*2).';
			
		end
		
		% now we will have two hands, c1 and c2, with each having values for
		% first column and suits for second column. Thus begin the calculations
		% for each hand.
		
		%% Main Calculations
		
		[r1,v1] = getrank(c1); % get ranks for both hands, as well as rank values
		[r2,v2] = getrank(c2);
		
		if r1 > r2 % if p1's rank is higher than p2's rank
			
			s = s + 1;
			
		elseif r1 == r2 % if their ranks are equal, compare rank values
			
			if v1 > v2 % if p1's rank value is the highest
				
				s = s + 1;
				
			elseif v1 == v2 % if their values are equal, compare second values, and so on...
				
				if r1 == 7 % for example, if two four of a kinds are equal in value, compare fifth card values
					
					% since four cards of each hand are equal, comparing sums
					% is like comparing fifth card values
					if sum(findv(c1)) > sum(findv(c1))
						
						s = s + 1;
						
					end
					
				elseif r1 == 6 % if two full houses have the same value (for the three of a kind), compare the pair values
					
					% since three card of each hand are equal, and the
					% remaining two cards of each hand constitute a pair, then
					% comparing sums is like comparing pair values
					if sum(findv(c1)) > sum(findv(c1))
						
						s = s + 1;
						
					end
					
				elseif r1 == 5 % if the two hands are full suits, compare second highest card of both hands, if they are equal, compare second highest cards,and so on
					
					tc1 = sort(findv(c1));
					tc2 = sort(findv(c2));
					
					ti = 4;
					
					% keep changing index from second bottom (since bottom is
					% highest and has alread been checked) upward until we find
					% an index where the two hand cards don't have the same value
					while ti > 0 && tc1(ti) == tc2(ti)
						
						ti = ti - 1;
						
					end
					
					if tc1(ti) > tc2(ti)
						
						s = s + 1;
						
					end
					
				elseif r1 == 3 % if both values of three of a kind hands are equal
					
					tc1 = sort(findv(c1));
					tc2 = sort(findv(c2));
					
					% set repeated three cards as 0 for each hand
					tc1(tc1 == v1) = 0;
					tc2(tc2 == v2) = 0;
					
					% if max of remaining cards of hands is different
					if max(tc1) > max(tc2)
						
						s = s + 1;
						
						% else if max of both hands is also equal, check last card
					elseif max(tc1) == max(tc2)
						
						% sums are equivalent to compairing last card values,
						% since all other card values are equal for both hands
						if sum(tc1) > sum(tc2)
							
							s = s + 1;
							
						end
						
					end
					
				elseif r1 == 2 % if values of two two pair hands are equal
					
					tc1 = sort(findv(c1));
					tc2 = sort(findv(c2));
					
					% remove cards of the highest pair in each hand
					tc1(tc1 == v1) = [];
					tc2(tc2 == v2) = [];
					
					% find new value of hand 1 (value of second pair)
					if tc1(1) == tc1(2)
						
						v1n = tc1(1);
						
					else
						
						v1n = tc1(2);
						
					end
					
					% find new value of hand 2 (value of second pair)
					if tc2(1) == tc2(2)
						
						v2n = tc2(1);
						
					else
						
						v2n = tc2(2);
						
					end
					
					% compare new values
					if v1n > v2n
						
						s = s + 1;
						
						% if new values are equal too
					elseif v1n == v2n
						
						% remove the second pair from both hands
						tc1(tc1 == v1n) = [];
						tc2(tc2 == v2n) = [];
						
						% now we are left with one card for each hand
						if tc1 > tc2
							
							s = s + 1;
							
						end
						
					end
					
				elseif r1 == 1 % if two one pair hands are equal in value
					
					tc1 = sort(findv(c1));
					tc2 = sort(findv(c2));
					
					% remove the cards that constitute the pair in each hand
					tc1(tc1 == v1) = [];
					tc2(tc2 == v2) = [];
					
					% we are left with three different cards for each hand.
					% just like we did before, we first find a max value for
					% each hand that is different than the one in the other
					ti = 3;
					
					while ti > 0 && tc1(ti) == tc2(ti)
						
						ti = ti - 1;
						
					end
					
					% then we compare the different max values
					if tc1(ti) > tc2(ti)
						
						s = s + 1;
						
					end
					
				else % if the two hands are nothing special (all cards are different)
					
					% again, as we did before, see which max value of each hand
					% is different than the one in the other hand, then compare
					tc1 = sort(findv(c1));
					tc2 = sort(findv(c2));
					
					tc1(tc1 == v1) = [];
					tc2(tc2 == v2) = [];
					
					ti = 4;
					
					while ti > 0 && tc1(ti) == tc2(ti)
						
						ti = ti - 1;
						
					end
					
					if tc1(ti) > tc2(ti)
						
						s = s + 1;
						
					end
					
				end
				
			end
			
		end
		
	end
	
	output = s; % semicolon at the end so you wouldn't cheat! :)
end