# Parameters & Outputs

In this lesson we will build on the previous and add parameters and outputs to our existing CloudFormation code.

The Parameters can reduce duplicating strings and allow for the code to be made modular by passing in alternative values.

The Outputs can give us information that can be used elsewhere, like IP addresses or DNS addresses.

Open the `DOA.yml` file and add the following code below the `Description` line and above the `Resources` line.

    Parameters:
      VpcCIDR:
        Description: Please enter the IP range (CIDR notation) for this VPC
        Type: String
        Default: 10.10.10.0/20


To reference this new parameter change the following line inside the VPC resource block:

    CidrBlock: "10.10.10.0/20"

to:

    CidrBlock: !Ref VpcCIDR


Run the CloudFormation using the command in the previous lesson. Noting the resources should have been deployed with no changes.

Next lets add in an output. For this we will just output the reference to the VPC, but as spoken about above anything can be output via this method.

Add the following code to the end of your file.

    Outputs:
      VPC:
        Description: A reference to the created VPC
        Value: !Ref VPC
    
Rerun the apply code.

To view the output the following command needs to be run:

`aws cloudformation describe-stacks --stack-name my-stack-name`

So for this run we just need to change the stack name to what we used to create the stack, in this case we will use `doa-1234`.
So all filled out:

`aws cloudformation describe-stacks --stack-name doa-1234`

Hit enter and the stack will be described including the new outputs.

![Stack described](/AWS-CloudFormation/Images/Lesson3-Outputs.png?raw=true)

## Next Steps

Now we have gone through the basics. You will add some additional Parameters and Outputs.

Add 2 new parameters for the CidrBlock's of the 2 Subnets in your code.

Add a new parameter for the `deployed-by` tag attached to each resource.

Reading the [Parameters section structure](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html) document, add in the following constraints to the VPC parameter.

- Minimum length: 9
- Maximum length: 18
- Constraint Description: Must be a valid IP CIDR range of the form x.x.x.x/x.

As a stretch goal find a regex for CIDR notation and add that.

For additional outputs. 
Reading the [Outputs section structure](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/outputs-section-structure.html) add an additional output that outputs all subnets ids in a list in a single output.

## Final Steps

Don't forget to spin down the stack before finishing to lesson.