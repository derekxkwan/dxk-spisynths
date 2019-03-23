 class FXFVerbFilt < FXInfo
      def name
        "FVerbFilt"
      end

      def introduced
        Version.new(2,0,0)
      end

      def synth_name
        "fx_fverbfilt"
      end

      def trigger_with_logical_clock?
        false
      end

      def doc
        "Freeverb with filters."
      end

      def arg_defaults
        super.merge({
          :mix => 0.4,
          :room => 0.6,
          :room_slide => 0,
          :room_slide_shape => 1,
          :room_slide_curve => 0,
          :damp => 0.5,
          :damp_slide => 0,
          :damp_slide_shape => 1,
          :damp_slide_curve => 0,
          :lop_in => 20000,
          :lop_in_slide => 0,
          :lop_in_slide_shape => 1,
          :lop_in_slide_curve => 0,
          :lop_out => 20000,
          :lop_out_slide => 0,
          :lop_out_slide_shape => 1,
          :lop_out_slide_curve => 0,
          :hip_in => 20000,
          :hip_in_slide => 0,
          :hip_in_slide_shape => 1,
          :hip_in_slide_curve => 0,
          :hip_out => 20000,
          :hip_out_slide => 0,
          :hip_out_slide_shape => 1,
          :hip_out_slide_curve => 0,
        })

      end


      def kill_delay(args_h)
        r = args_h[:room] || arg_defaults[:room]
        [(r * 10) + 1, 11].min
      end


      def specific_arg_info
        {
          :room =>
          {
            :doc => "The room size - a value between 0 (no reverb) and 1 (maximum reverb).",
            :validations => [v_between_inclusive(:room, 0, 1)],
            :modulatable => true
          },

          :damp =>
          {
            :doc => "High frequency dampening - a value between 0 (no dampening) and 1 (maximum dampening)",
            :validations => [v_between_inclusive(:damp, 0, 1)],
            :modulatable => true
          },

          
           :lop_in =>
          {
            :doc => "lowpass pre-verb in Hz.",
            :validations => [v_positive_not_zero(:lop_in)],
            :modulatable => true

          },

           :lop_out =>
          {
            :doc => "lowpass post-verb in Hz.",
            :validations => [v_positive_not_zero(:lop_out)],
            :modulatable => true

          },

           :hip_in =>
          {
            :doc => "hipass pre-verb in Hz.",
            :validations => [v_positive_not_zero(:hip_in)],
            :modulatable => true

          },

           :hip_out =>
          {
            :doc => "hipass post-verb in Hz.",
            :validations => [v_positive_not_zero(:hip_out)],
            :modulatable => true

          },
              
              
          :room_slide =>
          {
            :doc => generic_slide_doc(:room),
            :validations => [v_positive(:room_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

          :damp_slide =>
          {
            :doc => generic_slide_doc(:damp),
            :validations => [v_positive(:damp_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

          
           :lop_in_slide =>
          {
            :doc => "Slide time in beats between lowpass pre-verb values",
            :validations => [v_positive(:lop_in_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

             :lop_out_slide =>
          {
            :doc => "Slide time in beats between lowpass post-verb values",
            :validations => [v_positive(:lop_out_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

             :hip_in_slide =>
          {
            :doc => "Slide time in beats between hipass pre-verb values",
            :validations => [v_positive(:hip_in_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

             :hip_out_slide =>
          {
            :doc => "Slide time in beats between hipass post-verb values",
            :validations => [v_positive(:hip_out_slide)],
            :modulatable => true,
            :bpm_scale => true
          }
        }
      end
end
