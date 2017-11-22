# Simplify the flow of data but increases the coupling between the context and the strategy.
class Report
  attr_reader :title, :text
  attr_accessor :formatter
  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end
  def output_report
    @formatter.output_report(self)
  end
end

class Formatter # abstract superclass for HTMLFormatter and PlainTextFormatter classes
  def output_report(context)
    raise 'Abstract method called'
  end
end

class HTMLFormatter < Formatter # subclass of Formatter class
  def output_report(context) # context class retrieving
    puts('<html>')
    puts(' <head>')
    puts(" <title>#{context.title}</title>")
    puts(' </head>')
    puts(' <body>')
    context.text.each do |line| # context method usage
      puts(" <p>#{line}</p>")
    end
    puts(' </body>')
    puts('</html>')
  end
end

class PlainTextFormatter < Formatter
  def output_report(context)
    puts("***** #{context.title} *****")
    context.text.each do |line|
      puts(line)
    end
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report