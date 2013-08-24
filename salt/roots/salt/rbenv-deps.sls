rbenv-deps:
  pkg.installed:
    - pkgs:
      - bash
      - git
      - openssl
      - make
      - curl

ruby-2.0.0-p247:
  rbenv.installed:
    - default: True
    - require:
      - pkg: rbenv-deps

rbenv-script:
  cmd.script:
    - source: salt://scripts/rbenv.sh
    - require:
      - rbenv: ruby-2.0.0-p247

profile-source:
  cmd.wait:
    - name: source ~/.profile
    - watch:
      - cmd: rbenv-script
