# S3

Now we have the basics of a VPC, lets add a S3 bucket to the stack that hosts a static page.

Try using just [CloudFormation S3 Bucket](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-s3-bucket.html) and [CloudFormation S3 Bucket Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-s3-bucketpolicy.html) to add the required resources to your code.

Add an output that lists the website URL, to aid you in checking if the code is correct.

Make sure you include Tags.

![Output listed in CLI](/AWS-CloudFormation/Images/Lesson4-Outputs.png)

If correctly deployed when navigating to the URL in your output you will see a 404, this is because we have not uploaded anything to your new S3 bucket.

![404 Not Found in Browser](/AWS-CloudFormation/Images/Lesson4-S3Bucket-Website.png)

If stuck, [S3 static website snippet](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-s3.html#scenario-s3-bucket-website) has the required code, but try and complete it without looking here.


## Final Steps

Don't forget to spin down the stack before finishing to lesson.