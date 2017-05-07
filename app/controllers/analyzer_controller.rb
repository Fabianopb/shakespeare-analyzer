class AnalyzerController < ApplicationController

  def index
  end

  def results
    
    @speechCount = Hash.new

    doc = Nokogiri::XML(open('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'))

    speeches = doc.css('SPEECH')
    totalLines = doc.css('LINE')
    puts totalLines.size
    speeches.each do |speech|
      speaker = speech.at_css('SPEAKER').content
      lines = speech.css('LINE')
      if speaker != 'ALL'
        @speechCount[speaker] = @speechCount[speaker].nil? ? lines.size : @speechCount[speaker] + lines.size
      end
    end

  end

end
