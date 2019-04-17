    class FXFbdellop < FXInfo
      def name
        "Fbdellop"
      end

      def introduced
        Version.new(2,0,0)
      end

      def synth_name
        "fx_fbdellop"
      end

      def doc
        "Standard echo (with lowpass) with variable phase duration (time between echoes) and decay (length of echo fade out). If you wish to have a phase duration longer than 2s, you need to specify the longest phase duration you'd like with the arg max_phase. Be warned, echo FX with very long phases can consume a lot of memory and take longer to initialise."
      end

      def arg_defaults
        super.merge({
          :phase => 0.25,
          :phase_slide => 0,
          :phase_slide_shape => 1,
          :phase_slide_curve => 0,
          :fb => 0.75,
          :fb_slide => 0,
          :fb_slide_shape => 1,
          :fb_slide_curve => 0,
          :lop => 60,
          :lop_slide => 0,
          :lop_slide_shape => 1,
          :lop_slide_curve => 0,
          :max_phase => 2
        })
      end

      def specific_arg_info
        {
          :max_phase =>
          {
            :doc => "The maximum phase duration in beats.",
            :validations => [v_positive_not_zero(:max_phase)],
            :modulatable => false
          },

           :lop =>
          {
            :doc => "delay lowpass in midi.",
            :validations => [v_positive_not_zero(:lop)],
            :modulatable => true

          },

          :phase =>
          {
            :doc => "The time between echoes in beats.",
            :validations => [v_positive_not_zero(:phase)],
            :modulatable => true,
            :bpm_scale => true

          },

          :phase_slide =>
          {
            :doc => "Slide time in beats between phase values",
            :validations => [v_positive(:phase_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

          :fb =>
          {
            :doc => "feedback value.",
            :validations => [v_between_inclusive(:fb, 0, 1)],
            :modulatable => true
          },

          :decay_slide =>
          {
            :doc => "Slide time in beats between decay times",
            :validations => [v_positive(:decay_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

          :fb_slide =>
          {
            :doc => "Slide time in beats between feedback values",
            :validations => [v_positive(:fb_slide)],
            :modulatable => true,
            :bpm_scale => true
          },

           :lop_slide =>
          {
            :doc => "Slide time in beats between lowpass values",
            :validations => [v_positive(:lop_slide)],
            :modulatable => true,
            :bpm_scale => true
          }
        }
      end

      def kill_delay(args_h)
        cur_fb = args_h[:fb] || arg_defaults[:fb]
        cur_len = args_h[:phase] || arg_defaults[:phase]
        [-3.0 * cur_len / Math::log10(cur_fb), 0.01].max
      end

    end
