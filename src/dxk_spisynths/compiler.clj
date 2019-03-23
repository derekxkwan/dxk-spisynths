(ns dxk-spisynths.compiler
  (:use [overtone.live])
  (:require [dxk-spisynths.core :as core]
            [dxk-spisynths.fft :as fft]
            [dxk-spisynths.stutter :as stut]
            [dxk-spisynths.reverb :as rvb]
            [dxk-spisynths.delay :as dly]
            ))


(defn compile-fft []
  (core/save-synthdef fft/sonic-pi-fx_pv_maggate)
  )

(defn compile-stutter []
  (core/save-synthdef stut/sonic-pi-fx_stutter)
  )

(defn compile-reverb []
  (core/save-synthdef rvb/sonic-pi-fx_fverbfilt)
  )

(defn compile-delay []
  (core/save-synthdef dly/sonic-pi-fx_fbdellop)
  )
