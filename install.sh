#!/bin/bash

depconf_url="https://github.com/qiime/qiime-deploy-conf.git"
dep_url="https://github.com/qiime/qiime-deploy.git"
here=$(readlink -f "${0}" | sed -e 's#\(.*/\).*#\1#g')

install_dir="${1}"

git clone "${depconf_url}" "${install_dir}/depconf/"
git clone "${dep_url}" "${install_dir}/qiime_deploy/"

# todo: put this somewhere before the install
# sed -i.bac -e '/multiverse/ s|#[ \t]*\(.*\)|\1|' /etc/apt/sources.list

# try to run the qiime-deploy script a few times; it generally
# installs everything after three tries. (arbitrary; feel free to improve)
for i in $(seq 3); do 
    echo "running install step $i..."
    python "${install_dir}/qiime_deploy/qiime-deploy.py" \
	-f "${install_dir}/depconf/qiime-1.8.0/qiime.conf" \
	"${install_dir}/qiime" \
	>> "${install_dir}/install_log.txt" \
	2>&1
done

# qiime-deploy likes to insert a 'source /foo/baz/activate.sh' into
# the user's .bashrc file. Take that madness out.
sed -i.bac -e '/^source .*activate.sh/ d' ~/.bashrc

# Prime the wrapper script with the virtualenv that qiime-deploy so
# kindly made for use
sed -e 's|LOCATION|'"${install_dir}"'/qiime/activate.sh|' "${here}/qiime_cmd" > /usr/bin/qiime_cmd

