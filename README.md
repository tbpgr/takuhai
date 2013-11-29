# Takuhai

Takuhai downloads files from remote server by ssh/scp command.

After download, you can add any logic for each line.

※Takuhai means deliver.

## When Use This Gem?

* You want to download files and any edit or check in regularly. It's boiler template work!

## Precondition

* Public key authentication settings must be done.

## Installation

Add this line to your application's Gemfile:

    gem 'takuhai'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install takuhai

## Usage

Fist, generate Takuhaifile template.

    $ takuhai init

Second, edit your Takuhaifile file.

Third, execute. You get converted file from remote.

    $ takuhai

    or

    $ takuhai collect

You can confirm help

    $ takuhai help
    $ takuhai h

You can confirm version

    $ takuhai version
    $ takuhai v

## Takuhaifile

This file defines download ,convert and output spec.

Template have following contents.

You can start to edit from this template.

But if you want to write DSL-text from new file, you can.

You can confirm dsl syntax from this template file's comments.

    # encoding: utf-8

    # write your ssh login user name. this attribute is required.
    # ex:user "app"
    user "TODO: user"

    # write your ssh login server name or server ip. this attribute is required.
    # ex1:server "some_server"
    # ex2:user "192.168.10.11"
    server "TODO: server"

    # write your targets. this attribute is required.
    # ex1:targets "app.log-2011-10-*"
    # ex2:targets "app.log-2011-10-01 app.log-2011-10-02 app.log-2011-10-05"
    targets "TODO: targets"

    # write your log directory. this attribute is required.
    # ex:target_dir "/home/app/some_system/log/production"
    target_dir "TODO: target_dir"

    # write your output_base_name. this value is using in tarball file name and output file name. this attribute is required.
    # ex:output_base_name "server_log"
    output_base_name "output"

    # write output file's extension. this attribute is required.
    # ex:output_extension "tsv"
    output_extension "txt"

    # if you want to execute some logic for line data, edit following code.
    # ex: if line have "ERROR", append !!ERROR!! to line String.
    # block do |file, line|
    #   line = "!!ERROR!!" + line if line.include?("ERROR")
    #   line
    # end
    block do |file, line|
      line
    end

## Sample Usage
### Spec
* You get files[file1.txt, file2.txt, file3.txt] from remote server.
* file1.txt's contents is following.
~~~
[user = test1]
[operation = search]
[password = test1pass]
~~~

* file2.txt's contents is following.
~~~
[user = test2]
[operation = search]
[password = test2pass]
~~~

* file3.txt's contents is following.
~~~
[user = test3]
[operation = search]
[password = test3pass]
~~~

* If file contain [password = some_password], you mask password.
* Before execute takuahi, public key authentication settings must be done.
* Remote user is app
* Remote server is 192.168.11.11
* Target directory is /home/app/some_product/log
* Output directory is ./masked_files
* Output base name is masked_files
* Output extension is txt

### Steps
Create Template

    $ takuhai init

Edit Takuhaifile

    # encoding: utf-8
    user "app"
    server "192.168.11.11"
    targets "file*txt"
    # targets "file1.txt file2.txt file3.txt"
    target_dir "/home/app/some_product/log"
    output_base_name "masked_files"
    output_extension "txt"
    block do |file, line|
      if line.match /\[password = (.*)\]/
        line.gsub!($1, '*'*$1.size)
      end
      line
    end

output file tree is ...

    │  Takuhaifile
    │  masked_files20131129222450.txt
    │
    └─masked_files20131129222450
            file1.txt
            file2.txt
            file3.txt
            masked_files.20131129222450.tar.gz

masked_files20131129222450.txt contents is ...

    [user = test1]
    [operation = search]
    [password = *********]
    [user = test2]
    [operation = search]
    [password = *********]
    [user = test3]
    [operation = search]
    [password = *********]

## Constraint

* This tool have not good performance. So if target file size is huge, you must not use this gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
