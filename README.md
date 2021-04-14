# <span style="display:block;text-align:center">dockerized wordpress platform</span>

<span style="display:block;text-align:center">[![CI](https://github.com/tahacodes/dockerized/actions/workflows/main.yml/badge.svg)](https://github.com/tahacodes/dockerized/actions/workflows/main.yml)</span>

<hr>

<b>what is it</b>

this is a dockerized platform to deploy a WordPress website by just one command, all images are written from ubuntu:latest base image except WordPress image itself which is using php:fpm because of some dependency issues.

<br>
<b>how it works</b>

all images are gonna be built and pushed to the private docker registry as soon as i push to [main] branch.

<br>
<b>how use</b>

clone the repository on your server and just run:<br>

    $ docker-compose up -d

or change the 'hosts' file and use the ansible-playbook i wrote:

    $ ansible-playbook -i hosts deploy-playbook.yml \
        -e "docker_username=<username> docker_password=<password>"

<hr>

# <span style="display:block;text-align:center">continuous integration</span>

<b>description</b>

github actions is basically just a simple yaml file that contains the steps required to get the job done.

<br>
<b>explain yaml file</b>

at first we got a section called 'on' wich we can specify how this workflow would trigger and run. 'workflow_dispatch' is used for manual workflow runs.

<br>

then we got 'jobs', here we specify our workflow steps:

    > actions/checkout
        this helps us work with repo's files in the workflow.

    > docker/login-action
        i used this action to log into my private docker registry.
        use github secrets to store your credentials.

    > and the i used 'run' to build and push images
        - name: build <image> image
            run: docker build -t <image>:latest <image_directory_name>
        - name: tag and push <image> image
            run: |
            docker tag <image> ${{ secrets.DOCKER_REGISTRY }}/<image>
            docker push ${{ secrets.DOCKER_REGISTRY }}/<image>
