# DON'T USE THIS REPO YET.  IT'S NOT READY

# git-triggers-build_openshift
Monitors your Git repos for changes and kicks off appropriate builds in OpenShift when a change has occurred.

## Why do I need a way to kick-off builds in OpenShift?
Some users of OpenShift can't use GitHub for their code and therefore may not have a way to send a webhook trigger.
Additionally, many organizations may not expose their OpenShift environment to the outside world, making an external
trigger very difficult.  'git-triggers-build_openshift' can help solve this problem by giving OpenShift the ability
to check your git repositories for changes and then perform a build if a change is made.

Of course OpenShift comes with Jenkins that will let you do just this, however you may not know how to use Jenkins
or perhaps you don't want to learn a new application just so you can kick off automatic builds.  OpenShift provides
nearly the entire CI/CD pipeline without Jenkins if you can just get it to build on code change.
'git-triggers-build_openshift' keeps it simple by running as a Kubernetes CronJob, checking your repositories for
code changes and then starting your build(s).

### Create a Secret for git credentials
You'll likely need to use credentials to access your git repository if it's not a public repo.  To do that you
will need to create a Secret object.  Create your secret like this:

```
oc create secret generic git-triggers-build-user --from-literal=GIT_TRIGGERS_BUILD_USERNAME=<some-username> --from-literal=GIT_TRIGGERS_BUILD_PASSWORD=<some-password>
```

Alternatively, instead of using `--from-literal` you can also do it from file.


### OpenShift 3.5 and older
You will need to manually set the docker registry address in your cronjob.  OpenShift 3.6 and newer support
mapping of ImageStreams as the container image in 'job' definitions whereas 3.5 and older did not.

ex for OpenShift 3.5 and older: 172.30.0.2:5000/project-name/git-triggers-build:latest 
