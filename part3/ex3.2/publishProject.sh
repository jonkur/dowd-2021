#!/bin/sh

temp_repo="temp456265"

perform_error_exit()
{
  cd ..
  rm -rf $temp_repo
  exit 1
}

echo -e "\nPlease log in to your docker account:"
docker login || perform_error_exit

echo -e "\nPlease enter the address of the repository you wish to clone, it must contain a Dockerfile at root:"
read repo_addr

git clone $repo_addr $temp_repo || exit 1
cd $temp_repo

dfc=$(ls | grep -xc "Dockerfile")
if [ "$dfc" -lt 1 ]; then
  echo "No Dockerfile found in the repository, exiting..."
  perform_error_exit
fi

echo -e "\nPlease enter a name for the new repository on Docker hub. Use the format <username>/<repository name>:"
read repo_name

docker build -t $repo_name . || perform_error_exit
docker push $repo_name:latest || perform_error_exit

docker rmi $repo_name

cd ..
rm -rf $temp_repo
exit 0
