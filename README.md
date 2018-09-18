# Wipro Dojo

## Connecting to Control Plane

Required CLIs on your local machine or jumpbox:
- [BBL](https://github.com/cloudfoundry/bosh-bootloader/releases)
- [Terraform](https://github.com/hashicorp/terraform/releases)
- [BOSH](https://github.com/cloudfoundry/bosh/releases)
- [FLY](https://concourse-ci.org/download.html)
- [CredHub](https://github.com/cloudfoundry-incubator/credhub-cli/releases)
- [UAAC](https://github.com/cloudfoundry/cf-uaac/releases)
- [CF](https://github.com/cloudfoundry/cli/releases)

```shell
cd control-plane
eval "$(bbl print-env)"
credhub login
bosh env
```

```shell
bbl env-id
bbl lbs
bbl ssh --jumpbox
bbl ssh --director
```

## Using Git Submodules

All submodules and third-party resources are kept in the `vendor/` folder. They are [Git submodule](https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407).

To checkout the pinned version of all submodules run the following command:

```
git submodule update --recursive --remote
```

### Useful Links

**BOSH**
- https://bosh.io
  - All popular BOSH releases + documentation + links to GitHub source code)
- https://mariash.github.io/learn-bosh/
  - BOSH tutorials
- https://ultimateguidetobosh.com/
  - Advanced BOSH tutorials

**Concourse**
- https://concourse-ci.org
  - All Concourse CI/CD documentation
- https://concoursetutorial.com/
  - Concourse tutorials
- https://github.com/concourse
  - Concourse Source Code + Known Issues

**PCF**
- https://docs.pivotal.io/
  - All PCF documentation
- https://community.pivotal.io/
  - Pivotal Q&A Knowledgebase/Troubleshooting + Support
- https://docs.cloudfoundry.org/
  - Cloud Foundry documentation
- https://network.pivotal.io/
  - Pivotal Tiles and Services for PCF integration
- https://support.pivotal.io/
  - Pivotal Support
- https://github.com/pivotal-cf/pcf-pipelines
  - Automation pipelines for PCF
- https://github.com/pivotal-cf
  - Public Pivotal Cloud Foundry projects and resources
- https://github.com/pivotalservices/
  - Public Pivotal Services projects and resources
- https://github.com/Pivotal-Field-Engineering
  - Public Pivotal Field Engineering projects and resources
- https://github.com/Pivotal-Japan/
  - Public Pivotal Japan projects and resources
- https://github.com/pivotal-education
  - Public Pivotal Education learning resources
- https://github.com/pivotal
  - Less used global Pivotal GitHub resources
- https://github.com/pivotal-legacy
  - EVEN MORE Pivotal resources
- https://github.com/cloudfoundry/bosh-bootloader
  - BBL Bosh-BootLoader for BOSH OSS Control Plane
- https://www.terraform.io/
  - Terraform IaaS automation tool used by BBL
- https://github.com/cloudfoundry
  - Stable Cloud Foundry OSS projects
- https://github.com/cloudfoundry-incubator
  - Beta Cloud Foundry OSS projects
- https://github.com/cloudfoundry-community
  - Community Cloud Foundry OSS projects
- https://github.com/cloudfoundry-samples
  - Cloud Foundry OSS sample applications
- https://github.com/cf-platform-eng
  - Cloud Foundry Platform Engineering resources
- https://github.com/pivotal/workstation-setup
  - Mac OS X Workstation Setup with all essential tools
- https://github.com/pivotal-cf-experimental
  - If you want to live dangerously...
- https://github.com/cppforlife
  - Dmitriy, a Cloud Foundry legend

## Points of Contact

Amlan Datta, Solutions Architect, Pivotal - [adatta@pivotal.io](mailto:adatta@pivotal.io)

Ryan Meharg, Cloud Foundry Solutions Architect, Altoros - [ryan.meharg@altoros.com](mailto:ryan.meharg@altoros.com)

