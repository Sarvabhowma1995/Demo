node{
     
    stage('SCM Checkout'){
        git credentialsId: 'GIT', url: 'https://github.com/Sarvabhowma1995/flipkart.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t jsarvabhowma/flipkart .'
    }
    
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'Docker', variable: 'Docker')]) {
          sh "docker login -u jsarvabhowma -p ${Docker}"
        }
        sh 'docker push jsarvabhowma/flipkart'
     }
     /**
     stage("Deploy To Kuberates Cluster"){
       kubernetesDeploy(
         configs: 'Deployment.yml', 
         kubeconfigId: 'Config_file',
         enableConfigSubstitution: true
        )
     }
	 
      stage("Deploy To Kuberates Cluster"){
        sh 'kubectl apply -f springBootMongo.yml'
      } **/
     
}


