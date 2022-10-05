function funnyPhrase = easterEgg
rng shuffle
random = randi(10);
switch random
    case 1
        funnyPhrase = 'I can do this all day.';
    case 2
        funnyPhrase = 'Is this fun for you?';
    case 3
        funnyPhrase = 'You done messed up A-Aron!';
    case 4
        funnyPhrase = 'Your resistance is futile.';
    case 5
        funnyPhrase = 'Are you serious?';
    case 6
        funnyPhrase = 'You will get it eventually';
    case 7
        funnyPhrase = 'What happens when an unstopable force meets an unmovable object? A massive waste of time.';
    case 8
        funnyPhrase = 'I ran out of one liners, now please just stop';
    case 9
        funnyPhrase = 'I never should have never trusted a user input';
    otherwise
        funnyPhrase = 'Are you stalling because you lost?';
end