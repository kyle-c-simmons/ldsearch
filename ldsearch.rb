#!/usr/bin/env ruby

# Name: ldsearch
# Description: Search through a directory recursively and output to a wordlist
# Author: Kyle Simmons
# Github: https://github.com/kyle-c-simmons/ldsearch

require 'optparse'

class LdSearch

  def main()
    options = {}

    OptionParser.new do |parser|
      
      parser.banner = "Usage: ldsearch.rb --directory [directory]"

      parser.on("-h", "--help", "Shows the help options.") do ||
        puts parser
      end

      parser.on("-d", "--directory NAME", "Generates a wordlist of the directory.") do |v|
        options[:dir] = v
      end

      parser.on("-n", "--extensions", "Removes all extensions from the wordlist.") do |v|
        options[:extensions] = v
      end
      
      if ARGV.length == 0
        puts parser
      end
    end.parse!
    
    directory = options[:dir]
    
    if options[:dir]
      files = Dir.glob("#{directory}/**/*", File::FNM_DOTMATCH)

      puts "Creating wordlist for #{options[:dir]}"

      for getFile in files
        reverseFile = getFile.reverse 
        cleanFile = reverseFile.partition('/').first
        reverseBack = (cleanFile.reverse + "\n")
        
        # Delete extensions
        if options[:extensions] 
          deleteExtensions = reverseBack.slice(0.. (reverseBack.index('.')))
          deleteExtensions.delete! '.'
        end

        # output to file
        begin 
          File.open("ldsearch-out.txt", "a+") do |file|

            if options[:extensions]
              file.puts(deleteExtensions)
            else
              file.write(reverseBack)
            end

            system("awk '!seen[$0]++' ldsearch-out.txt > ldsearch-temp.txt")
            system("echo #{directory} >> ldsearch-temp.txt")
          end
        rescue StandardError => e
          $stderr.puts "File cannot be created, please try again.#{e}"
        end
      end
      
      # if argument true, remove extension? 
      system("mv ldsearch-temp.txt ldsearch-out.txt")
      puts "\nWords generated:"
      system('wc -l < ldsearch-out.txt')
    end
  end
end

LdsearchObj = LdSearch.new()
LdsearchObj.main
