# Building ISO
To build the ISO you must have the *archiso* package
>git clone https://github.com/DowntownLaboratory/Huxley.git
>cd Huxley
>./create-installer.sh

This will spit out a .iso installer in Huxley/out/

# Docker
To prevent permission errors from containers remapping to an incorrect user, docker containers that need persistent bind mount
should use the docker user/group as the UID/GID in their respective container.

A root /docker folder has been created to allow the containers to store their data. Another benefit of restricting the user
is that the user cannot access anything outside of the docker folder.

## Reference
https://wiki.archlinux.org/index.php/archiso

