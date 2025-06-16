# Lambda / IAM

For the next lesson we are going to deploy a lambda via CloudFormation. The files that the lambda will contain are located at [lambda_function.py](/AWS-CloudFormation/Assets/lambda_function.py) the code itself simple returns the area if the length and width are sent. The code is not so important but knowing it is a python is.

Lets start by looking at the [CloudFormation Lambda](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-function.html) documentation and start adding the base for the resources.

For the `Code:` chunk use the following.

    Code:
      ZipFile: >
        <Paste here the contents of the python file here making sure the tabbing stays correct>

- Runtime: `python3.13`
- Function Name: `python_area`
- Handler: `index.lambda_handler`
- Role: `!GetAtt LambdaRole.Arn`

Make sure to add Tags.

As you can see in the above, you are referencing a `LambdaRole.Arn`. In the code this does not currently exist so that will be the next step. AWS IAM roles are out of spec for these lessons so the code required is below. But a good link to read is [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html).

    LambdaRole:
      Type: 'AWS::IAM::Role'
      Properties:
        RoleName: LambdaRole
        AssumeRolePolicyDocument:
          Version: "2012-10-17"
          Statement:
            - Effect: Allow
              Principal:
                Service:
                  - lambda.amazonaws.com
              Action:
                - 'sts:AssumeRole'
        Path: /

Apply your CloudFormation appending `--capabilities CAPABILITY_NAMED_IAM` to the end of the deploy command as follows:

`aws cloudformation deploy --template-file DOA.yml --stack-name doa-1234 --capabilities CAPABILITY_NAMED_IAM`

This is required to elevate the command to allow for the creation and modification of the IAM role.

To test your newly deployed lambda open the AWS Ui, login to the Answer Academy account and navigate to [lambda functions](https://eu-west-2.console.aws.amazon.com/lambda/home?region=eu-west-2#/functions).

Open the newly created Lambda. Hit `Test` and replace the contents of `Event Json` with the following.

    {
      "length": 20,
      "width": 100
    }

Hit `Test` and a new green box will appear, titled `Executing function: succeeded`, expanding this will display the output of the lambda.

![Executing function succeeded](/AWS-CloudFormation/Images/Lesson5-ExecutedSucceeded.png)


## Final Steps

Don't forget to spin down the stack before finishing to lesson.
