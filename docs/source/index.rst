.. mldev documentation master file

MLDev. Experiment Reproducibility
=================================

.. toctree::
   :hidden:

   self

This is the official documentation for the MLDev software.
MLDev facilitates running data science experiments,
help in results presentation and eases paper preparation for students,
data scientists and researchers.

The MLDev software provides the following features to help with automating machine learning experiments:

 - Configure stages and parameters of a data science experiment separately from your code
 - Conduct a repeatable experiment in Google Colab or PaperSpace
 - Keep versions of your code, results and intermediate files on Google Drive (other repos coming soon)
 - Use a variety of pre-built templates to get started: see
   `template-default <https://gitlab.com/mlrep/template-default>`_
   and `template-intelligent-systems <https://gitlab.com/mlrep/template-intelligent-systems>`_

MLDev also provides some services that run alongside your experiment code:

 - You can have the notifications via Telegram about the exeptions while training your model
 - Keep updated on current experiment state using TensorBoard (even on Colab)
 - Deploy and demo your model with a model controller (feature in progress)

Quick setup
-----------

MLDev is currently in Development stage.

Get the latest version of our install file to your local machine and run it.

.. code-block:: console

   $ curl https://gitlab.com/mlrep/mldev/-/raw/develop/install_mldev.sh -o install_mldev.sh
   $ chmod +x ./install_mldev.sh
   $ ./install_mldev.sh base


You may be asked for :code:`root` privileges if there are system packages to be installed.

Wait a couple of minutes until installation will be done and then you are almost
ready to use our instrument, congrats!

Then get the default demo experiment

.. code-block:: console

   $ mldev init <new_folder>


Answer the questions the setup wizard asks or skip where possible.

Then run the default pipeline of the experiment

.. code-block:: console

   $ cd <new_folder>
   $ mldev run


User documentation
------------------

.. toctree::
   :maxdepth: 2

   mldev-tutorial-basic
   mldev-user-guide
   mldev-collab-tool

See more at the project `Wiki <https://gitlab.com/mlrep/mldev/-/wikis>`_

Developer docs
--------------

.. toctree::
   :maxdepth: 2

   mldev-contributing
   mldev.develop


Please check the `CONTRIBUTING.md <https://gitlab.com/mlrep/mldev/-/blob/develop/CONTRIBUTIONG.md>`_
guide if you'd like to participate in the project, ask a question or give a suggestion.

Project sponsors and supporters
-------------------------------

.. image:: wikis/images/fund-logo.png
   :alt: MIPT Fund
   :target: MIPT Fund
   :height: 100px

.. image:: wikis/images/mipt_eng_base_png.png
   :alt: MIPT
   :target: https://typo3.org
   :height: 100px

.. image:: wikis/images/fpmi2019.png
   :alt: FPMI
   :target: https://mipt.ru/education/departments/fpmi/
   :height: 100px

.. image:: wikis/images/ml-logo.png
   :alt: MachineLearning.ru
   :target: http://www.machinelearning.ru
   :height: 100px

.. image:: wikis/images/m1p_logo.png
   :alt: My First Scientific Paper
   :target: http://m1p.org
   :height: 100px

.. image:: wikis/images/atp-mipt.jpg
   :alt: My First Scientific Paper
   :target: http://fpmi.tilda.ws/algo-tech/
   :height: 100px


Contacts
--------

Join the project Slack channel at #ml4sg.

You can reach developers at the `Telegram user group <https://t.me/mldev_betatest>`_

License
-------

The software is licensed under `Apache 2.0 license <https://gitlab.com/mlrep/mldev/-/blob/develop/LICENSE>`_

Index and tables
----------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
