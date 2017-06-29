function b = is_four(C)
	% is hand a four of a kind?
	
	b = 0;
	
	% get values of the cards in the hand
	cn = findv(C);
	
	[a,b2] = unique(sort(cn));
	
	% if the values are all the same, then we have four of a kind (five of
	% a kind really)
	if length(a) == 1
		b = 1;
		return
	end
	
	% a hand is four of a kind if it has two different element, and another
	% condition that is explained at the end of the function *
	if length(a) < 3 && (sum(ismember(b2,[1,5])) == 2 || sum(ismember(b2,[4,5])) == 2)
		
		b = 1;
		
	end
	
	
end

% * the second output of unique() can be thought of as the last position of the
% unique elements in a vector. in our condition, if we have two different
% elements in the hand (length(a) == 2) and sort the values of the hand,
% then the hand could either have a pair and three of a kind, or a card and
% four of a kind.
% 
% to distinguish, we know that if it is one card and four of a kind, then the
% sorted card can only be one of two cases:
%
% either [c1,c1,c1,c1,c2] or [c1,c2,c2,c2,c2] depending on the values of c1
% and c2. here, the last position of the cards are either [1,5] or [4,5].
% this is the condition that is taken in line 20.






