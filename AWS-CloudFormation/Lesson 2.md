# Basic VPC

In this lesson we will start off our CloudFormation project and deploy a basic VPC with 2 Subnets.

Start by creating a new folder that will contain the CloudFormation project.
For the screenshots these will be contained at `C:\dev\projects\AnswerDigital\DOA-CloudFormation`

Create a file within this folder called `DOA.yml` and paste in the following


    AWSTemplateFormatVersion: 2010-09-09
    Description: Answer Digital DevOps Academy

    Resources:
      VPC:
        Type: AWS::EC2::VPC
        Properties:
          CidrBlock: "10.10.10.0/20"
          EnableDnsHostnames: false
          EnableDnsSupport: true
          Tags:
            - Key: "Name"
              Value: "VPC" 
            - Key: "managed-by"
              Value: "CloudFormation"
            - Key: "deployed-by"
              Value: "<Enter Name Here>"  

      Subnet1:
        Type: AWS::EC2::Subnet
        Properties:
          VpcId: !Ref VPC
          AvailabilityZone: !Select [ 0, !GetAZs  '' ]
          CidrBlock: "10.10.10.0/24"
          MapPublicIpOnLaunch: true
          Tags:
            - Key: "managed-by"
              Value: "CloudFormation"
            - Key: "deployed-by"
              Value: "<Enter Name Here>" 

Open a command window and navigate it to your folder. 

The command to run a CloudFormation file is as below.

`aws cloudformation deploy --template-file filepath --stack-name my-stack-name`

For this run as we have named our file `DOA.yml` so will replace `filepath` with that. For the stack name this can be anything, but must be consistent between runs. For this we shall use `doa-1234`.
So all filled out:

`aws cloudformation deploy --template-file DOA.yml --stack-name doa-1234`

Hit enter and watch as the cloudformation is deployed.

![Successfully deployed](/AWS-CloudFormation/Images/Lesson2-Deployed.png?raw=true)

You can also go into the Portal and should see a VPC called `VPC`, the details of should look at follows:

![Successfully deployed in Portal](/AWS-CloudFormation/Images/Lesson2-DeployedPortal.png?raw=true)

## Next steps
Add an additional subnet to your file named `Subnet2` with the CidrBlock of `10.10.11.0/24`

Once added re-run the deployment command and check the portal to see the new subnet.

## Final Steps
Most resources once spun up cost money, while the VPC doesn't for the sake of keeping the AWS environment clean we will spin down the stack each time.

The command to delete the CloudFormation is as below.

`aws cloudformation delete-stack --stack-name my-stack-name`

So for this run we just need to change the stack name to what we used to create the stack, in this case we will use `doa-1234`.
So all filled out:

`aws cloudformation delete-stack --stack-name doa-1234`

Hit enter and the resources deployed via the CloudFormation will be deleted.

![Successfully deleted](/AWS-CloudFormation/Images/Lesson2-Deleted.png?raw=true)


## Links
[CloudFormation VPC](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpc.html)

[CloudFormation Subnet](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-subnet.html)

[CloudFormation Concepts](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/gettingstarted.walkthrough.html)