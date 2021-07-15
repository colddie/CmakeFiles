# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

test -s ~/.alias && . ~/.alias || true

#export CC=/cm/local/apps/gcc/7.2.0/bin/gcc
#export CXX=/cm/local/apps/gcc/7.2.0/bin/c++

#export CC=/usr/bin/gcc
#export CXX=/usr/bin/c++

FSLDIR=/usr/local/fsl
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
source $FSLDIR/etc/fslconf/fsl-devel.sh
export FSLDEVDIR=$FSLDIR/

source /install/root/bin/thisroot.sh

export PATH=$PATH:/code/c_programs/tpcclib-master/build/bin
export PATH=$PATH:/bin/fsl/install/bin
export PATH=$PATH:/bin/RTK-1.4.0/build/install/bin
export PATH=$PATH:/code/c_programs/brain_phantom-master
export PATH=$PATH:/code/c_programs/UnbiasedNonLocalMeans/bin/Linux
export PATH=$PATH:/bin/fsl/install/bin
export PATH=$PATH:/bin/PETPVC/build/install/bin
export PATH=$PATH:/bin/plastimatch-1.9.0/build
export PATH=$PATH:/install/itksnap-3.8.0-20190612-Linux-gcc64/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/install/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/tpcclib/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/RTK-1.4.0/build/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/SimpleElastix/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/SimpleElastix/build/Elastix-build/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/kernel
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/listmode/idl/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/listmode/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/mc_code/idl/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/mc_code/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/nonlocalmeans
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/registrationbase/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/rtkwrapper_gpu
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/code/c_programs/tpcclib-master/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/armadillo-9.800.3/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/dlib-19.19/install/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/install/elastix-4.9.0/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/fsl/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/InsightToolkit-4.13.2/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/InsightToolkit-4.9.1/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/InsightToolkit-5.0.1/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/libcmaes-master/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/mcmc-master/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/optim-master/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/bin/pagmo2/build
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/install/itksnap-3.8.0-20190612-Linux-gcc64/lib/


#export ELASTIX_INCLUDE_PATH=/install/elastix-4.9.0/install/include
export EIGEN3_INCLUDE_PATH=/bin/eigen-3.3.7/Eigen/src
export EIGEN_INCLUDE_PATH=/bin/eigen-3.3.7
export DLIB_INCLUDE_PATH=/bin/dlib-19.19/install/include/dlib
export ARMA_INCLUDE_PATH=/bin/armadillo-9.800.3/include
export BOOST_INCLUDE_PATH=/usr/include/boost
export PAGMO_INCLUDE_PATH=/bin/pagmo2/include
export OPTIM_INCLUDE_PATH=/bin/optim-master/include
export MCMC_INCLUDE_PATH=/bin/mcmc-master/include
export SPLINE_USE_FILE=/bin/spline-master/src
#export TPC_INCLUDE_PATH=/bin/tpcclib/build/lib/include
export TPC_INCLUDE_PATH=/code/c_programs/tpcclib-master/build/lib/include
export CMAES_INCLUDE_PATH=/bin/libcmaes-master/install/include/libcmaes
#export TPC_LIB_PATH=/bin/tpcclib/build/lib
export TPC_LIB_PATH=/code/c_programs/tpcclib-master/build/lib
export MCMC_LIB_PATH=/bin/mcmc-master/install/lib

export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

alias sudo='sudo '
alias imagej='/install/Fiji.app/ImageJ-linux64'
alias smartgit='/install/smartgit/bin/smartgit.sh'
alias vscode='code'

