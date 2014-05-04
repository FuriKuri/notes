[![Build Status](https://travis-ci.org/FuriKuri/notes.svg?branch=master)](https://travis-ci.org/FuriKuri/notes)

# notes
My first Elixir project. With this little tool, you can save notes.
## Installation
 1. Install elixir `brew install elixir`.
 2. Clone repository `git clone https://github.com/FuriKuri/notes.git`
 3. Generate escript `mix escriptize`
 4. Execute `./notes help`
## Usage
### Adding note
```
./notes add "my note"
./notes add "my note with priority" -p 1
```
### List notes
./notes ls
./notes ls 10 # list only first 10 notes
### Delete note
./notes rm 4 # delete note with id 4
