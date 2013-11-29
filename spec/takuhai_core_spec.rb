# encoding: utf-8
require "spec_helper"
require "takuhai_core"

describe Takuhai::Core do
  context :init do
    cases = [
      {
        case_no: 1,
        case_title: "output template",
        expected: Takuhai::Core::TAKUHAI_TEMPLATE
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Core.new

          # -- when --
          takuhai.init

          # -- then --
          actual = File.open(Takuhai::Core::TAKUHAI_FILE) {|f|f.read}
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        return unless File.exists? Takuhai::Core::TAKUHAI_FILE
        File.delete(Takuhai::Core::TAKUHAI_FILE)
      end
    end
  end
end
