(ns dxk-spisynths.stutter
  (:use [overtone.live])
(:require [dxk-spisynths.core :as core]))

(without-namespace-in-synthdef
 (core/def-fx sonic-pi-fx_stutter
   [mix       0
    ramp      0.001
    stutlen   0.1
    stutlen_slide 0
    stutlen_slide_shape 1
    stutlen_slide_curve 0
    max_phase  2
    ]
   [
    stutlen (varlag stutlen stutlen_slide stutlen_slide_curve stutlen_slide_shape)
    trig     (hpz1:kr mix)
    clock    (phasor:ar trig (/ (/ 1.0 stutlen) (sample-rate)))
    clock    (< (- clock (delay1:ar clock)) 0)
    delptr   (clip:ar (sweep:ar trig) 0 max_phase)
    delptr   (latch:ar delptr clock)
    env      (env-gen:ar (asr ramp 1 ramp) clock)
    [wet-l wet-r] (delay-n:ar [dry-l dry-r] max_phase delptr)
    
    ]
   )
 )

