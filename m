Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608598;
	b=vg4NUWqDo881GNDC+/M0cLiQ00bRYK8s1thwMtw9xyvhh3MA69O62hrxkhlUOMADk+j9
	 0pYphCUKZGtiMhqZOp3bZXCSMXbGoETiBS1wvtm6/MeK+Xc7XWvL+bQvqzLIl8vrLGntF
	 sKy2OoETfGrRM7Ox8HHEOdPtgP1ez5NSPgoABPXbzfA2oH+KdPHCvhy/4bNJ0Jvz70R3P
	 PHeSyUTNQmPO6wZYIm6DLXLL/phBAWh7Ktt0ouejj0PloQeBn630Fz6gjV/K1XRxv8jfH
	 v4x4Xv2Wl0fKBN/v3VBUDLHo4pPs+4Vef5DOTCwwlRLrCZ9TJaAWicPCvytzeCgdR5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608598;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=si35fW3jaUX23Aj5UpSSias/iumRDP/hnnRISPstyRU=;
	b=fEcCn/HbiUYKTinFQayFtR3FCptSruZIvYBj18ik0U0IYsDDlhHiwkY+b2Noh8QFK2vI
	 JEamptQLbCVyc9gfeLAmoYs/0JQVEQAVALwrfB6+PQ4+Cb77cd3HVZWNo0T8L9bE+INIH
	 0U1FVGYJTNnyQKEYZwGeS8bkI/grruWil3E1ADNdwjSAQB8iIOZiSfhDydby1GTC3fPPn
	 rgE9HGYB7gFk9FDSHmzuAFqNlvZ6tlu8b8agmyiA9VxwC3SwtgU9kEgXAxsUPIYonOTfK
	 wuaR9jfnWMjrjpReTnia11TQwbCGK2lUOckTBlDP7/4eMUPmk2ii4HZMq+Qtx1ROV8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uq3CxFtS;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBA606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uq3CxFtS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795608598; x=1827144598;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0N4MOMJLP1Ett0d7H+EDnyYqeY3CLxe9NS8SO8ODR90=;
  b=Uq3CxFtSBfwzxjgm7vwX3Z0FwfP/5WhEsYxuP252GWAYmX0+sCQCPipR
   7GXW8/TrC7KBzdFHIl1PntAtwb7DR3IaJJ8M9yXJeUORtSbNj3ejtV1xM
   3snO73BKHI9swPM6CBVCF0agR+QyBkIdruUKxsRsxi/7X69nH60cqI56F
   VjqTI06LkKyihpyud/VRQWyyMNs2iMNz1MdQlVkFOfHX3jMZ7kI67zWiX
   kX2/AGPyp6i4rLJhq1rVPr+7xjXf7n7vlxOMGkJbPfC5rk+tqdFprP0dC
   grrseC2UjLK8SfR7nwgJ7o9sLWHXZ8KUTOPkZbZamxjsicwUW7P9pXvSj
   g==;
X-CSE-ConnectionGUID: iTDGV5m/S6+i2Gitnc98lA==
X-CSE-MsgGUID: 9lbmH/blSJeggR6gYEIHCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4544941"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4544941"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:05:58 -0800
X-CSE-ConnectionGUID: KStRXhKFS0OiKdokfHI2kA==
X-CSE-MsgGUID: VX2kQYaYQhCkGUm0agO8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12068942"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:04:44 -0800
Received: from [10.102.88.199] (soc-5CG4396XFD.clients.intel.com [10.102.88.199])
	by linux.intel.com (Postfix) with ESMTP id C147E20B8DC3;
	Wed, 25 Nov 2026 04:04:40 -0800 (PST)
Message-ID: <c46e69db-e0bf-403c-bd52-d6f867ea0e5f@linux.intel.com>
Date: Wed, 25 Nov 2026 13:04:39 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 3/4] ixgbevf: fix link speed reporting for Hyper-V
 E610 VFs
To: netdev-bot+sashiko@kernel.org, anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 ripatel@wii.dev, xiaolinkui@kylinos.cn, xiaolinkui@126.com,
 runyu.xiao@seu.edu.cn, horms@kernel.org, marcin.szycik@linux.intel.com,
 przemyslaw.kitszel@intel.com, rafal.romanowski@intel.com
References: <20261120220022.3133664-4-anthony.l.nguyen@intel.com>
 <179555765941.3135.17127854838678149583@kernel.org>
Content-Language: pl
From: Tomasz Lichwala <tomasz.lichwala@linux.intel.com>
In-Reply-To: <179555765941.3135.17127854838678149583@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24.11.2026 23:00, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 5 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new Hyper-V E610 path in ixgbevf_hv_check_mac_link_vf()
>   (drivers/net/ethernet/intel/ixgbevf/vf.c:998-1011) decodes the value…
> - [Medium] The patch adds a `default:` case to
>   ixgbevf_hv_check_mac_link_vf() (vf.c:1008-1010).
> - [Medium] The commit message only says VFLINKS "does not carry valid
>   link speed" on Hyper-V E610, which implies the VFLINKS link-up bit is…
> - [Medium] ixgbevf_hv_read_links_e610() (vf.c:923-927) refuses to read
>   offset 0x209 unless CONFIG_PCI_MMCONFIG is set, and the commit…
> - [Medium] ixgbevf_get_link_ksettings() (ethtool.c:91) treats a device as
>   a Hyper-V E610 VF based only on `adapter->pdev->subsystem_device ==…
> - [Medium] The patch adds a second writer of adapter->link_speed and
>   adapter->link_up.
> - [Low] The commit message says that, to avoid transactions on every
>   watchdog cycle, the driver reads the PCI config register on demand…
> 
> --
> 
> ixgbevf: fix link speed reporting for Hyper-V E610 VFs
> 
> This commit changes ixgbevf_hv_check_mac_link_vf() so that E610 VFs read
> link status from emulated PCI config space at offset 0x209 instead of the
> VFLINKS register. On Hyper-V E610 VFs, ixgbevf_get_link_ksettings() now
> forces a fresh link check, and the config space read is gated on
> CONFIG_PCI_MMCONFIG.
> 
>> diff --git a/drivers/net/ethernet/intel/ixgbevf/ethtool.c b/drivers/net/ethernet/intel/ixgbevf/ethtool.c
>> index 537a60d5276f0..5d0fb4f4d9a33 100644
>> --- a/drivers/net/ethernet/intel/ixgbevf/ethtool.c
>> +++ b/drivers/net/ethernet/intel/ixgbevf/ethtool.c
>> @@ -83,6 +83,18 @@ static int ixgbevf_get_link_ksettings(struct net_device *netdev,
>>  				      struct ethtool_link_ksettings *cmd)
>>  {
>>  	struct ixgbevf_adapter *adapter = netdev_priv(netdev);
>> +	struct ixgbe_hw *hw = &adapter->hw;
>> +
>> +	/* Hyper-V E610 VFs: read current link speed from PCI config space
>> +	 * on every link speed query.
>> +	 */
>> +	if (adapter->pdev->subsystem_device == IXGBE_SUBDEV_ID_E610_VF_HV) {
> 
> [Severity: Medium]
> Should this check also match the device ID? Another option is
> hw->mac.type == ixgbe_mac_e610_vf, which is the check vf.c uses.
> 
> At probe time the HV board is identified by the device ID and the
> subsystem ID together, in ixgbevf_pci_tbl[]:
> 
> 	PCI_VDEVICE_SUB(INTEL, IXGBE_DEV_ID_E610_VF,
> 			PCI_ANY_ID, IXGBE_SUBDEV_ID_E610_VF_HV),
> 	.driver_data = board_e610_vf_hv,
> 
> Take a native 82599/X540/X550 VF whose subsystem ID is 0x00FF. This
> block forces get_link_status = true and then runs
> ixgbevf_check_mac_link_vf(). If no PF message is pending, mbx->ops.read()
> fails there:
> 
> 	if (mbx->ops.read(hw, &in_msg, 1)) {
> 		if (adapter->pf_features & IXGBEVF_PF_SUP_ESX_MBX)
> 			mac->get_link_status = false;
> 		goto out;
> 	}
> 
> get_link_status then stays true and link_up comes back false. Could a
> read-only ethtool or sysfs speed query drop the carrier until the PF
> sends its next mailbox message?
> 
> No non-E610 board with subsystem ID 0x00FF exists in the tree today.
> 

The scenario needs a non-E610 Intel VF that carries subsystem ID 0x00FF, and as you note no such board exists. The older Hyper-V VFs (82599/X540/X550/X550EM) are identified by their own *_VF_HV device IDs, not by subsystem ID. 0x00FF is the Hyper-V marker for E610 VFs. For an E610 VF, the PCI table entry PCI_VDEVICE_SUB(E610_VF, ANY, 0x00FF) always wins, so the ethtool check and the HV ops cannot disagree.

>> +		spin_lock_bh(&adapter->mbx_lock);
>> +		hw->mac.get_link_status = true;
>> +		hw->mac.ops.check_link(hw, &adapter->link_speed,
>> +				       &adapter->link_up, false);
>> +		spin_unlock_bh(&adapter->mbx_lock);
> 
> [Severity: Medium]
> Can this race with the watchdog writing adapter->link_speed and
> adapter->link_up back?
> 
> ixgbevf_watchdog_update_link() copies both fields before it takes
> mbx_lock and writes them back after it releases the lock:
> 
> 	u32 link_speed = adapter->link_speed;
> 	bool link_up = adapter->link_up;
> 	...
> 	spin_lock_bh(&adapter->mbx_lock);
> 	err = hw->mac.ops.check_link(hw, &link_speed, &link_up, false);
> 	spin_unlock_bh(&adapter->mbx_lock);
> 	...
> 	adapter->link_up = link_up;
> 	adapter->link_speed = link_speed;
> 
> ixgbevf_watchdog_link_is_down() also writes adapter->link_speed = 0
> without the lock.
> 
> One possible interleaving:
> 
> service task                        ethtool
> link_speed = 10G (copy)
> check_link(), get_link_status
>   is false, keeps 10G
>                                     check_link() reads 1G from 0x209
>                                     into adapter->link_speed,
>                                     get_link_status = false
> adapter->link_speed = 10G
> 
> get_link_status is now false, so later watchdog cycles don't re-read the
> register. The stale 10G stays until the next ethtool query.
> 
> In the same way, the watchdog could write back a stale link_up = true
> after ethtool saw link down. ixgbevf_watchdog_subtask() would then keep
> the carrier on for an extra cycle.
> 
> The fields are read again below, after spin_unlock_bh(), without the
> lock. Could ethtool report link_up and link_speed from two different
> updates?
> 

check_link itself is serialized by mbx_lock. The copy-before-lock and write-back-after-unlock pattern in ixgbevf_watchdog_update_link() is pre-existing, and ixgbevf_watchdog_link_is_down() already writes link_speed without the lock. ixgbevf_get_link_ksettings() has always read link_up and link_speed without the lock, concurrently with the watchdog, so a mixed snapshot is not new. The window described is narrow and corrects itself. Every ethtool or sysfs query forces a fresh read. A stale link_up=true is re-read on the next watchdog cycle because get_link_status stays true while the link is down, which is the same latency as the normal polling. A stale adapter->link_speed has no other consumer: the "Link is Up" message is printed only on a carrier off->on transition, which comes from a fresh read. There is no memory-safety impact.

>> diff --git a/drivers/net/ethernet/intel/ixgbevf/vf.c b/drivers/net/ethernet/intel/ixgbevf/vf.c
>> index f6df86d124b9e..a84b62641e9bc 100644
>> --- a/drivers/net/ethernet/intel/ixgbevf/vf.c
>> +++ b/drivers/net/ethernet/intel/ixgbevf/vf.c
> 
> [ ... ]
> 
>> @@ -901,6 +904,40 @@ static s32 ixgbevf_check_mac_link_vf(struct ixgbe_hw *hw,
> 
> [ ... ]
> 
>> +static s32 ixgbevf_hv_read_links_e610(struct ixgbe_hw *hw, u32 *links_reg)
>> +{
>> +	struct ixgbevf_adapter *adapter = hw->back;
>> +	u8 data[IXGBE_HV_LINK_STATUS_SIZE];
>> +
>> +	if (!IS_ENABLED(CONFIG_PCI_MMCONFIG)) {
>> +		dev_err_once(&adapter->pdev->dev,
>> +			     "cannot read link status, PCI_MMCONFIG is required for Hyper-V\n");
>> +		return -EOPNOTSUPP;
>> +	}
> 
> [Severity: Medium]
> Is CONFIG_PCI_MMCONFIG actually needed for this read? The commit message
> says:
> 
>   Guard the PCI config space read with IS_ENABLED(CONFIG_PCI_MMCONFIG),
>   since accessing offsets above 256 requires MMCONFIG support.
> 
> A Hyper-V VF sits on the pci-hyperv bus. Its config accessor,
> _hv_pcifront_read_config(), serves the whole 4K config page through the
> vPCI window or through hypercalls:
> 
> 	} else if (where + size <= CFG_PAGE_SIZE) {
> 
> 		spin_lock_irqsave(&hbus->config_lock, flags);
> 		if (hbus->use_calls) {
> 		...
> 
> PCI_MMCONFIG is x86-only and optional on X86_64. PCI_HYPERV also
> supports ARM64.
> 
> On arm64 Hyper-V guests, and on x86_64 guests built with
> PCI_MMCONFIG=n, this function always returns -EOPNOTSUPP. As a result,
> ixgbevf_hv_check_mac_link_vf() reports *link_up = false on every
> watchdog cycle.
> 
> Before this patch the link-up bit came from VFLINKS, so the carrier came
> up in those configurations. Does this leave the VF link down permanently
> there? netvsc only sends through the VF when netif_carrier_ok(vf_netdev)
> is true, so TX through the VF would be lost.
> 
> The same guard already exists in ixgbevf_hv_reset_hw_vf(), so those
> builds already lack the host-provided MAC address. Before this patch,
> though, the link still came up.
> 

The guard intentionally mirrors the one in ixgbevf_hv_reset_hw_vf(), and that is why the claimed data-path impact does not happen. Without MMCONFIG, reset_hw returns -EOPNOTSUPP, the VF never gets the host-assigned MAC from 0x201, and sw_init assigns a random MAC. netvsc pairs a VF with the synthetic NIC by matching perm_addr in get_netvsc_byslot(), so such a VF is never enslaved and netvsc never sends traffic through it. Those configurations (arm64, or x86_64 with PCI_MMCONFIG=n) were already non-functional for Hyper-V VFs before this patch.

> [ ... ]
> 
>> @@ -926,8 +964,16 @@ static s32 ixgbevf_hv_check_mac_link_vf(struct ixgbe_hw *hw,
>>  	if (!mac->get_link_status)
>>  		goto out;
>>  
>> -	/* if link status is down no point in checking to see if pf is up */
>> -	links_reg = IXGBE_READ_REG(hw, IXGBE_VFLINKS);
>> +	if (mac->type == ixgbe_mac_e610_vf) {
>> +		if (ixgbevf_hv_read_links_e610(hw, &links_reg)) {
>> +			*link_up = false;
>> +			*speed = IXGBE_LINK_SPEED_UNKNOWN;
>> +			return 0;
>> +		}
>> +	} else {
>> +		links_reg = IXGBE_READ_REG(hw, IXGBE_VFLINKS);
>> +	}
>> +
>>  	if (!(links_reg & IXGBE_LINKS_UP))
>>  		goto out;
> 
> [Severity: Medium]
> The commit message says VFLINKS "does not carry valid link speed". That
> suggests the VFLINKS link-up bit is still valid. Is it intended that
> link-up detection for E610 also moves to offset 0x209, with no fallback
> to VFLINKS?
> 
> Suppose a Hyper-V host doesn't provide link status at 0x209, for
> example because reads there return 0. IXGBE_LINKS_UP is then never set,
> get_link_status stays true, and the VF never gets carrier.
> 
> The patch has a Fixes: tag. Could it be backported to guests running on
> hosts that don't provide this interface?
> 

This is intended. On Hyper-V, 0x209 is the host-provided link interface for E610 VFs, the same mechanism as the MAC address at 0x201. A fallback is not workable: a 0x209 value without LINKS_UP cannot be told apart from a real link down, so falling back to VFLINKS would defeat link-down reporting. The Fixes: scope is only kernels containing 4c44b450c69b, which is where the E610 HV board (device 0x57AD, subsystem 0x00FF) was introduced. I tested on a real Hyper-V host with an E610 VF, with the reported speed following the host link speed change (10G -> 1G).

> [Severity: Low]
> The commit message says:
> 
>   To avoid generating unnecessary VMBus transactions on every watchdog
>   cycle, read the PCI config register on demand when ethtool or sysfs
>   queries link speed, rather than polling it periodically.
> 
> Does this match the code? ixgbevf_watchdog_update_link() calls
> check_link() on every service cycle. Whenever get_link_status is true,
> this path does four pci_read_config_byte() calls per cycle. That covers
> link down, after ixgbevf_up(), after the mailbox interrupt, after a
> detected reset, and after a failed config read.
> 
> Only the steady link-up state avoids the periodic reads. Could the
> commit message describe this more precisely?
> 
> [ ... ]
> 
>> @@ -956,6 +1005,9 @@ static s32 ixgbevf_hv_check_mac_link_vf(struct ixgbe_hw *hw,
>>  	case IXGBE_LINKS_SPEED_100_82599:
>>  		*speed = IXGBE_LINK_SPEED_100_FULL;
>>  		break;
> 
> [Severity: High]
> The commit message says offset 0x209 uses the VFLINKS register format.
> If so, should this switch also check IXGBE_LINKS_SPEED_NON_STD for E610?
> The PF driver decodes the same layout in ixgbe_check_mac_link_generic():
> 

The E610 PF does not decode LINKS through ixgbe_check_mac_link_generic(). Its check_link op is ixgbe_check_link_e610(), which takes the speed from FW over ACI. This patch also does not make the 2.5G/5G case worse. Before it, the E610 HV path decoded VFLINKS with the same three-case switch. The non-HV ixgbe_read_vflinks() and the X550 HV VFs have the same limitation. More importantly, ixgbevf has no 2.5G/5G constants and ixgbevf_get_link_ksettings() maps only 10G/1G/100M. So even the E610 mailbox path (API 1.6), where the PF sends IXGBE_LINK_SPEED_2_5GB_FULL/5GB_FULL, reports 10000 today. That is a driver-wide gap in speed reporting, not something this fix introduced.

> 	case IXGBE_LINKS_SPEED_10G_82599:
> 		if ((hw->mac.type >= ixgbe_mac_X550) &&
> 		    (links_reg & IXGBE_LINKS_SPEED_NON_STD))
> 			*speed = IXGBE_LINK_SPEED_2_5GB_FULL;
> 		else
> 			*speed = IXGBE_LINK_SPEED_10GB_FULL;
> 		break;
> 	...
> 	case IXGBE_LINKS_SPEED_100_82599:
> 		if ((hw->mac.type >= ixgbe_mac_X550 ||
> 		     hw->mac.type == ixgbe_mac_e610) &&
> 		    (links_reg & IXGBE_LINKS_SPEED_NON_STD))
> 			*speed = IXGBE_LINK_SPEED_5GB_FULL;
> 		else
> 			*speed = IXGBE_LINK_SPEED_100_FULL;
> 		break;
> 
> The ixgbevf defines.h has no NON_STD mask and no 2.5G or 5G link speed
> constants. ixgbevf_get_link_ksettings() only maps 10G, 1G and 100M.
> 
> E610 supports 2.5G and 5G. Would a Hyper-V E610 VF linked at 2.5G show
> 10000 Mb/s, and one linked at 5G show 100 Mb/s?
> 
> That looks like the same "stale or incorrect link speed" the commit
> message says this patch fixes.
> 
>> +	default:
>> +		*speed = IXGBE_LINK_SPEED_UNKNOWN;
>> +		break;
>>  	}
> 
> [Severity: Medium]
> After this default case, the code below still sets
> mac->get_link_status = false. The caller therefore sees link up with
> *speed == IXGBE_LINK_SPEED_UNKNOWN.
> 
> ixgbevf_get_link_ksettings() has no case for that value:
> 
> 	if (adapter->link_up) {
> 		__u32 speed = SPEED_10000;
> 
> 		switch (adapter->link_speed) {
> 		...
> 
> Wouldn't ethtool and sysfs then report 10000 Mb/s full duplex?
> ixgbevf_watchdog_link_is_up() prints "unknown speed" for the same value.
> 
> Speed bits 00 are the LINKS encoding for 10M on newer parts
> (IXGBE_LINKS_SPEED_10_X550EM_A in the PF driver). E610 supports 10M, so
> an E610 HV VF on a 10M link could hit this.
> 

The default case is strictly an improvement. Before it, *speed was left untouched, so the caller kept whatever value it had passed in: the cached adapter->link_speed, or a stale previous speed. It now matches what ixgbe_read_vflinks() already does for the non-HV path. Mapping an unknown speed to SPEED_10000 is pre-existing ethtool behaviour that every VF path shares (speed is initialised to SPEED_10000 and there is no UNKNOWN case). It is not changed by this patch. Speed bits 00 are not a defined E610 encoding in any VF or PF LINKS decoder. In ixgbe_check_mac_link_generic(), 00 means 10M only for X550EM_A 1G_T and UNKNOWN otherwise. Reporting SPEED_UNKNOWN from ethtool for unknown speeds can go into the speed-reporting follow-up.

Thanks,
Tomasz



