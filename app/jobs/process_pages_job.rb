class ProcessPagesJob
  include SuckerPunch::Job
  require 'zip'

  def perform(user, chapter)
    dir = File.join('tmp', 'uploaded_chapters', "#{user.id}_#{Time.now.to_i}")
    FileUtils.mkdir_p(dir) unless File.directory?(dir)

    path = File.join(dir, chapter.file.original_filename)
    file = File.open(path, 'wb') { |f| f.write(chapter.file.read) }
    chapter.file.close

    Zip::File.open(path) do |zip_file|
      index = 0
      # Handle entries one by one
      zip_file.each do |entry|
        extension = File.extname entry.name
        if %(.png .jpeg .jpg).include?(extension) && entry.get_input_stream != Zip::NullInputStream
          temp = Tempfile.new(["#{user.id}_#{Time.now.to_i}".downcase, extension], 'tmp', encoding: 'ASCII-8BIT')
          temp.write(entry.get_input_stream.read)
          temp.flush
          chapter.pages.build(image: temp, number: index)
          index += 1
          temp.close
        end
      end
    end
    chapter.save
    FileUtils.remove_dir dir, true
  end
end