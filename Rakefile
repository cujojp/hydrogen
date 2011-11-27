desc 'Symlink .gvimrc and .vimrc to default location'
task :build do
  begin
    File.symlink(".vim/#{'.vimrc'}", File.expand_path('~/.vimrc'))
    File.symlink(".vim/#{'.gvimrc'}", File.expand_path('~/.gvimrc'))
  rescue NotImplementedError
    puts "!!Warning!! File.symlink not supported, please link manually."
  end
end
