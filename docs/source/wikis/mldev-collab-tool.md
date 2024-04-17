# Contents

[TOC]

# Installation

## Prerequisites

You will need the following:
1. MLDev v0.5 or higher installed.
2. Git v2.17.1 or higher installed.
3. A Git account at a publicly accessible repository hosting provider like GitHub, GitLab, or your own (a GitLab account is needed for pipeline automation).

## Install the MLDev extra

Download the latest version of the MLDev installation file to your local machine and run it.

```shell script
$ curl https://gitlab.com/mlrep/mldev/-/raw/develop/install_mldev.sh -o install_mldev.sh 
$ chmod +x ./install_mldev.sh
$ ./install_mldev.sh collab
```

Wait a couple of minutes until the installation is complete, and then you are almost ready to use the collaboration tool.

## Alternative sources

*This functionality is under development and will be available soon*

Additionally, you can install the collaboration tool using pip:

```shell script
$ pip install mldev[collab]
```

# Initialization (option 1)

## Initializing the Tool for a New Experiment

If you are creating a new experiment, meaning you are initializing MLDev in a new folder, use the following command:

```bash
mldev init <your_folder>
```

Here and below replace <your_folder> with the actual name of the folder you want to use. This will be the directory where your experiment will be set up. After that, no additional actions are required to initialize the Collaboration Tool. If the Collaboration Tool was previously installed, it will automatically be initialized in the directory specified by <your_folder>. You can find more details on the initialization process in [the MLDev User Guide](mldev-user-guide#step-1-create-a-separate-project-for-the-experiment).

If you decide to initialize only specific MLDev extras using the -p flag, which allows you to specify just one extra for initialization, you will need to run the command `mldev init <your_folder> -p collab` to initialize the Collaboration Tool.

Let's say you have just created a new experiment folder from the template-default using the command (the -p flag with the value "template" only sets up the template):

```bash
mldev init <your_folder> -t template-default -p template
```

In that case, to initialize the Collaboration Tool, you should run:

```bash
mldev init <your_folder> -p git
mldev init <your_folder> -p collab
```

It's important to note that the collab module requires the git extra to be set up beforehand, so make sure to initialize git before init the Collaboration Tool.

## Initializing the Tool for an Existing Experiment

In some cases, you may already have a folder with an existing experiment. For example, your colleague-researcher initialized MLDev in a local folder, then uploaded its contents to GitHub, from which you cloned the repository. In this scenario, after downloading the experiment folder, you need to initialize the Collaboration Tool on your computer using the following command:

```bash
mldev init <your_folder> -p collab
```

You do not need to initialize the git extra because it was already initialized by another researcher when the experiment was placed on GitHub.

# Initialization (option 2)

## Initializing the Tool for a New Experiment

When creating a new experiment and initializing MLDev in a new folder, use the following command:

```bash
mldev init <your_folder>
```

Replace <your_folder> with the actual name of the folder or path you want to use. This will be the directory where your experiment will be set up.

After running the command above, the Collaboration Tool will be automatically initialized if it is installed. There is no need for additional steps to set up the Collaboration Tool. You can find more detailed information about the initialization process in [the MLDev User Guide](mldev-user-guide#step-1-create-a-separate-project-for-the-experiment).

If you decide to initialize only specific MLDev extras using the -p flag, which allows you to select individual extras for initialization, you can use the following command to initialize the Collaboration Tool:

```bash
mldev init <your_folder> -p collab
```

This command initializes the Collaboration Tool in your chosen folder. Note that you may need to know which extras are available or suitable for your experiment. Additional examples and explanations can be found in [the MLDev User Guide].

It's important to note that the order of initializing extras matters. The collab module requires the git extra to be set up beforehand, so make sure to initialize git before running the collab module.

## Initializing the Tool for an Existing Experiment

In some cases, you might already have a folder with an existing experiment. For example, if your colleague-researcher initialized MLDev in a local folder, then uploaded its contents to GitHub, and you cloned the repository, to initialize the Collaboration Tool on your computer, use the following command:

```bash
mldev init <your_folder> -p collab
```

In this case you do not need to initialize the git extra because it was already initialized by another researcher when the experiment was placed on GitHub.

# Usage

## Track experiment file after running the experiment

> (this behavior is currently not enabled)

Every time you launch an experiment with mldev run, the collaboration tool checks whether the experiment file you ran has been added to the tracked ones or not. If it hasn't, you will be prompted to add this file to the tracked ones.

```shell
[Collab] Do you want to add experiment.yml to the tracked ones? (yes/[no]): yes
```

Afterward, all changes to this file will be tracked by the collaboration tool and used to assist you in your work, such as automatically merging changes made by other researchers in this experiment file (for more details, refer to [the Tutorial section](#tutorial)).

## Track experiment file manually

Also you can add an experiment file manually:

```shell
mldev collab add experiment.yml
```

Important: to add an experiment file to tracking when starting an experiment with MLDev or when running the `mldev collab add` command, the repository must be in a "clean" state. This means that all changes should be committed, and there should be no untracked files.

# Tutorial

This tutorial will demonstrate the basic usage of the collaboration tool.

As we know, MLDev uses YAML to describe experiments. We will write a simple YAML file and demonstrate how to make and retrieve changes to this file.

## Step 1. Prepare the Remote Repository

In this tutorial, we will use one of the most commonly used services for storing your code - GitHub. Create a new repository as described [here](https://docs.github.com/en/get-started/quickstart/create-a-repo).

After creating a repository, copy the link as shown in the screenshot:
![photo_2023-10-16_20-15-26](uploads/7484b24a1e1f45e9e9f206fc1691c32a/photo_2023-10-16_20-15-26.jpg)

## Step 2. Initialize the Experiment

Initialize the default template (MLDev should already be installed, as described [here](https://gitlab.com/mlrep/mldev/-/wikis/mldev-user-guide#installation); collab extra must be installed as described above):

```shell
mldev init experiment
```

When you are asked to specify your Git remote URL, provide your GitHub URL from step 1:

```shell
Initialized empty Git repository in /mldev_test/experiment/.git/
(mldev) Please specify your new remote url (empty to skip): git@github.com:username/mldev-collab-test.git
```
Go to the experiment folder and add the experiment.yml file to the tracked ones:

```shell
cd experiment
mldev collab add experiment.yml
```

And push all these changes to the remote repository:

```shell
git push --set-upstream origin master
```

If an error occurs at this moment, check the correctness of your Git configuration according to the [instructions](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey).

Go to GitHub and check the content of the repository:

![the GitHub repository](uploads/fc46bf092cc8217b389ebcd9a21aa74f/Screenshot_2023-10-17_at_01.49.56.png)

## Step 3. Make Changes

Аs described in the template file README-EN.md, the experiment tackles a simple classification task on the iris dataset. We want to add the output of the experiment's end time. To do this, we'll modify the `experiment.yml` file. Add a `!BasicStage` with the date and time output as the final element in the pipeline as shown below:

```yaml
pipeline: !GenericPipeline
  runs:
    - *prepare_stage # prepare
    - *train_stage
    - *present_model # finals
    - !BasicStage
      name: echo-date
      script:
        - echo "Experiment end at $(date)"
```

And then commit the changes:

```shell
git add experiment.yml
git commit -m "Add the output of the experiment's end time."
```

## Step 4. Simulate the Work of Another Researcher

Create a new folder in a different place (not in the experiment folder) and go to it. Clone the Github repo and initialize the collab tool (you should use your GitHub URL from step 1 here again):

```shell
mkdir ~/mldev_test_second_researcher
cd ~/mldev_test_second_researcher
git clone git@github.com:username/mldev-collab-test.git experiment
mldev init -p collab experiment
cd experiment
```

In this folder, we will simulate the work of another researcher. Unfortunately, the second researcher has decided to make changes to the `pipeline` simultaneously with us: they have chosen to display the results. Let's modify the `experiment.yml` file by adding an element to the pipeline, as shown below:

```yaml
pipeline: !GenericPipeline
  runs:
    - *prepare_stage # prepare
    - *train_stage
    - *present_model # finals
    - !BasicStage
      name: print-results
      script:
        - cat ${root.present_model.outputs[0].path}/report.csv
```

Commit and push the changes:

```shell
git add experiment.yml
git commit -m 'Display the results.'
git push --set-upstream origin master
```

At this point, Git may request your email and name. Enter them if necessary, following the on-screen instructions provided by Git.

## Step 5. Merge Your Changes

Since both we and the other researcher simultaneously made changes to the same file, even to the same tag, unfortunately, standard Git mechanisms won't allow us to use auto-merge. However, thanks to the use of the Collaboration Tool module, we can still avoid resolving conflicts manually. To do this, go to your original folder from step 2 and pull changes from the remote repository:

```shell
git pull --no-edit --no-rebase
```

You have to use the --no-rebase flag to avoid rebase, which is not supported now. Alternatively, you can configure your Git to prefer the merge operation by default:

```shell
git config pull.rebase false
```

Check the experiment.yml file. It should look something like this:

```yaml
# Licensed under the Apache License: http://www.apache.org/licenses/LICENSE-2.0
# For details: https://gitlab.com/mlrep/mldev/-/blob/master/NOTICE.md

prepare: &prepare_stage !BasicStage
  name: prepare
  params:
    size: 1
  inputs:
  - !path {path: "./src"}
  outputs:
  - !path {path: "./data"}
  script:
  - "python3 src/prepare.py"


train: &train_stage !BasicStage
  name: train
  params:
    num_iters: 10
  inputs:
  - !path
    path: "./data"
    files:
    - "X_train.pickle"
    - "X_dev.pickle"
    - "X_test.pickle"
    - "y_train.pickle"
    - "y_dev.pickle"
    - "y_test.pickle"
  outputs: &model_data
  - !path
    path: "models/default"
    files:
    - "model.pickle"
  script:
  - "python3 src/train.py --n ${self.params.num_iters}"

present_model: &present_model !BasicStage
  name: present_model
  inputs: *model_data
  outputs:
  - !path
    path: "results/default"
  env:
    MLDEV_MODEL_PATH: ${path(self.inputs[0].path)}
    RESULTS_PATH: ${self.outputs[0].path}
  script:
  - |
    python3 src/predict.py
    printf "=============================\n"
    printf "Test report:\n\n"
    cat ${path(self.outputs[0].path)}/test_report.json
    printf "\n\n=============================\n"

pipeline: !GenericPipeline
  runs:
  - *prepare_stage
  - *train_stage
  - *present_model
  - !BasicStage
    name: print-results
    script:
    - cat ${root.present_model.outputs[0].path}/report.csv
  - !BasicStage
    name: echo-date
    script:
    - echo "Experiment end at $(date)"
```

Now you can run the experiment:

```shell
mldev run -f experiment.yml
```

Some warnings may be displayed on the screen (e.g., UndefinedMetricWarning). This is normal and does not affect the experiment. The main thing is to ensure that the output we added to our experiment is present:

![the output](uploads/76ee1788c36f3a43633eb73e5e1a2ed3/image.png)

So, your changes and changes from the other researcher were merged automatically.

In this tutorial, we created a GitHub repository for our experiment, shared the experiment with another researcher, made changes to the experiment, and merged the changes from another researcher with our own.