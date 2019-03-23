class FXPVMagGate < FXInfo
      def name
        "PV_MagGate"
      end

      def introduced
        Version.new(2,3,0)
      end

      def synth_name
        "pv_maggate"
      end

      def doc
        "Gate output by frequency bin magnitude"
      end

      def arg_defaults
        super.merge({
          :scale => 0,
          :scale_slide => 0,
          :scale_slide_shape => 1,
          :scale_slide_curve => 0,
          :thresh => 1,
          :thresh_slide => 0,
          :thresh_slide_shape => 1,
          :thresh_slide_curve => 0,
          :hop => 0.5, 
          :winsize => 1024,
          :wintype => 0
                    })
      end

      def specific_arg_info
        {
          :scale =>
          {
            :doc => "amount to scale magnitudes",
            :modulatable => true
          },

          :thresh =>
          {
            :doc => "if positive, scales magnitudes below thresh, else scales magnitudes above abs(thresh)",
            :modulatable => true
          },

          :wintype =>
          {
            :doc => "-1: rectangular, 0: sine (default), 1: hann",
            :validations => [v_one_of(:wintype, [-1, 0, 1])],
            :modulatable => false
          },


          :winsize =>
          {
            :doc => "size of window in samples (must be power of 2)",
            :validations => [v_one_of(:winsize, [2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384])],
            :modulatable => false
          },

          :hop =>
          {
            :doc => "amount of offset between fft analysis windows",
            :validations => [v_between_inclusive(:hop, 0, 1)],
            :modulatable => false
          },
          
          
          :scale_slide =>
          {
            :doc => generic_slide_doc(:scale),
            :validations => [v_positive(:scale_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

          :thresh_slide =>
          {
            :doc => generic_slide_doc(:thresh),
            :validations => [v_positive(:thresh_slide)],
            :modulatable => true,
            :bpm_scale => true
          }
        }
      end

end
