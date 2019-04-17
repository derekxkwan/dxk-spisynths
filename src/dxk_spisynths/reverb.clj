
(ns dxk-spisynths.reverb
  (:use [overtone.live])
(:require [dxk-spisynths.core :as core]))

(without-namespace-in-synthdef
 (core/def-fx sonic-pi-fx_fverbfilt
   [mix  0.4 ;; override default mix of 1
    room 0.6
    room_slide 0
    room_slide_shape 1
    room_slide_curve 0
    damp 0.5
    damp_slide 0
    damp_slide_shape 1
    damp_slide_curve 0
    lop_in 135
    lop_in_slide 0
    lop_in_slide_shape 1
    lop_in_slide_curve 0
    lop_out 135
    lop_out_slide 0
    lop_out_slide_shape 1
    lop_out_slide_curve 0
    hip_in 0
    hip_in_slide 0
    hip_in_slide_shape 1
    hip_in_slide_curve 0
    hip_out 0
    hip_out_slide 0
    hip_out_slide_shape 1
    hip_out_slide_curve 0    ]
   [room          (varlag room room_slide room_slide_curve room_slide_shape)
    damp          (varlag damp damp_slide damp_slide_curve damp_slide_shape)
    hip_in_map    (midicps hip_in)
    hip_out_map   (midicps hip_out)
    lop_in_map    (midicps lop_in)
    lop_out_map   (midicps lop_out)
    hip_in        (varlag hip_in_map hip_in_slide hip_in_slide_curve hip_in_slide_shape)
    hip_out       (varlag hip_out_map hip_out_slide hip_out_slide_curve hip_out_slide_shape)
    lop_in        (varlag lop_in_map lop_in_slide lop_in_slide_curve lop_in_slide_shape)
    lop_out       (varlag lop_out_map lop_out_slide lop_out_slide_curve lop_out_slide_shape)
    [in-l in-r]   (hpf (lpf [dry-l dry-r] lop_in) hip_in)
    rev-mix       (lin-lin fx-arg-mix -1 1 0 1)
    [rvb-l rvb-r] (free-verb2 in-l in-r rev-mix room damp)
    [wet-l wet-r] (hpf (lpf [rvb-l rvb-r] lop_out) hip_out)
    ])
 )

(defn compile-synths []
  (core/save-synthdef sonic-pi-fx_fverbfilt)
  )

