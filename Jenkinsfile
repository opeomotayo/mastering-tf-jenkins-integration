pipeline{
 agent any
 environment {
   PATH = "${PATH}:${getTerraformPath()}"
 }
 stages{
   stage('terraform init'){
     steps{
       sh "terraform init -reconfigure"
     }
   }
 }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-13', type: 'terraform'
  return tfHome
}
