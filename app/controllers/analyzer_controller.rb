class AnalyzerController < ApplicationController

  def index
  end

  def results

    url = params[:play]

    @@speechCount = Hash.new
    @speechCount = @@speechCount

    begin
      doc = Nokogiri::XML(open(url))

      @title = doc.css('TITLE').first.content

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

    rescue Exception => e
      flash[:error] = 'Something went wrong, are you sure the url is correct?'
      redirect_to action: index
    end

  end

  def results_data
    data = Array.new
    @@speechCount.each do |speaker, lines|
      dataPoint = Hash.new
      dataPoint['speaker'] = speaker.capitalize
      dataPoint['lines'] = lines
      data.push dataPoint
    end
    data.sort_by! { |dataPoint| dataPoint['lines'] }
    render :json => data.reverse
  end

end
