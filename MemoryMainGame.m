load CardDeck.mat
for r = 1:4
    for c = 1:4
        MemoryBoard {r,c} = RedDeck{55};
    end
end
imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}])
%User mouse input card choice
%First Card
[x,y] = ginput(1);
r = floor(y/72) + 1;
c = floor(x/96) + 1;
check = 0;
               if all(row > 4)&&all(row < 1)&&all(col >4)&&all(col < 1)
                   errordlg('Invalid Choice: Click on a card \n');
                   pause(3)
                   close(Err1)
               elseif MemoryBoard(r,c) ~= 0
                   errordlg('Already Chosen:  Click on another card \n');
                   pause(5)
                   close(Err2)
               end


%Second Card
[x,y] = ginput(1);
r = floor(y/72) + 1;
c = floor(x/96) + 1;
check = 0;
%%
%Match Check

