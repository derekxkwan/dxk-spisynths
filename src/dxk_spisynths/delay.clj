(ns dxk-spisynths.delay
  (:use [overtone.live])
(:require [dxk-spisynths.core :as core]))

(without-namespace-in-synthdef
 (core/def-fx sonic-pi-fx_fbdellop
   [fb 0.75
    fb_slide 0
    fb_slide_shape 1
    fb_slide_curve 0
    phase 2
    phase_slide 0
    phase_slide_shape 1
    phase_slide_curve 0
    max_phase 2
    lop 1000
    lop_slide 0
    lop_slide_shape 1
    lop_slide_curve 0

    ]
   [phase         (varlag phase phase_slide phase_slide_curve phase_slide_shape)
    fb            (varlag fb fb_slide fb_slide_curve fb_slide_shape)
    lop           (varlag lop lop_slide lop_slide_curve lop_slide_shape)
    cur-local     (local-in 2)
    mixed-in      (+ cur-local [dry-l dry-r])
    cur-delayed   (lpf (delay-n mixed-in max_phase phase) lop)
    _             (local-out (* cur-delayed fb))
    [wet-l wet-r] (+ [dry-l dry-r] cur-delayed)
    ]
   )
 )

(defn compile-synths []
  (core/save-synthdef sonic-pi-fx_fbdellop)
  )
