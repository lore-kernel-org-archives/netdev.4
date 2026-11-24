Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557661;
	b=rPvcjfZEFd98OwUm1gJqPpbwosCWI3br3xeB6BbBvqYprslo/cMstlgmxoQ4AhLuKvEu
	 LNbe+vi73FFUyzVCkxv2f1k/HqajGFeSQ1Ztmdc7wcgRSB9sDgzgV13fvFIom5Q69nQLG
	 Z27zZNj1Xjvsb1D0FmB5n0n9mmaHyAnIMHN+2/9Llx3OEkpo/yeSwIFDVbqNWA8n86eu+
	 CyqDQ5LSP1rIlcvoR51AUB/qIBesRrNN1QG1+cf4GHMcenYZVAxjgjQR+xWZC3HhAQYrT
	 kBnDIcWKRVL+g6mD8/xmiuAuD0fTDr9/KnXWSIlIcfLyx7/xuNJ+M3eXD4jnrlbaZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557661;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6jp3KZaz/ZkpXanQNjztnEQ/fib+E6gVes7nAHr09uQ=;
	b=hJNyApiK3onOpyL6w+Z8eJTlrnvFxweU46NM/g08zvusKMHGstP4kikx240TCiQMrOYv
	 KjEs6Fx1NfquKB5VpbxrMpRXsAGT/4J1QqXraiuofUxtJdyYixuRwTSbJl2veV2yf1Eet
	 Is5rwXphRmNoLm7FLY6ebIFTHAyg1nynMrL/d8pC05QE7oQOgfBRK92+OWxENh39Z82SN
	 ZXoMQN0CaVIBOhz9SV837ZpqpfbgXILBRVayJuyJLHpTCJYT6HHU3aJmQ6jPMCvTQ7C2X
	 73o1EsAau8aOhFT3dxY4fZvjrMp6AdBOW3PCDdzPRaUMbHYgZOaCMEIXjEagenILI0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h0IPc98z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890BF606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h0IPc98z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3D31F000D1;
	Tue, 24 Nov 2026 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557661;
	bh=6jp3KZaz/ZkpXanQNjztnEQ/fib+E6gVes7nAHr09uQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h0IPc98zFNLt508xyXDf01QaH/NZff1oyjH5Nh4BEzZhRbdcN86dMEo61YEL3S/VV
	 f/IBj6v0Z9dlk0ftURfXqF7E6fG337o4UAYL6Yw3FNHVDNArfoffSRzoSYBQlU5gzM
	 sQm8r/gTe2rLDngfNK/xMsL39fXfzy+C9lrcxswBpD49+B50gDCSmdVnyYBGiIWQ/a
	 ZyT1jydF8VSOmS2drmr9qbDhps0Jy3RMYfcj2jrPWHkLTj7Dn5JHOMZPhpOVx0RIP4
	 adioNzOmMXYwpE0wYdZ1hsBLenWYFcvOxVn/yH6uw0XsEnTY3ZmkZydIgQFo6eIvSy
	 hsSt1Hlu14L7w==
Subject:
 Re: [PATCH net 3/4] ixgbevf: fix link speed reporting for Hyper-V E610 VFs
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 tomasz.lichwala@linux.intel.com, ripatel@wii.dev, xiaolinkui@kylinos.cn,
 xiaolinkui@126.com, runyu.xiao@seu.edu.cn, horms@kernel.org,
 marcin.szycik@linux.intel.com, przemyslaw.kitszel@intel.com,
 rafal.romanowski@intel.com
Date: Tue, 24 Nov 2026 22:00:59 +0000
Message-ID: <179555765941.3135.17127854838678149583@kernel.org>
In-Reply-To: <20261120220022.3133664-4-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-4-anthony.l.nguyen@intel.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 5 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new Hyper-V E610 path in ixgbevf_hv_check_mac_link_vf()
  (drivers/net/ethernet/intel/ixgbevf/vf.c:998-1011) decodes the value…
- [Medium] The patch adds a `default:` case to
  ixgbevf_hv_check_mac_link_vf() (vf.c:1008-1010).
- [Medium] The commit message only says VFLINKS "does not carry valid
  link speed" on Hyper-V E610, which implies the VFLINKS link-up bit is…
- [Medium] ixgbevf_hv_read_links_e610() (vf.c:923-927) refuses to read
  offset 0x209 unless CONFIG_PCI_MMCONFIG is set, and the commit…
- [Medium] ixgbevf_get_link_ksettings() (ethtool.c:91) treats a device as
  a Hyper-V E610 VF based only on `adapter->pdev->subsystem_device ==…
- [Medium] The patch adds a second writer of adapter->link_speed and
  adapter->link_up.
- [Low] The commit message says that, to avoid transactions on every
  watchdog cycle, the driver reads the PCI config register on demand…

--

ixgbevf: fix link speed reporting for Hyper-V E610 VFs

This commit changes ixgbevf_hv_check_mac_link_vf() so that E610 VFs read
link status from emulated PCI config space at offset 0x209 instead of the
VFLINKS register. On Hyper-V E610 VFs, ixgbevf_get_link_ksettings() now
forces a fresh link check, and the config space read is gated on
CONFIG_PCI_MMCONFIG.

> diff --git a/drivers/net/ethernet/intel/ixgbevf/ethtool.c b/drivers/net/ethernet/intel/ixgbevf/ethtool.c
> index 537a60d5276f0..5d0fb4f4d9a33 100644
> --- a/drivers/net/ethernet/intel/ixgbevf/ethtool.c
> +++ b/drivers/net/ethernet/intel/ixgbevf/ethtool.c
> @@ -83,6 +83,18 @@ static int ixgbevf_get_link_ksettings(struct net_device *netdev,
>  				      struct ethtool_link_ksettings *cmd)
>  {
>  	struct ixgbevf_adapter *adapter = netdev_priv(netdev);
> +	struct ixgbe_hw *hw = &adapter->hw;
> +
> +	/* Hyper-V E610 VFs: read current link speed from PCI config space
> +	 * on every link speed query.
> +	 */
> +	if (adapter->pdev->subsystem_device == IXGBE_SUBDEV_ID_E610_VF_HV) {

[Severity: Medium]
Should this check also match the device ID? Another option is
hw->mac.type == ixgbe_mac_e610_vf, which is the check vf.c uses.

At probe time the HV board is identified by the device ID and the
subsystem ID together, in ixgbevf_pci_tbl[]:

	PCI_VDEVICE_SUB(INTEL, IXGBE_DEV_ID_E610_VF,
			PCI_ANY_ID, IXGBE_SUBDEV_ID_E610_VF_HV),
	.driver_data = board_e610_vf_hv,

Take a native 82599/X540/X550 VF whose subsystem ID is 0x00FF. This
block forces get_link_status = true and then runs
ixgbevf_check_mac_link_vf(). If no PF message is pending, mbx->ops.read()
fails there:

	if (mbx->ops.read(hw, &in_msg, 1)) {
		if (adapter->pf_features & IXGBEVF_PF_SUP_ESX_MBX)
			mac->get_link_status = false;
		goto out;
	}

get_link_status then stays true and link_up comes back false. Could a
read-only ethtool or sysfs speed query drop the carrier until the PF
sends its next mailbox message?

No non-E610 board with subsystem ID 0x00FF exists in the tree today.

> +		spin_lock_bh(&adapter->mbx_lock);
> +		hw->mac.get_link_status = true;
> +		hw->mac.ops.check_link(hw, &adapter->link_speed,
> +				       &adapter->link_up, false);
> +		spin_unlock_bh(&adapter->mbx_lock);

[Severity: Medium]
Can this race with the watchdog writing adapter->link_speed and
adapter->link_up back?

ixgbevf_watchdog_update_link() copies both fields before it takes
mbx_lock and writes them back after it releases the lock:

	u32 link_speed = adapter->link_speed;
	bool link_up = adapter->link_up;
	...
	spin_lock_bh(&adapter->mbx_lock);
	err = hw->mac.ops.check_link(hw, &link_speed, &link_up, false);
	spin_unlock_bh(&adapter->mbx_lock);
	...
	adapter->link_up = link_up;
	adapter->link_speed = link_speed;

ixgbevf_watchdog_link_is_down() also writes adapter->link_speed = 0
without the lock.

One possible interleaving:

service task                        ethtool
link_speed = 10G (copy)
check_link(), get_link_status
  is false, keeps 10G
                                    check_link() reads 1G from 0x209
                                    into adapter->link_speed,
                                    get_link_status = false
adapter->link_speed = 10G

get_link_status is now false, so later watchdog cycles don't re-read the
register. The stale 10G stays until the next ethtool query.

In the same way, the watchdog could write back a stale link_up = true
after ethtool saw link down. ixgbevf_watchdog_subtask() would then keep
the carrier on for an extra cycle.

The fields are read again below, after spin_unlock_bh(), without the
lock. Could ethtool report link_up and link_speed from two different
updates?

> diff --git a/drivers/net/ethernet/intel/ixgbevf/vf.c b/drivers/net/ethernet/intel/ixgbevf/vf.c
> index f6df86d124b9e..a84b62641e9bc 100644
> --- a/drivers/net/ethernet/intel/ixgbevf/vf.c
> +++ b/drivers/net/ethernet/intel/ixgbevf/vf.c

[ ... ]

> @@ -901,6 +904,40 @@ static s32 ixgbevf_check_mac_link_vf(struct ixgbe_hw *hw,

[ ... ]

> +static s32 ixgbevf_hv_read_links_e610(struct ixgbe_hw *hw, u32 *links_reg)
> +{
> +	struct ixgbevf_adapter *adapter = hw->back;
> +	u8 data[IXGBE_HV_LINK_STATUS_SIZE];
> +
> +	if (!IS_ENABLED(CONFIG_PCI_MMCONFIG)) {
> +		dev_err_once(&adapter->pdev->dev,
> +			     "cannot read link status, PCI_MMCONFIG is required for Hyper-V\n");
> +		return -EOPNOTSUPP;
> +	}

[Severity: Medium]
Is CONFIG_PCI_MMCONFIG actually needed for this read? The commit message
says:

  Guard the PCI config space read with IS_ENABLED(CONFIG_PCI_MMCONFIG),
  since accessing offsets above 256 requires MMCONFIG support.

A Hyper-V VF sits on the pci-hyperv bus. Its config accessor,
_hv_pcifront_read_config(), serves the whole 4K config page through the
vPCI window or through hypercalls:

	} else if (where + size <= CFG_PAGE_SIZE) {

		spin_lock_irqsave(&hbus->config_lock, flags);
		if (hbus->use_calls) {
		...

PCI_MMCONFIG is x86-only and optional on X86_64. PCI_HYPERV also
supports ARM64.

On arm64 Hyper-V guests, and on x86_64 guests built with
PCI_MMCONFIG=n, this function always returns -EOPNOTSUPP. As a result,
ixgbevf_hv_check_mac_link_vf() reports *link_up = false on every
watchdog cycle.

Before this patch the link-up bit came from VFLINKS, so the carrier came
up in those configurations. Does this leave the VF link down permanently
there? netvsc only sends through the VF when netif_carrier_ok(vf_netdev)
is true, so TX through the VF would be lost.

The same guard already exists in ixgbevf_hv_reset_hw_vf(), so those
builds already lack the host-provided MAC address. Before this patch,
though, the link still came up.

[ ... ]

> @@ -926,8 +964,16 @@ static s32 ixgbevf_hv_check_mac_link_vf(struct ixgbe_hw *hw,
>  	if (!mac->get_link_status)
>  		goto out;
>  
> -	/* if link status is down no point in checking to see if pf is up */
> -	links_reg = IXGBE_READ_REG(hw, IXGBE_VFLINKS);
> +	if (mac->type == ixgbe_mac_e610_vf) {
> +		if (ixgbevf_hv_read_links_e610(hw, &links_reg)) {
> +			*link_up = false;
> +			*speed = IXGBE_LINK_SPEED_UNKNOWN;
> +			return 0;
> +		}
> +	} else {
> +		links_reg = IXGBE_READ_REG(hw, IXGBE_VFLINKS);
> +	}
> +
>  	if (!(links_reg & IXGBE_LINKS_UP))
>  		goto out;

[Severity: Medium]
The commit message says VFLINKS "does not carry valid link speed". That
suggests the VFLINKS link-up bit is still valid. Is it intended that
link-up detection for E610 also moves to offset 0x209, with no fallback
to VFLINKS?

Suppose a Hyper-V host doesn't provide link status at 0x209, for
example because reads there return 0. IXGBE_LINKS_UP is then never set,
get_link_status stays true, and the VF never gets carrier.

The patch has a Fixes: tag. Could it be backported to guests running on
hosts that don't provide this interface?

[Severity: Low]
The commit message says:

  To avoid generating unnecessary VMBus transactions on every watchdog
  cycle, read the PCI config register on demand when ethtool or sysfs
  queries link speed, rather than polling it periodically.

Does this match the code? ixgbevf_watchdog_update_link() calls
check_link() on every service cycle. Whenever get_link_status is true,
this path does four pci_read_config_byte() calls per cycle. That covers
link down, after ixgbevf_up(), after the mailbox interrupt, after a
detected reset, and after a failed config read.

Only the steady link-up state avoids the periodic reads. Could the
commit message describe this more precisely?

[ ... ]

> @@ -956,6 +1005,9 @@ static s32 ixgbevf_hv_check_mac_link_vf(struct ixgbe_hw *hw,
>  	case IXGBE_LINKS_SPEED_100_82599:
>  		*speed = IXGBE_LINK_SPEED_100_FULL;
>  		break;

[Severity: High]
The commit message says offset 0x209 uses the VFLINKS register format.
If so, should this switch also check IXGBE_LINKS_SPEED_NON_STD for E610?
The PF driver decodes the same layout in ixgbe_check_mac_link_generic():

	case IXGBE_LINKS_SPEED_10G_82599:
		if ((hw->mac.type >= ixgbe_mac_X550) &&
		    (links_reg & IXGBE_LINKS_SPEED_NON_STD))
			*speed = IXGBE_LINK_SPEED_2_5GB_FULL;
		else
			*speed = IXGBE_LINK_SPEED_10GB_FULL;
		break;
	...
	case IXGBE_LINKS_SPEED_100_82599:
		if ((hw->mac.type >= ixgbe_mac_X550 ||
		     hw->mac.type == ixgbe_mac_e610) &&
		    (links_reg & IXGBE_LINKS_SPEED_NON_STD))
			*speed = IXGBE_LINK_SPEED_5GB_FULL;
		else
			*speed = IXGBE_LINK_SPEED_100_FULL;
		break;

The ixgbevf defines.h has no NON_STD mask and no 2.5G or 5G link speed
constants. ixgbevf_get_link_ksettings() only maps 10G, 1G and 100M.

E610 supports 2.5G and 5G. Would a Hyper-V E610 VF linked at 2.5G show
10000 Mb/s, and one linked at 5G show 100 Mb/s?

That looks like the same "stale or incorrect link speed" the commit
message says this patch fixes.

> +	default:
> +		*speed = IXGBE_LINK_SPEED_UNKNOWN;
> +		break;
>  	}

[Severity: Medium]
After this default case, the code below still sets
mac->get_link_status = false. The caller therefore sees link up with
*speed == IXGBE_LINK_SPEED_UNKNOWN.

ixgbevf_get_link_ksettings() has no case for that value:

	if (adapter->link_up) {
		__u32 speed = SPEED_10000;

		switch (adapter->link_speed) {
		...

Wouldn't ethtool and sysfs then report 10000 Mb/s full duplex?
ixgbevf_watchdog_link_is_up() prints "unknown speed" for the same value.

Speed bits 00 are the LINKS encoding for 10M on newer parts
(IXGBE_LINKS_SPEED_10_X550EM_A in the PF driver). E610 supports 10M, so
an E610 HV VF on a 10M link could hit this.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120220022.3133664-1-anthony.l.nguyen%40intel.com
