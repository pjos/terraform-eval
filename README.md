# Terraform Evaluation
## Background 
Neither Terraform or Ansible are tools that I use on a daily basis, though I’m very familiar with their purpose. I take this opportunity to play around with both of them.

## Introduction
Objective of this lab has been to evaluate the combination of [Terraform](https://www.terraform.io/) and [Ansible](https://docs.ansible.com/ansible/latest/index.html) for a simple task of provisioning an Ubuntu VM and level of complexity to install and start using those tools. Terraform is supposed to be good for Infrastructure as Code related tasks while Ansible's strength is more shifted towards IT configuration automation. Vultr.com has been chosen as a Cloud provider. An example from the Vultr Terraform Module has been used as a quickstart.  A blog post on DigitalOcean has been used to understand techniques of handover from Terraform to Ansible. 

## Target expectation
Windows 10 WSL Ubuntu 18.04 has been used as a provisioning environment. Official documentation has been used to install both Terraform 1.0.1 and Ansible 2.4.4. Expected result was to provision an Ubuntu 20.04 VM on Vultr.com.

## Outcome
To get Terraform up and running was quite easy. No issues at all to create an Ubuntu 20.04 VM but the Ansible part failed directly. The Agent-less design of Ansible is supposed to be one of its strengths but its dependency to Python seems to be its weak spot. Default Python on Ubuntu 20.04 is 3.8 and Ansible doesn’t support this version yet so the remote execution failed. Python 3.7 is not available for Ubuntu 20.x, and Python 2.7 was missing required dependencies. Falling back to Ubuntu 18.04 as the target of the provisioning was the only solution due to limited time.

## Conclusion 
The objective of this lab, with some modifications, has been achieved. Ansible’s dependency to python shows that this is not really an “out of the box” tool.

## References 
https://github.com/vultr/terraform-provider-vultr/tree/master/example


https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management

## Result
[![asciicast](https://asciinema.org/a/Q4L5Y3HNr4VcDiPbPYMhbW1Ce.png)](https://asciinema.org/a/Q4L5Y3HNr4VcDiPbPYMhbW1Ce)


