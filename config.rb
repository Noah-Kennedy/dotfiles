# frozen_string_literal: true

def main
  op = operation
  pms = package_manager

  if op == :setup
    setup(pms)
  elsif op == :sync
    pms.each(&:sync)
  elsif op == :update
    pms.each(&:update)
  elsif op == :install
    pms.each(&:install)
  elsif op == :remove
    pms.each(&:remove)
  else
    raise 'Developer screwed up.'
  end
end

def setup(os)
  if os == :arch
    pcm = Pacman.new
    yay = Yay.new
    cgo = Cargo.new

    pcm.update
    pcm.sync

    yay.update
    yay.sync

    cgo.sync

    system('cp -rf ./arch-config/i3 ~/.config')
    system('mdkir ~/.config/nvim')
    system('cp ./arch-config/init.vim ~/.config/nvim')
    system('cp ./arch-config/.zshrc ~')
    system('cp ./arch-config/.Xresources ~')
    system('cp ./arch-config/compton.conf ~/.config/')
    system('cp -r ./arch-config/polybar ~/.config/')
  elsif os == :ubuntu
    apt = Apt.new
    pip = Pip.new
    cgo = Cargo.new

    apt.update

    apt.sync

    pip.sync

    cgo.sync

    system('cp -rf ./ubuntu-config/i3 ~/.config')
    system('mdkir ~/.config/nvim')
    system('cp ./ubuntu-config/init.vim ~/.config/nvim')
    system('cp ./ubuntu-config/.zshrc ~')
    system('cp ./ubuntu-config/.Xresources ~')
    system('cp ./ubuntu-config/compton.conf ~/.config/')
    system('cp -r ./ubuntu-config/polybar ~/.config/')
  end
end

def operation
  if ARGV.include?('--setup')
    :setup
  elsif ARGV.include?('--sync') || ARGV.include?('-s')
    :sync
  elsif ARGV.include?('--update' || ARGV.include?('-u'))
    :update
  elsif ARGV.include?('--install') || ARGV.include?('-i')
    :install
  elsif ARGV.include?('--remove') || ARGV.include?('-r')
    :remove
  else
    raise 'Unsupported Operation Requested'
  end
end

def package_manager
  if ARGV.include?('--setup')
    if ARGV.include?('--arch')
      :arch
    elsif ARGV.include?('--ubuntu')
      :ubuntu
    end
  elsif ARGV.include?('--pacman') || ARGV.include?('-p')
    [Pacman.new]
  elsif ARGV.include?('--apt' || ARGV.include?('-a'))
    [Apt.new]
  elsif ARGV.include?('--aur')
    [Yay.new]
  elsif ARGV.include?('--cargo') || ARGV.include?('-c')
    [Cargo.new]
  elsif ARGV.include?('--pip')
    [Pip.new]
  elsif ARGV.include?('--arch')
    [Cargo.new, Pacman.new, Yay.new]
  else
    raise 'Unsupported Package Manager Requested'
  end
end

def append(filename, line)
  open(filename, 'a') { |f| f.puts line }
end

def install_all(package_list)
  package_list.each(&method(:install))
end

class Pip
  def install(package)
    system("/usr/bin/yes | pip install #{package}")
  end

  def update
    raise 'Pip has no system for updating!'
  end

  def sync
    File.readlines('./packages/pip.pkgs').each(&method(:install))
  end

  def add(package)
    install(package)
    append('./packages/pip.pkgs', package)
  end
end

class Pacman
  def install(package)
    system("sudo pacman -S #{package} --noconfirm")
  end

  def sync
    File.readlines('./packages/pacman.pkgs').each(&method(:install))
  end

  def update
    system('sudo pacman -Syu --noconfirm')
  end

  def add(package)
    install(package)
    append('./packages/pacman.pkgs', package)
  end
end

class Yay
  def install(package)
    system("yay -S #{package} --noconfirm")
  end

  def update
    system('yay -Syu --noconfirm')
  end

  def sync
    File.readlines('./packages/aur.pkgs').each(&method(:install))
  end

  def add(package)
    install(package)
    append('./packages/aur.pkgs', package)
  end
end

class Apt
  def install(package)
    system("sudo apt install #{package} -y")
  end

  def update
    system('sudo apt update -y')
    system('sudo apt dist-upgrade -y')
    system('sudo apt autoremove -y')
  end

  def add_ppa(ppa)
    system("sudo add-apt-repository #{ppa} -y")
    update
  end

  def sync
    File.readlines('./packages/ubuntu-18_04.ppas').each(&method(:add_ppa))
    File.readlines('./packages/ubuntu-18_04.pkgs').each(&method(:install))
  end

  def uber_add_ppa(ppa)
    add_ppa(ppa)
    append('./packages/ubuntu-18_04.ppas', package)
  end

  def add(package)
    install(package)
    append('./packages/ubuntu-18_04.pkgs', package)
  end
end

class Cargo
  def install(package)
    system("Cargo install #{package}")
  end

  def update
    system('Cargo install-update -a')
  end

  def add(package)
    install(package)
    append('./packages/cargo.pkgs', package)
  end

  def sync
    File.readlines('./packages/cargo.pkgs').each(&method(:install))
  end
end

def command?(command)
  system("which #{command} > /dev/null 2>&1")
end

main