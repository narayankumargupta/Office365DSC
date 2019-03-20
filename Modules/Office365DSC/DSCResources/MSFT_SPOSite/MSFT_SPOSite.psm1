function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Url,

        [Parameter()]
        [System.String]
        $Owner,

        [Parameter()]
        [System.UInt32]
        $StorageQuota,

        [Parameter()]
        [System.String]
        $Title,

        [Parameter()]
        [System.UInt32]
        $CompatibilityLevel,

        [Parameter()]
        [System.UInt32]
        $LocaleId,

        [Parameter()]
        [System.UInt32]
        $ResourceQuota,

        [Parameter()]
        [System.String]
        $Template,

        [Parameter()]
        [System.UInt32]
        $TimeZoneId,

        [Parameter()]
        [System.Boolean]
        $AllowSelfServiceUpgrade,

        [Parameter()]
        [System.Boolean]
        $DenyAddAndCustomizePages,

        [Parameter()]
        [System.String]
        [ValidateSet("NoAccess", "Unlock")]
        $LockState,

        [Parameter()]
        [System.UInt32]
        $ResourceQuotaWarningLevel,

        [Parameter()]
        [System.String]
        [ValidateSet("Disabled", "ExistingExternalUserSharingOnly","ExternalUserSharingOnly","ExternalUserAndGuestSharing")]
        $SharingCapability,

        [Parameter()]
        [System.UInt32]
        $StorageQuotaWarningLevel,

        [Parameter()]
        [System.boolean]
        $CommentsOnSitePagesDisabled,

        [Parameter()]
        [System.boolean]
        $SocialBarOnSitePagesDisabled,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableAppViews,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableCompanyWideSharingLinks,
        
        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableFlows,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisabledWebpartIds,

        [Parameter()]
        [System.String]
        [ValidateSet("BlockMoveOnly", "BlockFull","Unknown")]
        $RestrictedToGeo,

        [Parameter()]
        [System.String]
        $SharingAllowedDomainList,

        [Parameter()]
        [System.String]
        $SharingBlockedDomainList,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "AllowList","BlockList")]
        $SharingDomainRestrictionMode,

        [Parameter()]
        [System.Boolean]
        $ShowPeoplePickerSuggestionsForGuestUsers,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "AnonymousAccess","Internal","Direct")]
        $DefaultSharingLinkType,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "View","Edit")]
        $DefaultLinkPermission,

        [Parameter()] 
        [ValidateSet("Present", "Absent")] 
        [System.String] 
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.String]
        $CentralAdminUrl,

        [Parameter(Mandatory = $true)] 
        [System.Management.Automation.PSCredential] 
        $GlobalAdminAccount
    )

    Test-SPOServiceConnection -SPOCentralAdminUrl $CentralAdminUrl -GlobalAdminAccount $GlobalAdminAccount

    $nullReturn = @{
        Url                                         = $Url
        Owner                                       = $null
        #TimeZoneId                                 = $null
        LocaleId                                    = $null
        Template                                    = $null
        ResourceQuota                               = $null
        StorageQuota                                = $null
        CompatibilityLevel                          = $null
        Title                                       = $null
        AllowSelfServiceUpgrade                     = $null
        DenyAddAndCustomizePages                    = $null
        LockState                                   = $null
        ResourceQuotaWarningLevel                   = $null
        SharingCapability                           = $null
        StorageQuotaWarningLevel                    = $null
        CommentsOnSitePagesDisabled                 = $null
        SocialBarOnSitePagesDisabled                = $null
        DisableAppViews                             = $null
        DisableCompanyWideSharingLinks              = $null
        DisableFlows                                = $null
        DisabledWebpartIds                          = $null
        RestrictedToGeo                             = $null
        SharingAllowedDomainList                    = $null
        SharingBlockedDomainList                    = $null
        SharingDomainRestrictionMode                = $null
        ShowPeoplePickerSuggestionsForGuestUsers    = $null
        DefaultSharingLinkType                      = $null
        DefaultLinkPermission                       = $null
        Ensure                                      = "Absent"
        CentralAdminUrl                             = $CentralAdminUrl
    }

    try
    {
        Write-Verbose -Message "Getting site collection $Url"
        $site = Get-SPOSite $Url
        if ($null -eq $site)
        {
            Write-Verbose "The specified Site Collection doesn't already exist."
            return $nullReturn
        }
        return @{
            Url                                         = $site.Url
            Owner                                       = $site.Owner
            #TimeZoneId                                 = $site.TimeZoneId
            LocaleId                                    = $site.LocaleId
            Template                                    = $site.Template
            ResourceQuota                               = $site.ResourceQuota
            StorageQuota                                = $site.StorageQuota
            CompatibilityLevel                          = $site.CompatibilityLevel
            Title                                       = $site.Title
            AllowSelfServiceUpgrade                     = $site.AllowSelfServiceUpgrade
            DenyAddAndCustomizePages                    = $site.DenyAddAndCustomizePages
            LockState                                   = $site.LockState
            ResourceQuotaWarningLevel                   = $site.ResourceQuotaWarningLevel
            SharingCapability                           = $site.SharingCapability
            StorageQuotaWarningLevel                    = $site.StorageQuotaWarningLevel
            CommentsOnSitePagesDisabled                 = $site.CommentsOnSitePagesDisabled
            SocialBarOnSitePagesDisabled                = $site.SocialBarOnSitePagesDisabled
            DisableAppViews                             = $site.DisableAppViews
            DisableCompanyWideSharingLinks              = $site.DisableCompanyWideSharingLinks
            DisableFlows                                = $site.DisableFlows
            DisabledWebpartIds                          = $site.DisabledWebpartIds
            RestrictedToGeo                             = $site.RestrictedToGeo
            SharingAllowedDomainList                    = $site.SharingAllowedDomainList
            SharingBlockedDomainList                    = $site.SharingBlockedDomainList
            SharingDomainRestrictionMode                = $site.SharingDomainRestrictionMode
            ShowPeoplePickerSuggestionsForGuestUsers    = $site.ShowPeoplePickerSuggestionsForGuestUsers
            DefaultSharingLinkType                      = $site.DefaultSharingLinkType
            DefaultLinkPermission                       = $site.DefaultLinkPermission
            CentralAdminUrl                             = $CentralAdminUrl
            Ensure                                      = "Present"
        }
    }
    catch
    {
        Write-Verbose "The specified Site Collection doesn't already exist."
        return $nullReturn
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Url,

        [Parameter()]
        [System.String]
        $Owner,

        [Parameter()]
        [System.UInt32]
        $StorageQuota,

        [Parameter()]
        [System.String]
        $Title,

        [Parameter()]
        [System.UInt32]
        $CompatibilityLevel,

        [Parameter()]
        [System.UInt32]
        $LocaleId,

        [Parameter()]
        [System.UInt32]
        $ResourceQuota,

        [Parameter()]
        [System.String]
        $Template,

        [Parameter()]
        [System.UInt32]
        $TimeZoneId,
        
        [Parameter()]
        [System.Boolean]
        $AllowSelfServiceUpgrade,

        [Parameter()]
        [System.Boolean]
        $DenyAddAndCustomizePages,

        [Parameter()]
        [System.String]
        [ValidateSet("NoAccess", "Unlock")]
        $LockState,

        [Parameter()]
        [System.UInt32]
        $ResourceQuotaWarningLevel,

        [Parameter()]
        [System.String]
        [ValidateSet("Disabled", "ExistingExternalUserSharingOnly","ExternalUserSharingOnly","ExternalUserAndGuestSharing")]
        $SharingCapability,

        [Parameter()]
        [System.UInt32]
        $StorageQuotaWarningLevel,

        [Parameter()]
        [System.boolean]
        $CommentsOnSitePagesDisabled,

        [Parameter()]
        [System.boolean]
        $SocialBarOnSitePagesDisabled,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableAppViews,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableCompanyWideSharingLinks,
        
        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableFlows,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisabledWebpartIds,

        [Parameter()]
        [System.String]
        [ValidateSet("BlockMoveOnly", "BlockFull","Unknown")]
        $RestrictedToGeo,

        [Parameter()]
        [System.String]
        $SharingAllowedDomainList,

        [Parameter()]
        [System.String]
        $SharingBlockedDomainList,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "AllowList","BlockList")]
        $SharingDomainRestrictionMode,

        [Parameter()]
        [System.Boolean]
        $ShowPeoplePickerSuggestionsForGuestUsers,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "AnonymousAccess","Internal","Direct")]
        $DefaultSharingLinkType,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "View","Edit")]
        $DefaultLinkPermission,

        [Parameter()] 
        [ValidateSet("Present", "Absent")] 
        [System.String] 
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.String]
        $CentralAdminUrl,

        [Parameter(Mandatory = $true)] 
        [System.Management.Automation.PSCredential] 
        $GlobalAdminAccount
    )

    Test-SPOServiceConnection -SPOCentralAdminUrl $CentralAdminUrl -GlobalAdminAccount $GlobalAdminAccount

    if($Ensure -eq "Present")
    {
        $deletedSite = Get-SPODeletedSite | Where-Object { $_.Url -eq $Url }

        if($deletedSite)
        {
            Write-Verbose "A site with URL $($URL) was found in the Recycle Bin."
            Write-Verbose "Restoring Delete SPOSite $($Url)"
            Restore-SPODeletedSite $deletedSite
        }
        else 
        {
            try 
            {
                $siteExists = get-SPOSite $Url
            }
            catch
            {
                Write-Verbose "Site does not exist. Creating it"
            }
            if($null -eq $siteExists)
            {
                Write-Verbose -Message "Creating site collection $Url"
                $CurrentParameters = $PSBoundParameters
                $CurrentParameters.Remove("CentralAdminUrl")
                $CurrentParameters.Remove("GlobalAdminAccount")
                $CurrentParameters.Remove("Ensure")
                $CurrentParameters.Remove("AllowSelfServiceUpgrade")
                $CurrentParameters.Remove("DenyAddAndCustomizePages")
                $CurrentParameters.Remove("LockState")
                $CurrentParameters.Remove("ResourceQuotaWarningLevel")
                $CurrentParameters.Remove("SharingCapability")
                $CurrentParameters.Remove("StorageQuotaWarningLevel")
                $CurrentParameters.Remove("CommentsOnSitePagesDisabled")
                $CurrentParameters.Remove("SocialBarOnSitePagesDisabled")
                $CurrentParameters.Remove("DisableAppViews")
                $CurrentParameters.Remove("DisableCompanyWideSharingLinks")
                $CurrentParameters.Remove("DisableFlows")
                $CurrentParameters.Remove("DisabledWebpartIds")
                $CurrentParameters.Remove("RestrictedToGeo")
                $CurrentParameters.Remove("SharingAllowedDomainList")
                $CurrentParameters.Remove("SharingBlockedDomainList")
                $CurrentParameters.Remove("SharingDomainRestrictionMode")
                $CurrentParameters.Remove("ShowPeoplePickerSuggestionsForGuestUsers")
                $CurrentParameters.Remove("DefaultSharingLinkType")
                $CurrentParameters.Remove("DefaultLinkPermission")
                New-SPOSite @CurrentParameters
            }
            else
            {
                Write-Verbose "Configuring site collection $Url"
                if($siteExists.LockState -eq "NoAccess")
                {
                    $CurrentParameters = $PSBoundParameters
                    Write-Debug "The site $url currenlty is in Lockstate NoAccess and for that cannot be changed"
                    $CurrentParameters.Remove("CentralAdminUrl")
                    $CurrentParameters.Remove("GlobalAdminAccount")
                    $CurrentParameters.Remove("Ensure")
                    $CurrentParameters.Remove("AllowSelfServiceUpgrade")
                    $CurrentParameters.Remove("DenyAddAndCustomizePages")
                    $CurrentParameters.Remove("ResourceQuotaWarningLevel")
                    $CurrentParameters.Remove("SharingCapability")
                    $CurrentParameters.Remove("StorageQuotaWarningLevel")
                    $CurrentParameters.Remove("CommentsOnSitePagesDisabled")
                    $CurrentParameters.Remove("SocialBarOnSitePagesDisabled")
                    $CurrentParameters.Remove("DisableAppViews")
                    $CurrentParameters.Remove("DisableCompanyWideSharingLinks")
                    $CurrentParameters.Remove("DisableFlows")
                    $CurrentParameters.Remove("DisabledWebpartIds")
                    $CurrentParameters.Remove("RestrictedToGeo")
                    $CurrentParameters.Remove("SharingAllowedDomainList")
                    $CurrentParameters.Remove("SharingBlockedDomainList")
                    $CurrentParameters.Remove("SharingDomainRestrictionMode")
                    $CurrentParameters.Remove("ShowPeoplePickerSuggestionsForGuestUsers")
                    $CurrentParameters.Remove("DefaultSharingLinkType")
                    $CurrentParameters.Remove("DefaultLinkPermission")
                    $CurrentParameters.Remove("CompatibilityLevel")
                    $CurrentParameters.Remove("Template")
                    $CurrentParameters.Remove("LocaleId")
                    $CurrentParameters.Remove("Url")
                    $CurrentParameters.Remove("Owner")
                    $CurrentParameters.Remove("StorageQuota")
                    $CurrentParameters.Remove("Title")
                    $CurrentParameters.Remove("ResourceQuota")
                    $CurrentParameters.Remove("TimeZoneId")
                    Set-SPOSite -Identity $Url @CurrentParameters -NoWait
                }
                else
                {
                    $CurrentParameters = $PSBoundParameters
                    $CurrentParameters = $PSBoundParameters
                    $CurrentParameters.Remove("CentralAdminUrl")
                    $CurrentParameters.Remove("GlobalAdminAccount")
                    $CurrentParameters.Remove("Ensure")
                    $CurrentParameters.Remove("Url")
                    $CurrentParameters.Remove("CompatibilityLevel")
                    $CurrentParameters.Remove("Template")
                    $CurrentParameters.Remove("LocaleId")
                    Set-SPOSite -Identity $Url @CurrentParameters -NoWait
                }
                
            }
            
        }
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Url,

        [Parameter()]
        [System.String]
        $Owner,

        [Parameter()]
        [System.UInt32]
        $StorageQuota,

        [Parameter()]
        [System.String]
        $Title,

        [Parameter()]
        [System.UInt32]
        $CompatibilityLevel,

        [Parameter()]
        [System.UInt32]
        $LocaleId,

        [Parameter()]
        [System.UInt32]
        $ResourceQuota,

        [Parameter()]
        [System.String]
        $Template,

        [Parameter()]
        [System.UInt32]
        $TimeZoneId,
        
        [Parameter()]
        [System.Boolean]
        $AllowSelfServiceUpgrade,

        [Parameter()]
        [System.Boolean]
        $DenyAddAndCustomizePages,

        [Parameter()]
        [System.String]
        [ValidateSet("NoAccess", "Unlock")]
        $LockState,

        [Parameter()]
        [System.UInt32]
        $ResourceQuotaWarningLevel,

        [Parameter()]
        [System.String]
        [ValidateSet("Disabled", "ExistingExternalUserSharingOnly","ExternalUserSharingOnly","ExternalUserAndGuestSharing")]
        $SharingCapability,

        [Parameter()]
        [System.UInt32]
        $StorageQuotaWarningLevel,

        [Parameter()]
        [System.boolean]
        $CommentsOnSitePagesDisabled,

        [Parameter()]
        [System.boolean]
        $SocialBarOnSitePagesDisabled,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableAppViews,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableCompanyWideSharingLinks,
        
        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisableFlows,

        [Parameter()]
        [System.String]
        [ValidateSet("Unknown", "Disabled","NotDisabled")]
        $DisabledWebpartIds,

        [Parameter()]
        [System.String]
        [ValidateSet("BlockMoveOnly", "BlockFull","Unknown")]
        $RestrictedToGeo,

        [Parameter()]
        [System.String]
        $SharingAllowedDomainList,

        [Parameter()]
        [System.String]
        $SharingBlockedDomainList,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "AllowList","BlockList")]
        $SharingDomainRestrictionMode,

        [Parameter()]
        [System.Boolean]
        $ShowPeoplePickerSuggestionsForGuestUsers,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "AnonymousAccess","Internal","Direct")]
        $DefaultSharingLinkType,

        [Parameter()]
        [System.String]
        [ValidateSet("None", "View","Edit")]
        $DefaultLinkPermission,

        [Parameter()] 
        [ValidateSet("Present", "Absent")] 
        [System.String] 
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.String]
        $CentralAdminUrl,

        [Parameter(Mandatory = $true)] 
        [System.Management.Automation.PSCredential] 
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Testing site collection $Url"
    $CurrentValues = Get-TargetResource @PSBoundParameters
    return Test-Office365DSCParameterState -CurrentValues $CurrentValues `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck @("Ensure", `
                        "Url", `
                        "Title", `
                        "Owner", `
                        "StorageQuota", `
                        "CompatibilityLevel", `
                        "LocaleId", `
                        "ResourceQuota", `
                        "Template", `
                        "TimeZoneId", `
                        "AllowSelfServiceUpgrade", `
                        "DenyAddAndCustomizePages", `
                        "LockState", `
                        "ResourceQuotaWarningLevel", `
                        "SharingCapability", `
                        "StorageQuotaWarningLevel", `
                        "CommentsOnSitePagesDisabled", `
                        "SocialBarOnSitePagesDisabled", `
                        "DisableAppViews", `
                        "DisableCompanyWideSharingLinks", `
                        "DisableFlows", `
                        "DisabledWebpartIds", `
                        "RestrictedToGeo", `
                        "SharingAllowedDomainList", `
                        "SharingBlockedDomainList", `
                        "SharingDomainRestrictionMode", `
                        "ShowPeoplePickerSuggestionsForGuestUsers", `
                        "DefaultSharingLinkType", `
                        "DefaultLinkPermission"
    )
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Url,

        [Parameter(Mandatory = $true)]
        [System.String]
        $CentralAdminUrl,

        [Parameter(Mandatory = $true)] 
        [System.Management.Automation.PSCredential] 
        $GlobalAdminAccount
    )
    $result = Get-TargetResource @PSBoundParameters
    $result.GlobalAdminAccount = Resolve-Credentials -UserName $GlobalAdminAccount.UserName
    $content = "        SPOSite " + (New-GUID).ToString() + "`r`n"
    $content += "        {`r`n"
    $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
    $content += Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "GlobalAdminAccount"
    $content += "        }`r`n"
    return $content
}

Export-ModuleMember -Function *-TargetResource
