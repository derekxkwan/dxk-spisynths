# dxk-spisynths

Sonic Pi Synths

## Usage

- `custom-build` - a custom builder to (re)compile sonic-pi (basically the original build script with a bunch of stuff commented out)
- `fbdellop.rb` - class to add to `app/server/sonicpi/lib/sonicpi/synths/synthinfo.rb`
- `fverbfilt.rb` - class to add to `app/server/sonicpi/lib/sonicpi/synths/synthinfo.rb`
  - must instantiate at bottom of `synthinfo.rb` (follow others for examples)



Basically, `lein repl`, `(use 'dxk-spisynths.delay)` (or `.reverb`), `(compile-synths)` so far...

## Synths

- `fbdellop` - like `:echo`, but with an added lowpass (`lop`) parameter and feedback (`fb`) specified instead of `decay`
- `fverbfilt` - like `:reverb`, but with an added lowpass (`lop_in` and `lop_out`) pre-verb and post-verb as well as hipass (`hip_in` and `hip_out`)

## License

GPL v3
