function [r,v] = getrank(C)
	% get rank and value of hand
	% the higher the rank, the better it is. meaning a hand with a higher
	% rank will beat one with a lower rank.
	% if two ranks are equal we look at the value of the hand's rank, and
	% if that is equal we look at second values and so on. looking at
	% second values and more are done in the main code.
	
	if is_royalf(C)
		r = 9;
		v = 10; % if two hands get royal flush, no one wins (it won't happen)
		        % so the value here means nothing (as we'll never have to look at it)
	elseif is_sflush(C)
		r = 8;
		v = geth(C); % value of the straight flush can be thought as its highest card
	elseif is_four(C)
		r = 7;
		v = get_fourv(C); % sometimes we need a function to determine the value
	elseif is_fullh(C)
		r = 6;
		v = get_fullhv(C);
	elseif is_flush(C)
		r = 5;
		v = geth(C); % value of flush is highest card
	elseif is_straight(C)
		r = 4;
		v = geth(C); % same as straight flush
	elseif is_three(C)
		r = 3;
		v = get_threev(C);
	elseif is_twop(C)
		r = 2;
		v = get_twopv(C);
	elseif is_onep(C)
		r = 1;
		v = get_onepv(C);
	else
		r = 0;
		v = geth(C); % if it is none of the above, its value will be the highest card
	end	
	
end