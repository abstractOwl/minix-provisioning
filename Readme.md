# MINIX Provisioning
Provisioning scripts for setting up a dev environment for CS170: Operating
Systems.

## Quickstart
Because MINIX does not come with curl/wget/git by default, several packages must
be installed in order to get these scripts onto the system.

Run the following to set up the environment:

```
pkgin in -y scmgit-base
git clone https://github.com/abstractOwl/minix-provisioning
cd minix-provisioning
sh setup.sh
```

## Workflow

Work in a git repository mimicking the MINIX src file structure (i.e.
`/usr/src/servers/sched` => `<repo_dir>/src/servers/sched`, where repo_dir is
the repository base directory. Only commit modified files to the repo. On MINIX,
clone your repository in `$DEV`, cd to it, and run:

```
gp
replacesrc <repo>
rr
```

to rebuild with the new files and reboot.


## Features
This environment contains several enhancements to make MINIX development easier.

### Automated Environment Setup
`git clone` your project repository to `~/dev/` to make use of the `replacesrc`
and `resetsrc` aliases.

### Automated Package Installation
Installs packages from `config/packages.txt`. Fork of this repository to create
your own package list.

### Aliases
Get to everything faster with aliases. All aliases are contained in
`config/.aliases.d/`.

#### Dev Aliases

Command     | Description                   
------------|-------------------------------------------------------------------
dev         | cd to `$DEV/$1`, i.e. `dev test` = `cd $DEV/test`
resetsrc    | Resets `/usr/src` to `/usr/minix_src_clean`
replacesrc  | Replaces `/usr/src` with `~/dev/$1/src`, i.e. `replacesrc test` replaces `/usr/src` with `$DEV/test/src`
rr          | Attempts to `make hdboot`, reboots if successful
rw          | Attempts to rebuild world, reboots if successful


#### pkgin Aliases

Command     | Description                   
------------|-------------------------------------------------------------------
p           | `pkgin`
pi          | `pkgin install`
pse         | `pkgin search`
pr          | `pkgin remove`
pu          | `pkgin up; pkgin ug`
pup         | `pkgin up`


#### git Aliases

Command     | Description                   
------------|-------------------------------------------------------------------
g           | `git`
ga          | `git add`
gb          | `git branch`
gc          | `git commit`
gcm         | `git commit -m`
gco         | `git checkout`
gd          | `git diff`
gf          | `git fetch`
gm          | `git merge`
gp          | `git push`
gpull       | `git pull`
gr          | `git reset`
grb         | `git rebase`
gs          | `git status`


## Contributing

All contributions are welcome (extra alias files, other features, etc). Feel
free to submit a pull request!

