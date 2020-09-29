# Passage

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/b674417324f34fb4af40068646585d41)](https://www.codacy.com?utm_source=bitbucket.org&amp;utm_medium=referral&amp;utm_content=sergey_bezugliy/passage&amp;utm_campaign=Badge_Grade)

Library providing a check of the path for safety by trajectory from the start point to end inside of the field of transmitters. 

## Install dependencies
    $ bundle install

## CLI

    $ ./bin/check 
    Enter count of transmitters: 6
    Enter parameters for transmitter #0 `<x> <y> <power>`: 6 11 4
    Enter parameters for transmitter #1 `<x> <y> <power>`: 8 17 3
    Enter parameters for transmitter #2 `<x> <y> <power>`: 19 19 2
    Enter parameters for transmitter #3 `<x> <y> <power>`: 19 11 4
    Enter parameters for transmitter #4 `<x> <y> <power>`: 15 7 6
    Enter parameters for transmitter #5 `<x> <y> <power>`: 12 19 4
    Enter start position coordinates `<x> <y>`: 10 19
    Enter end position coordinates `<x> <y>`: 19 4
    Safe passage is possible.

## Execute tests

    $ bundle exec guard

## Lint
    
    $ bundle exec rubocop -A
    
    
## Author
    Sergey Bezugliy <s.bezugliy@codenv.top>
