```
resource_types:
  - name: cf-cli-resource
    type: docker-image
    source:
       repository: steve1145/cf-cli
       tag: latest
       inputs:
         - name: compile-out

resources:
  - name: "secure-coding"
    type: git
    source: 
      uri: "http://52.141.44.235:8088/sudouser/buildpacks.git"
      branch: master
      username: sudouser
      password: sudouser

  - name: "source-git"
    type: git
    source: 
      uri: "http://52.141.44.235:8088/cloudplatform1_DEV/project_static.git"
      branch: master
      username: sudouser
      password: sudouser
      
  - name : "cf-env"
    type : cf-cli-resource
    source :
       api: "https://api.msxpert.co.kr"
       skip_cert_check: true
       username: sudouser
       password: sudouser
    
jobs: 
  - name: "Compile-testing"
    plan: 
      - get: "secure-coding"
        resource: "secure-coding"
        params: 

      - get: "source-git"
        resource: "source-git"
        params: 

      - task: "01. Compile"  
        file: "secure-coding/static/compile.yml"

      - put: "cf-env"
        resource: "cf-env"
        params:
          command: push
          app_name: static
          hostname: static
          memory: 1G
          disk_quota: 1G
          instances: 1
          buildpack: staticfile_buildpack
          org: cloudplatform
          space: DEV
          path: compile-out/source-git

```
