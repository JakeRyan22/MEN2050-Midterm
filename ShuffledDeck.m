for r = 1:4
    for c = 1:4
        MemoryBoard {r,c} = RedDeck{randperm(13)};
    end
end
imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}])
