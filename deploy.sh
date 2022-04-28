tar -cf liv-shell-scripts.tar *.sh
jfrog rt u liv-shell-scripts.tar liv-operation/liv-shell-scripts/liv-shell-scripts-$(git rev-parse HEAD | cut -c1-8).tar
jfrog rt u liv-shell-scripts.tar liv-operation/liv-shell-scripts/liv-shell-scripts-latest.tar