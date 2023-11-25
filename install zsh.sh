#install zsh:
echo '--------------------------------------------------'
echo '|            Установка оболочки zsh              |'
echo '--------------------------------------------------'
#zsh
sudo pacman -S zsh --noconfirm
#oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#chsh
(  echo $pass 
   echo $pass ) | chsh -s /usr/bin/zsh
#chsh
(  echo $pass 
   echo $pass ) | sudo chsh -s /usr/bin/zsh
#ДАЛЕЕ ЖМЕМ zsh И ПРОДОЛЖАЕМ ТАМ:
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#
mv zsh-syntax-highlighting .zsh-syntax-highlighting
#
echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
#
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#
sudo sed -i 's|# export PATH=$HOME/bin:/usr/local/bin:$PATH|export PATH=$HOME/bin:/usr/local/bin:$PATH|g' ~/.zshrc
#
sudo sed -i 's|plugins=(git)|plugins=(git zsh-autosuggestions sudo)|g' ~/.zshrc
#
source ~/.zshrc
