Lab 8: Secure Access to a Private Instance

On the public-subnet instance, tighten its Security Group: SSH (22) only from your home IP
Create a Security Group for the private instance allowing SSH only from the public instance's Security Group (not an IP)
SSH into the public (bastion) instance, then SSH again from there into the private instance using key forwarding or a copied key
Deliberately misconfigure the private instance's Security Group (remove the SSH rule), attempt to connect, and document the failure
Fix it, then repeat the test using AWS Systems Manager Session Manager instead of SSH (requires an IAM role with SSM permissions on the instance)
Compare and note: which approach needed an open inbound port, and which did not

Written comparison (half a page) of the bastion/SSH approach vs Session Manager, including which you'd recommend for a production environment and why.