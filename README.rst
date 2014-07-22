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

Installation should be done via the biobakery_pkg command_::
  
  # biobakery_pkg install qiime_cmd


.. _command: https://bitbucket.org/biobakery/biobakery/src/a1859c354bc9a190dc25f8d21a9f0443d86dc6dc/repository/biobakery_pkg?at=default

