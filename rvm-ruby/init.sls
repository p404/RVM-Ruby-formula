rvm-deps:
  pkg.installed:
    - names:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core
      - gnupg

  cmd.run:
    - name: gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    - unless: gpg --fingerprint | fgrep 'Key fingerprint = 409B 6B17 96C2 7546 2A17  0311 3804 BB82 D39D C0E3'

ruby-{{ salt['pillar.get']('ruby:version') }}:
  rvm.installed:
    - default: True
    - require:
      - pkg: rvm-deps
      - cmd: rvm-deps
