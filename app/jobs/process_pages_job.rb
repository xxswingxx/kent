class ProcessPagesJob
  include SuckerPunch::Job
  require 'zip'

  def perform(user, chapter)
    Zip::File.open(chapter.file.path) do |zip_file|
      index = 0
      files = zip_file.select(&:file?)
      files.reject!{|f| f.name =~ /\.DS_Store|__MACOSX|(^|\/)\._/ }

      files.each do |entry|
        extension = File.extname(entry.name)

        if entry.file? && %w(.png .jpg .jpeg).include?(extension)
          puts entry.name
          temp = Tempfile.new(["#{user.id}_#{Time.now.to_i}".downcase, extension], 'tmp', encoding: 'ASCII-8BIT')
          temp.write(entry.get_input_stream.read)
          temp.flush
          chapter.pages.create(image: temp, number: index)
          index += 1
        end
      end
    end
  end
end