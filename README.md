# placecorgi


A small Sinatra app influenced by http://placekitten.com. This application is based on the source code for fakeimage which was a Ruby inspired twist of http://dummyimage.com.

## Installation

requires ruby 1.9.2

dependent gems are installed with bundler `bundle install`.


## Use

For a 300 x 200 pixel image, visit `http://localhost:4567/300x200`.

Leaving off the second dimension will display a square, so for a 200 x 200 pixel image, visit `http://localhost:4567/200`. Visiting `http://localhost:4567/200x200` will work, too, but why type more than you have to?

This application only generates png files.

## Copyright

Because this project was started by using fakeimage as a starting point, portions of this application are copyright (c) 2010-2011 Michael Dungan, mpd@jesters-court.net, released under the MIT license.

The rest of the application is copyright (c) 2011 Corgibytes LLC (http://www.corgibytes.com) and are also released under the MIT license.