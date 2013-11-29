# encoding: utf-8
require "spec_helper"
require "takuhai_dsl"

describe Takuhai::Dsl do
  context :user do
    cases = [
      {
        case_no: 1,
        case_title: "set valid user",
        user: "app",
        expected: "app"
      },
      {
        case_no: 2,
        case_title: "set nil",
        user: nil,
        invalid: true
      },
      {
        case_no: 3,
        case_title: "set empty",
        user: "",
        invalid: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:invalid]
            lambda {takuhai.user(c[:user])}.should raise_error(Takuhai::InvalidUserError)
          else
            takuhai.user c[:user]
            actual = takuhai._user
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :server do
    cases = [
      {
        case_no: 1,
        case_title: "set valid server",
        server: "some_server",
        expected: "some_server"
      },
      {
        case_no: 2,
        case_title: "set nil",
        server: nil,
        invalid: true
      },
      {
        case_no: 3,
        case_title: "set empty",
        server: "",
        invalid: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:invalid]
            lambda {takuhai.server(c[:server])}.should raise_error(Takuhai::InvalidServerError)
          else
            takuhai.server c[:server]
            actual = takuhai._server
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :targets do
    cases = [
      {
        case_no: 1,
        case_title: "set valid targets",
        targets: "some_targets",
        expected: "some_targets"
      },
      {
        case_no: 2,
        case_title: "set nil",
        targets: nil,
        invalid: true
      },
      {
        case_no: 3,
        case_title: "set empty",
        targets: "",
        invalid: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:invalid]
            lambda {takuhai.targets(c[:targets])}.should raise_error(Takuhai::InvalidTargetsError)
          else
            takuhai.targets c[:targets]
            actual = takuhai._targets
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :target_dir do
    cases = [
      {
        case_no: 1,
        case_title: "set valid target_dir",
        target_dir: "/home/some_user/tmp",
        expected: "/home/some_user/tmp"
      },
      {
        case_no: 2,
        case_title: "set nil",
        target_dir: nil,
        invalid: true
      },
      {
        case_no: 3,
        case_title: "set empty",
        target_dir: "",
        invalid: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:invalid]
            lambda {takuhai.target_dir(c[:target_dir])}.should raise_error(Takuhai::InvalidTargetDirError)
          else
            takuhai.target_dir c[:target_dir]
            actual = takuhai._target_dir
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :output_base_name do
    cases = [
      {
        case_no: 1,
        case_title: "set valid output_base_name",
        output_base_name: "base_name",
        expected: "base_name"
      },
      {
        case_no: 2,
        case_title: "set nil",
        output_base_name: nil,
        invalid: true
      },
      {
        case_no: 3,
        case_title: "set empty",
        output_base_name: "",
        invalid: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:invalid]
            lambda {takuhai.output_base_name(c[:output_base_name])}.should raise_error(Takuhai::InvalidOutputBaseNameError)
          else
            takuhai.output_base_name c[:output_base_name]
            actual = takuhai._output_base_name
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :output_extension do
    cases = [
      {
        case_no: 1,
        case_title: "set valid output_extension",
        output_extension: "tsv",
        expected: "tsv"
      },
      {
        case_no: 2,
        case_title: "set nil",
        output_extension: nil,
        invalid: true
      },
      {
        case_no: 3,
        case_title: "set empty",
        output_extension: "",
        invalid: true
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:invalid]
            lambda {takuhai.output_extension(c[:output_extension])}.should raise_error(Takuhai::InvalidOutputExtensionError)
          else
            takuhai.output_extension c[:output_extension]
            actual = takuhai._output_extension
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :block do
    cases = [
      {
        case_no: 1,
        case_title: "set valid block",
        block: true,
        param1: "f",
        param2: "line",
        expected: "linetest"
      },
      {
        case_no: 2,
        case_title: "set nil",
        block: nil,
        expected: nil
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          takuhai = Takuhai::Dsl.new

          # -- when --
          if c[:block]
            takuhai.block {|f, line|line + "test"}
            actual = takuhai._block.call(c[:param1], c[:param2])
          else
            takuhai.block
            actual = takuhai._block
          end

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

end
