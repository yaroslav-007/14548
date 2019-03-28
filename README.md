####How move resource to module preserving the tf state
## pre-requirements



- Install **Terraform**
    - Download and install accordingly to your OS as described here : https://www.terraform.io/downloads.html
	
## How to run the code
1. Open Command Line Interpreter: 

 OS system | Operation
 ------------ | -------------
| Windows | Start menu -> Run and type cmd |
| Linux  |Start terminal |
| macOS | Press Command - spacebar to launch Spotlight and type "Terminal," then double-click the search result. |

2. Run the following commands:
```
export ATLAS_TOKEN=<token>
git clone https://github.com/yaroslav-007/14548.git
cd 14548/tf-code-with-resource
terraform init
terraform apply
terraform state list
	null_resource.string
	random_string.string
```
We change the resource type "random_string" with name "string" to be accessed as module.
cd ../seperated_project
terraform init ###not needed if the first code was changed onplace 
terraform state list
	null_resource.string
	random_string.string <- resource that we want to move

terraform state mv random_string.string module.random_string ###terrafrom init mv <resource-type>.<name-of-resource> module.<name-of-module>)
terraform state list
	module.random_string.random_string.string
	null_resource.string

terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

random_string.string: Refreshing state... (ID: )
null_resource.string: Refreshing state... (ID: )

------------------------------------------------------------------------

No changes. Infrastructure is up-to-date.

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, no
actions need to be performed
```