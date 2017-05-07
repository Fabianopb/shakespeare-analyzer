class AnalyzerController < ApplicationController

  @@speechCount = Hash.new

  def index
  end

  def results

    @speechCount = @@speechCount

    doc = Nokogiri::XML(open('http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml'))

    speeches = doc.css('SPEECH')
    totalLines = doc.css('LINE')
    speeches.each do |speech|
      speaker = speech.at_css('SPEAKER').content
      lines = speech.css('LINE')
      if speaker != 'ALL'
        @@speechCount[speaker] = @@speechCount[speaker].nil? ? lines.size : @@speechCount[speaker] + lines.size
      end
    end

    @@speechCount = @speechCount

  end

  def results_data
    render :json => @@speechCount
  end

end
