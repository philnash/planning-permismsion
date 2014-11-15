require 'open-uri'

class PlanImporter
  def initialize(opts={})
    @url = opts[:url]
    @path = opts[:path]
    raise ArgumentError if @url.nil? && @path.nil?
  end

  def download
    FileUtils.mkdir_p(Rails.root + 'csvs')
    path = Rails.root + "csvs/Plans-#{Time.now.to_i}.csv"
    File.open(path, 'wb') do |file|
      file << open(@url).read
    end
    @path = path
  end

  def import
    CSV.foreach(@path, headers: true) do |row|
      if !Plan.find_by(remote_id: row[4])
        Plan.create({
          address: row[9],
          description: row[10],
          remote_id: row[4]
        })
      end
    end
  end
end
