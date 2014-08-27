#########
qiime_cmd
#########

A Handy wrapper around the qiime-deploy tool
############################################
Be sure to refer to the qiime-deploy_ and the qiime-deploy-conf_
sites for documentation.

.. _qiime-deploy: https://github.com/qiime/qiime-deploy
.. _qiime-deploy-conf: https://github.com/qiime/qiime-deploy-conf


Install
#######
For Ubuntu only. Note: enable universe and multiverse packages with
the following command to get the dependencies necessary for
qiime-deploy_::

  # sed -i.bac -e '/multiverse/ s|#[ \t]*\(.*\)|\1|' /etc/apt/sources.list

Installation should be done via the apt-get command::
  
  # apt-get install -y qiime-cmd

You may need to install the Huttenhower lab repository::

  $ echo "deb http://huttenhower.sph.harvard.edu/biobakery-shop/deb-packages /" \
	| sudo bash -c "cat - >> /etc/apt/sources.list "
 
  $ wget -O- -q "http://huttenhower.sph.harvard.edu/biobakery-shop/deb-packages/biobakery.asc" \
	| sudo apt-key add -
