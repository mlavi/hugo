https://brew.sh || https://docs.brew.sh/Manpage.html

https://caskroom.github.io/search
https://formulae.brew.sh/formula/
brew search
brew cask list && brew cask outdated && brew cask update
### fish, vagrant-managr, node, easysimbl?

    brew --version && brew update && brew upgrade && brew cask upgrade && \
    pushd ~/Documents/github.com/mlavi/hugo/drafts/ && brew bundle dump --force && popd

brew deps --tree --installed
brew desc -n /libff*/

# Install
xcode-select --install
sudo chown -R $(whoami) /usr/local/sbin

# Node #
Binary install from nodejs.org

# bash
In order to use this build of bash as your login shell, it must be added to /etc/shells.
🍺  /usr/local/Cellar/bash/4.4.23: 146 files, 8.8MB
$ which bash
/usr/local/bin/bash

# removed cask cdock, no longer opensource?

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

zsh completions have been installed to:
  /usr/local/share/zsh/site-functions

Warning: Accessibility access cannot be enabled automatically on this version of macOS.
See System Preferences to enable it manually.
🍺  amethyst was successfully installed!

https://github.com/Xfennec/progress

# python

1. References:
  2. http://docs.python-guide.org/en/latest/dev/virtualenvs/
1. sudo easy_install pip
2. sudo pip install virtualenv
  3. https://virtualenv.pypa.io/en/latest/installation.html
1. example:
  2. cd container-infrastructure-strategy-slides
  3. virtualenv virtualenv
  4. source virtualenv/bin/activate
  5. pip install landslide
    6. https://github.com/adamzap/landslide/
  1. pip install watchdog && brew install libyaml
    2. https://pypi.python.org/pypi/watchdog
    3. https://pythonhosted.org/watchdog/installation.html#dependencies
    4. https://github.com/gorakhargosh/watchdog
  1. watchmedo shell-command --recursive \
    --patterns="*.md" --command='landslide --embed --relative
    presenation.md' .
  2. brew install aspell
  3. find content -name "*.md" -execdir aspell --mode=html
    --warn check {} \;

2018-01-21 12:24:22 ☆  Marks-MacBook-Air-2 in ~
Marks-MacBook-Air-2 ~> pip --version
pip 6.1.1 from /Library/Python/2.7/site-packages/pip-6.1.1-py2.7.egg (python 2.7)

mark@Marks-MacBook-Air-2 ~> pip install --upgrade sphinx
You are using pip version 6.1.1, however version 9.0.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.

# Can't remove/upgrade six: https://github.com/pypa/pip/issues/3165
pip install --upgrade sphinx --ignore-installed six

==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only..

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/readline/lib
    CPPFLAGS: -I/usr/local/opt/readline/include

==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides an older sqlite3.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/sqlite/lib
    CPPFLAGS: -I/usr/local/opt/sqlite/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/sqlite/lib/pkgconfig

This formula is keg-only, which means it was not symlinked into /usr/local,
because some formulae require a newer version of libffi.

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/libffi/lib
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/libffi/lib/pkgconfig

==> Caveats
A CA file has been bootstrapped using certificates from the SystemRoots
keychain. To add additional certificates (e.g. the certificates added in
the System keychain), place .pem files in
  /usr/local/etc/openssl/certs

and run
  /usr/local/opt/openssl/bin/c_rehash

This formula is keg-only, which means it was not symlinked into /usr/local,
because Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/openssl/lib
    CPPFLAGS: -I/usr/local/opt/openssl/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/openssl/lib/pkgconfig

==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD gettext library & some software gets confused if both are in the library path.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/gettext/lib
    CPPFLAGS: -I/usr/local/opt/gettext/include

==> Caveats
==> emacs-mac
This is YAMAMOTO Mitsuharu's "Mac port" addition to
GNU Emacs 26. This provides a native GUI support for Mac OS X
10.6 - 10.14. After installing, see README-mac and NEWS-mac
in /usr/local/opt/emacs-mac for the port details.

Emacs.app was installed to:
  /usr/local/opt/emacs-mac

To link the application to default Homebrew App location:
  ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications
Other ways please refer:
  https://github.com/railwaycat/homebrew-emacsmacport/wiki/Alternative-way-of-place-Emacs.app-to-Applications-directory

For an Emacs.app CLI starter, see:
  https://gist.github.com/4043945This is YAMAMOTO Mitsuharu's "Mac port" addition to
GNU Emacs 26. This provides a native GUI support for Mac OS X
10.6 - 10.13. After installing, see README-mac and NEWS-mac
in /usr/local/opt/emacs-mac for the port details.

Emacs.app was installed to:
  /usr/local/opt/emacs-mac

To link the application to default Homebrew App location:
  brew linkapps
or:
  ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications
Other ways please refer:
  https://github.com/railwaycat/homebrew-emacsmacport/wiki/Alternative-way-of-place-Emacs.app-to-Applications-directory

For an Emacs.app CLI starter, see:
  https://gist.github.com/4043945

==> Caveats
MPD requires a config file to start.
Please copy it from /usr/local/etc/mpd/mpd.conf into one of these paths:
  - ~/.mpd/mpd.conf
  - ~/.mpdconf
and tailor it to your needs.

To have launchd start mpd now and restart at login:
  brew services start mpd
Or, if you don't want/need a background service you can just run:
  mpd

==> Caveats
OPAM uses ~/.opam by default for its package database, so you need to
initialize it first by running (as a normal user):

$  opam init

Run the following to initialize your environment variables:

$  eval `opam config env`

To export the needed variables every time, add them to your dotfiles.
  * On Bash, add them to `~/.bash_profile`.
  * On Zsh, add them to `~/.zprofile` or `~/.zshrc` instead.

Documentation and tutorials are available at https://opam.ocaml.org, or
via "man opam" and "opam --help".


==> Caveats
Example configuration has been installed to:
  /usr/local/opt/tmux/share/tmux

==> Caveats
A CA file has been bootstrapped using certificates from the system
keychain. To add additional certificates, place .pem files in
  /usr/local/etc/openssl@1.1/certs

and run
  /usr/local/opt/openssl@1.1/bin/c_rehash

This formula is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/openssl@1.1/lib
    CPPFLAGS: -I/usr/local/opt/openssl@1.1/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/openssl@1.1/lib/pkgconfig

==> Pouring coreutils-8.29.el_capitan.bottle.tar.gz
==> Caveats
All commands have been installed with the prefix 'g'.

If you really need to use these commands with their normal names, you
can add a "gnubin" directory to your PATH from your bashrc like:

    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

Additionally, you can access their man pages with normal names if you add
the "gnuman" directory to your MANPATH from your bashrc as well:

    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

==> Summary
🍺  /usr/local/Cellar/coreutils/8.29: 430 files, 9MB

==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides an older sqlite3.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/sqlite/lib
    CPPFLAGS: -I/usr/local/opt/sqlite/include
For pkg-config to find this software you may need to set:
    PKG_CONFIG_PATH: /usr/local/opt/sqlite/lib/pkgconfig

🍺  xquartz was successfully installed!
==> Moving App 'Dia.app' to '/Applications/Dia.app'.
🍺  dia was successfully installed!

brew cask install keepassxc

https://keepassxc.org/

If you are on a Mac and use Homebrew.sh: brew cask install keepassxc
https://keepassxc.org/docs/#faq-browser
then install the Chrome extension from above.

==> Pouring coreutils-8.30.high_sierra.bottle.tar.gz
==> Caveats
All commands have been installed with the prefix 'g'.

If you really need to use these commands with their normal names, you
can add a "gnubin" directory to your PATH from your bashrc like:

    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

Additionally, you can access their man pages with normal names if you add
the "gnuman" directory to your MANPATH from your bashrc as well:

    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

==> Pouring kubernetes-cli-1.11.0.high_sierra.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

zsh completions have been installed to:
  /usr/local/share/zsh/site-functions

==> Pouring mpd-0.20.20_1.high_sierra.bottle.tar.gz
==> Caveats
To have launchd start mpd now and restart at login:
  brew services start mpd
Or, if you don't want/need a background service you can just run:
  mpd /usr/local/etc/mpd/mpd.conf

This is YAMAMOTO Mitsuharu's "Mac port" addition to
GNU Emacs 26. This provides a native GUI support for Mac OS X
10.6 - 10.13. After installing, see README-mac and NEWS-mac
in /usr/local/opt/emacs-mac for the port details.

Emacs.app was installed to:
  /usr/local/opt/emacs-mac

To link the application to default Homebrew App location:
  brew linkapps
or:
  ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications
Other ways please refer:
  https://github.com/railwaycat/homebrew-emacsmacport/wiki/Alternative-way-of-place-Emacs.app-to-Applications-directory

For an Emacs.app CLI starter, see:
  https://gist.github.com/4043945
