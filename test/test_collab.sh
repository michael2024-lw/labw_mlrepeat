researchers=(1 2 3 4 5 6 7 8 9 10)
cwd=$(pwd)

venv_folder=$(mktemp -d)
python -m venv $venv_folder
source $venv_folder/bin/activate
pip install --upgrade pip
pip install future
pip install ".[all]"

test_folder=$(mktemp -d)
mkdir $test_folder
printf '\n' | mldev init $test_folder/base
cd $test_folder/base
rm .mldev/config-basic.yml experiment-basic.yml experiment_jupyter.yml
cp $cwd/test/data/collab/config.yaml $test_folder/base/.mldev/config.yaml
cp $cwd/test/data/collab/experiment.yml $test_folder/base/experiment.yml

git add .
git commit -m 'Change the config files'
mldev init -r -p collab .

for N in "${researchers[@]}"
do
  cd $test_folder
  cp -r base researcher$N && cd researcher$N
  git remote add base $test_folder/base/.git

  git checkout -b work_branch_researcher$N
  cp $cwd/test/data/collab/experiment_researcher$N.yml $test_folder/researcher$N/experiment.yml
  git add .
  git commit -m "Modified experiment.yml by researcher$N"
  git push
done

cd $test_folder/base
git checkout master
for N in "${researchers[@]}"
do
  git merge work_branch_researcher$N --no-edit
done

for N in "${researchers[@]}"
do
  cd $test_folder/researcher$N
  git checkout master
  git pull base master
done

# Checks
for N in "${researchers[@]}"
do
  if ! grep -q "researcher$N_" $test_folder/base/experiment.yml; then
      echo 'FAILED'
      exit 1
  fi

  for M in "${researchers[@]}"
  do
    if ! grep -q "researcher$N_" $test_folder/researcher$M/experiment.yml; then
        echo 'FAILED'
        exit 1
    fi
  done
done

echo 'OK'

rm -rf $venv_folder $test_folder
