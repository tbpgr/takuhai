require "takuhai/version"

module Takuhai
  # Takuhai DSL
  class Dsl
    #== target server's ssh login user
    attr_accessor :_user
    #== target server name or ip
    attr_accessor :_server
    #== target files
    attr_accessor :_targets
    #== target directory
    attr_accessor :_target_dir
    #== output filename_base
    attr_accessor :_output_base_name
    #== output extension
    attr_accessor :_output_extension
    #== each line execute logic
    attr_accessor :_block

    #== set user
    #- not allow nil
    #- not allow empty
    #=== params
    #- _user: ssh login user
    def user(_user)
      raise InvalidUserError.new("#{InvalidUserError::INVALID_MESSAGE} nil") if _user.nil?
      raise InvalidUserError.new("#{InvalidUserError::INVALID_MESSAGE} empty") if _user.empty?
      @_user = _user
    end

    #== set server
    #- not allow nil
    #- not allow empty
    #=== params
    #- _server: target server name or ip
    def server(_server)
      raise InvalidServerError.new("#{InvalidServerError::INVALID_MESSAGE} nil") if _server.nil?
      raise InvalidServerError.new("#{InvalidServerError::INVALID_MESSAGE} empty") if _server.empty?
      @_server = _server
    end

    #== set targets
    #- not allow nil
    #- not allow empty
    #=== params
    #- _targets: targets files
    def targets(_targets)
      raise InvalidTargetsError.new("#{InvalidTargetsError::INVALID_MESSAGE} nil") if _targets.nil?
      raise InvalidTargetsError.new("#{InvalidTargetsError::INVALID_MESSAGE} empty") if _targets.empty?
      @_targets = _targets
    end

    #== set target_dir
    #- not allow nil
    #- not allow empty
    #=== params
    #- _target_dir: target directory
    def target_dir(_target_dir)
      raise InvalidTargetDirError.new("#{InvalidTargetDirError::INVALID_MESSAGE} nil") if _target_dir.nil?
      raise InvalidTargetDirError.new("#{InvalidTargetDirError::INVALID_MESSAGE} empty") if _target_dir.empty?
      @_target_dir = _target_dir
    end

    #== set output_base_name
    #- not allow nil
    #- not allow empty
    #=== params
    #- _output_base_name: output base-name
    def output_base_name(_output_base_name)
      raise InvalidOutputBaseNameError.new("#{InvalidOutputBaseNameError::INVALID_MESSAGE} nil") if _output_base_name.nil?
      raise InvalidOutputBaseNameError.new("#{InvalidOutputBaseNameError::INVALID_MESSAGE} empty") if _output_base_name.empty?
      @_output_base_name = _output_base_name
    end

    #== set output_extension
    #- not allow nil
    #- not allow empty
    #=== params
    #- _output_extension: output extension
    def output_extension(_output_extension)
      raise InvalidOutputExtensionError.new("#{InvalidOutputExtensionError::INVALID_MESSAGE} nil") if _output_extension.nil?
      raise InvalidOutputExtensionError.new("#{InvalidOutputExtensionError::INVALID_MESSAGE} empty") if _output_extension.empty?
      @_output_extension = _output_extension
    end

    #== set block
    #=== params
    #- _block: block(each line execute logic)
    def block(&_block)
      @_block = _block
    end

  end

  #= User Setting Error
  class InvalidUserError < StandardError
    INVALID_MESSAGE = "user not allow "
  end

  #= Server Setting Error
  class InvalidServerError < StandardError
    INVALID_MESSAGE = "server not allow "
  end

  #= Targets Setting Error
  class InvalidTargetsError < StandardError
    INVALID_MESSAGE = "targets not allow "
  end

  #= Target Directory Setting Error
  class InvalidTargetDirError < StandardError
    INVALID_MESSAGE = "target directory not allow "
  end

  #= OutputBaseName Setting Error
  class InvalidOutputBaseNameError < StandardError
    INVALID_MESSAGE = "output base name not allow "
  end

  #= OutputExtension Setting Error
  class InvalidOutputExtensionError < StandardError
    INVALID_MESSAGE = "output extension not allow "
  end
end
