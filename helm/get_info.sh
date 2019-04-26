base_url="http://"$(minikube ip)":"$(kubectl get svc myblog-wordpress -o=jsonpath='{.spec.ports[?(@.port==80)].nodePort}')
echo "WordPress URL is: $base_url"
echo "Management Console: ${base_url}/wp-login.php"
echo -e "Username: user\nPassword: "$(kubectl get secret --namespace default myblog-wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode) # to extract credentials

