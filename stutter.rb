class FXStutter < FXInfo
      def name
        "Stutter"
      end

      def introduced
        Version.new(2,3,0)
      end

      def synth_name
        "fx_stutter"
      end

      def doc
        "stutter input signal"
      end

      def trigger_with_logical_clock?
        :t_minus_delta
      end

      def kill_delay(args_h)
        args_h[:ramp]
      end
      
      
      def arg_defaults
        super.merge({
           :mix => 0,
           :ramp => 0.001,
           :stutlen => 0.1,
           :stutlen_slide => 0,
           :stutlen_slide_shape => 1,
           :stutlen_slide_curve => 0,
           :max_phase => 2
                      
                    })
      end

      def specific_arg_info
        {
          :ramp =>
          {
            :doc => "ramp time for stutter",
            :validations => [v_positive(:ramp)],
            :modulatable => true
          },

          :max_phase =>
          {
            :doc => "maximum stutter time",
            :validations => [v_positive(:max_phase)],
            :modulatable => false
          },

          :stutlen =>
          {
            :doc => "length of stutter in seconds (bpm scaled)",
            :validations => [v_positive(:stutlen)],
            :modulatable => true,
            :bpm_scale => true
          },
          
          :stutlen_slide =>
          {
            :doc => generic_slide_doc(:stutlen),
            :validations => [v_positive(:stutlen_slide)],
            :modulatable => true,
            :bpm_scale => true
          }
        }
      end

end
 
