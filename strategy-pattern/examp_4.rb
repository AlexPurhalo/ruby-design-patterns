# Example of the code blocks
# This is good when you have only a one method (output_report)
# otherwise better use class-based strategies
class Report
  attr_reader :title, :text
  attr_accessor :formatter
  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = [ 'Things are going', 'really, really well.' ]
    @formatter = formatter
  end
  def output_report
    @formatter.call( self )
  end
end

HTML_FORMATTER = lambda do |context|
  puts('<html>')
  puts(' <head>')
  puts(" <title>#{context.title}</title>")
  puts(' </head>')
  puts(' <body>')
  context.text.each do |line|
    puts(" <p>#{line}</p>" )
  end
  puts(' </body>')
end


report = Report.new(&HTML_FORMATTER)
report.output_report

report = Report.new do |context|
  puts("***** #{context.title} *****")
  context.text.each do |line|
    puts(line)
  end
end
report.output_report