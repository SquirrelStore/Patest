#! /usr/bin/env bash

eval "$(conda shell.bash hook)"

envs=$(conda env list | grep -v "#" | cut -d " " -f1)

echo -e "\033[36m"

echo "Available conda environments:"
select env in $envs; do
    if [ -n "$env" ]; then
        echo "$env selected."
	conda activate "$env"
	echo "$env activated."
        break
    else
        echo "Invalid selection. Please try again."
    fi
done

echo "Install setuptools, build, wheel, twine, isort and ruff..."
pip install setuptools build wheel twine isort ruff

echo "building..."
python -m build -v -n .