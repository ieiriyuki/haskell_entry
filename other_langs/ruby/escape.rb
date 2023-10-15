# 1.5 p93 trait of type
# echo '"&<>' | ruby escape.rb
require 'cgi'

raw_string = gets.chomp!
escaped_string_ = CGI.escapeHTML(raw_string)
puts escaped_string_

# エスケープ済みの文字列を独立したオブジェクトとして扱うことで再エスケープを防ぐ
class EscapedString
    def initialize(str)
        @str = CGI.escapeHTML str
    end
end

escaped_string = EscapedString.new raw_string
puts escaped_string
begin
    re_escaped_string = EscapedString.new escaped_string
rescue => e
    puts "Error: #{e.message}"
end

begin
    concat_string = raw_string + escaped_string
rescue => e
    puts "Error: #{e.message}"
end

begin
    editted_string = escaped_string.gsub('&amp;/', '&')
rescue => e
    puts "Error: #{e.message}"
end

# open class
# class EscapedString
#     def to_s
#         @str
#     end
# end
