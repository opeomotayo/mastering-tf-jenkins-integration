pipeline{
 agent any
 environment {
   PATH = "${PATH}:${getTerraformPath()}"
 }
 stages{
   stage('S3 - create bucket'){
     steps{
       script{
         getTerraformPath('ope-tf-bucket-0309')
       }
     }
   }
   stage('terraform init and apply - dev'){
     steps{
       sh returnStatus: true, script: 'terraform workspace new dev'
       sh "terraform init"
       sh "terraform apply -var-file=dev.tfvars -auto-approve"
     }
   }

   stage('terraform init and apply - prod'){
     steps{
       sh returnStatus: true, script: 'terraform workspace new prod'
       sh "terraform init"
       sh "terraform apply -var-file=prod.tfvars -auto-approve"
     }
   }
 }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-13', type: 'terraform'
  return tfHome
}

def createS3Bucket(bucketName){
  sh returnStatus: true, script: "aws s3 mb ${bucketName} --region=eu-west-1"
}
