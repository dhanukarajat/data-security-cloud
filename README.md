#Implementation of Data Confidentiality in Cloud

- Based on IEEE Paper "Building Confidential and Efficient Query Services in the Cloud with RASP Data Perturbation" by Huiqi Xu, Shumin Guo, and Keke Chen. (IEEE Transactions On Knowledge And Data Engineering, Vol. 26, No. 2, February 2014)

- User uploaded data may be visibe if the cloud security is compromised. Additional security measures have to be implemented.

- 2- Step Authentication method: User needs to enter password and system generated Activation key to access his cloud account. If password is compromised, the activation key cannot be reproduced, thus securing account. Admin can deactivate account if threshold incorrect attempts are made.

- User's File contents are encrypted and sent to the cloud and decrypted after downloading from the cloud. If an attacker is capturing user's packets during transfer or cloud vendor's security security is compromised, the user's data is still safe.

- The system is sharp enough to detect attackers and log information about them.
