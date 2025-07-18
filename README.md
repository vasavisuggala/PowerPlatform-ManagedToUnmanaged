# PowerPlatform-UpdateEnvGovernance

![PowerShell](https://img.shields.io/badge/Built%20With-PowerShell-5391FE?logo=powershell&logoColor=white)
![Power Platform](https://img.shields.io/badge/Platform-Microsoft%20Power%20Platform-purple?logo=microsoftpowerapps&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Admin Tool](https://img.shields.io/badge/Tool-Type%3A%20Admin-lightgrey)

🛡️ **Update Governance Settings for Power Platform Environments**  

---

## 📖 Problem  

In Microsoft Power Platform, environments can be upgraded from **Unmanaged ➡ Managed** directly in the Admin Center.  
However, the reverse transition (**Managed ➡ Unmanaged**) is **not supported manually**.  

This limitation creates challenges for administrators when:  

- ✅ A project team initially requested **Managed environments** but later decided to downgrade due to **premium licensing costs**.  
- ✅ An environment was accidentally configured as **Managed** during creation.  
- ✅ Developers working in test/dev environments don’t require governance restrictions.  

---

## 💡 Solution  

This PowerShell script provides a programmatic way to update governance settings for any environment in your tenant.  

✅ Convert **Managed ➡ Unmanaged** to remove governance restrictions  
✅ Apply **Unmanaged ➡ Managed** to enable strict governance when needed  
✅ Verify governance configuration post-update  

This utility leverages the **Microsoft.PowerApps.Administration.PowerShell** module for seamless integration with Power Platform.  

---

## 🚀 Features  

- 🔄 Convert environments **Managed ↔ Unmanaged**  
- ⚙️ Supports automation for bulk environment updates  
- 🛡️ Designed for tenant admins with secure authentication  
- 📋 Verifies governance status after applying changes  

---

## 🛠 Prerequisites  

- PowerShell 5.1+  
- Microsoft Power Apps Admin module:  
```powershell
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
Install-Module -Name Microsoft.PowerApps.PowerShell
```
# ▶️ Usage

1️⃣ Connect to Power Platform
```powershell
Add-PowerAppsAccount
```
2️⃣ Update Governance Configuration
Replace <YourEnvironmentGUID> with the GUID of your environment.

```powershell

# Define governance configuration (Basic = Unmanaged, Managed = Managed)
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"   # Use "Managed" to upgrade
}
# Apply the change
Set-AdminPowerAppEnvironmentGovernanceConfiguration `
    -EnvironmentName <YourEnvironmentGUID> `
    -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

📄 Example
Convert environment c00d0003-d121-e872-b245-6fcbe33f541d from Managed ➡ Unmanaged:

```powershell
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
}

Set-AdminPowerAppEnvironmentGovernanceConfiguration `
    -EnvironmentName c00d0003-d121-e872-b245-6fcbe33f541d `
    -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration
```

✅ Success message:

```mathematica
Environment c00d0003-d121-e872-b245-6fcbe33f541d updated successfully.
```
📢 Why Use This?
- ✅ Bypass manual limitations in Admin Center
- ✅ Reduce governance for non-critical environments
- ✅ Enforce governance for production environments

⚠️ Caution
- 🟡 This script directly modifies environment governance settings.
- 🚫 Avoid running on production environments unless required.
- 🕒 Changes may take a few minutes to reflect in the Admin Center UI.


👩‍💻 Author
✍️Developed with ❤️ by Vasavi Suggala

🌟 Like this Script?
If you found this script useful, please ⭐ star this repository to support future updates and help others discover it.



