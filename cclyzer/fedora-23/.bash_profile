# .bash_profile

export EDITOR='emacs'
export JAVA_HOME=/usr/lib/jvm/java
export LLVM_HOME=/opt/llvm/build
export TERM=xterm-256color
export COLORTERM=tilda

# LogicBlox specific

export LOGICBLOX_HOME=/opt/logicblox
export LB_DEPLOYMENT_HOME="$HOME/.lb_deployment"
export LB_CONNECTBLOX_ENABLE_ADMIN=1
export LB_PAGER_FORCE_START=true
export LB_MEM_NOWARN=true
export LD_LIBRARY_PATH="$LOGICBLOX_HOME/bin"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
pathmunge $JAVA_HOME/bin
pathmunge $LLVM_HOME/bin
pathmunge $LOGICBLOX_HOME/bin

export PATH
