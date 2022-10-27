function fn(){
	var config = {
			baseUrl: 'https://kera-ae.cnnbsolutions.com', 
			tokenID: 'l0xylx55obpl1fog2h7loav1crwzgpi8'
	};
	var env =karate.env
	karate.log('The value of env is: ', env);
	
	if(env=='Production')
		{
			config.baseUrl = 'https://ae.kerastase.com'
		}
	else if(env == 'PreProd')
		{
			config.baseUrl = 'https://preprod-ae.kerastase.com'
		}
	else 
		{
			config.baseUrl = 'https://kera-ae.cnnbsolutions.com'
		}
	
	return config;
}