# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{bash_prompt,bash_functions,aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# bash completion.
if  which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ex-it/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ex-it/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ex-it/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ex-it/google-cloud-sdk/completion.bash.inc'; fi

# Surpress ZSH shell message
export BASH_SILENCE_DEPRECATION_WARNING=1

source /usr/local/bin/virtualenvwrapper.sh
