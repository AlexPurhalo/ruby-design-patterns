class Formatter
  def output_report( title, text )
    raise 'Abstract method called'
  end
end

class HTMLFormatter < Formatter # class from a family of objects (of strategies)
  def output_report( title, text )
    puts('<html>')
    puts(' <head>')
    puts(" <title>#{title}</title>")
    puts(' </head>')
    puts(' <body>')
    text.each do |line|
      puts(" <p>#{line}</p>" )
    end
    puts(' </body>')
    puts('</html>')
  end
end

class PlainTextFormatter < Formatter # also - strategy class has same methods, so represent the same interface
  def output_report(title, text)
    puts("***** #{title} *****")
    text.each do |line|
      puts(line)
    end
  end
end

class Report # context class
  attr_reader :title, :text
  attr_accessor :formatter
  def initialize(formatter)
    @title = 'Monthly Report'
    @text = [ 'Things are going', 'really, really well.' ]
    @formatter = formatter
  end
  def output_report
    @formatter.output_report( @title, @text )
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report