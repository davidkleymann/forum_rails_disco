task :dbreset do
  ['domain_dev.sqlite3', 'projection_dev.sqlite3'].each do |file|
    path = File.expand_path("../../../db/" + file, __FILE__)
    File.delete(path) if File.exists? path
  end
  Rake::Task["drails:db:setup"].invoke
end