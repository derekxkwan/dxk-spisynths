(ns dxk-spisynths.fft
  (:use [overtone.live])
(:require [dxk-spisynths.core :as core]))

(without-namespace-in-synthdef
 (core/def-fx sonic-pi-fx_pv_maggate
   [scale 0
    scale_slide 0
    scale_slide_shape 1
    scale_slide_curve 0
    thresh 1
    thresh_slide 0
    thresh_slide_shape 1
    thresh_slide_curve 0
    hop 0.5
    winsize 1024
    wintype 0
    ]
   [thresh        (varlag thresh thresh_slide thresh_slide_curve thresh_slide_shape)
    scale         (varlag scale scale_slide scale_slide_curve scale_slide_shape)
    lbuf          (local-buf [winsize winsize])
    chain         (fft lbuf [dry-l dry-r] hop wintype)
    chain         (pv-mag-gate chain thresh scale)
    [wet-l wet-r] (ifft chain wintype)
    ]
   )
 )

