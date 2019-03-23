# dxk-spisynths

Sonic Pi Synths

## Usage

- `custom-build` - a custom builder to (re)compile sonic-pi (basically the original build script with a bunch of stuff commented out)

Basically, `lein repl`, `(use 'dxk-spisynths.compiler)` and the following:

- `(compile-fft)`
    - `pv_maggate`
- `(compile-reverb)`
    - `fverbfilt`
- `(compile-delay)`
    - `fbdellop`
- `(compile-stutter)`
    - `stutter`

### synthinfo.rb additions

- classes to add to `app/server/sonicpi/lib/sonicpi/synths/synthinfo.rb`
    - `fbdellop.rb` - fbdellop 
    - `fverbfilt.rb` - fverbfilt
    - `stutter.rb` - stutter
    - `pv_maggate.rb` - pv_maggate 
- must instantiate at bottom of `synthinfo.rb` (follow others for examples)

## Synths

See ruby files (or documentation) for complete params


- `fbdellop` - like `:echo`, but with an added lowpass (`lop`) parameter and feedback (`fb`) specified instead of `decay`
- `fverbfilt` - like `:reverb`, but with an added lowpass (`lop_in` and `lop_out`) pre-verb and post-verb as well as hipass (`hip_in` and `hip_out`)
- `stutter` - stuttering effect which stutters a maximum of `max_phase` seconds with lengths of stutter given by `stutlen`
- `pv_maggate` - performs fft (of size `winsize`) gating at `thresh` magnitude, scaling magnitudes below if positive (above abs if negative) with scale factor `scale`

## License

GPL v3
