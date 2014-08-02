# encoding: utf-8
module JosephMemosHelper
  def move_imgs_to_dest
    FileUtils.cp(@imgs_archeive, @dest_dir)
  end

  def unzip_imgs
    Dir.chdir(@dest_dir)
    compressed_imgs_fname = Pathname.new(@imgs_archeive).basename
    Zip::ZipFile.open(compressed_imgs_fname) do |zip_file|
      zip_file.each do |f|
        f_path=File.join(@dest_dir, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        if f.name =~ /.*(jpg|png|gif)$/
          zip_file.extract(f, f_path) unless File.exist?(f_path)
        end
      end
    end
  end

  def write_info_in_txt
    Dir.chdir(@dest_dir)
    f = open("words.txt", 'wb')
    f.puts(@joseph_memo.title)
    f.puts(@joseph_memo.words)
    f.puts(@joseph_memo.videos)
    f.puts("name:"+@joseph_memo.name)
    f.close
  end

  def generate_view
    working_dir = File.expand_path("joseph_memo/erb", File.dirname(Rails.root))
    Dir.chdir(working_dir)
    system("ruby generate.rb")
  end
end
