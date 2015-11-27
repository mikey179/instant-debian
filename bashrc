export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

if [ -n "${SSH_AUTH_SOCK}" ]; then
  echo "* Detected running ssh-agent."
elif [ -d /root/.ssh ]; then
  # ensure SSH agent is running and keys are loaded when
  # .ssh folder is present
  SSH_ENV="/root/.ssh/environment"
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}"
  /usr/bin/ssh-add;
else
  echo "! Neither ssh-agent nor ssh config found, things look bad :("
fi

if [ -d $HOME/workspace ]; then
    cd workspace
fi

env zsh

