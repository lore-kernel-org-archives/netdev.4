Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588566;
	b=ZElTV349hKy2RXGYap/9epjil5UyEyjx3kk0vjwz6j1CuNcXjKRPIthW+FIgJS+9s0aY
	 jc3AyHoT9cxhAfQUy9aG0LWOLZG5ktAYA7y9LiUgTsAcVGUrw7uz+rfK6Se+hxlAMaN7N
	 gY3/gVSbAnPF/STiSQm3Nzhl6/by56qaI8dvWTSCRQlHifJOPORBf+9vggGRiNkdhurJ9
	 AJZqedYCZssbC4lwtwYb3rYhzRhrSSc22EO4accYJFDrHDo/R/nDn1vtDIptzqzP1bNQB
	 iTthZaUU/DwBAoi354Lgl+uNEKB0llB4vmpP1dXkzKeQUmPG/UQa7kzOWRgPXgNW4CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588566;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WmUfzwma93rg6Bml2GYK77+Ze3Dw48MIC5lQRVm2SRU=;
	b=ehKPY0uJM8gq9dtLwB2W1W3vcHSPQDbl1gGEgCrMaxKzrGF8iGmgF3Y1sZPSZnVW1gxr
	 KEjQquhJ5XsQ8ngE8b5xj4Fc+TsuZKWX2JjtakKyGz8XxyjLrfUCvWVBTpDp2ZKNVManO
	 vXe0PYuLAwMMqi1udbdgZED36hpx3OXcwPHpq2iYBMGj2IcBeHLjq7yG2t8yE+RhX5BZm
	 5lclEmzS/dUY2rnZLCAI2eKK0wzBEOQ6b3UudwPkKyGHeQM4w3+iFumKfzVfLU8cqGhNI
	 Bu4JalHMlvBMgw32HwIG2I5iHdCs2o8Tj3POJQXtMhdU85bH8vx6wF5XWDW9zexmk5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvvIjNiD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CCE606A691;
	Wed, 25 Nov 2026 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvvIjNiD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64211F000D2;
	Wed, 25 Nov 2026 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588565;
	bh=WmUfzwma93rg6Bml2GYK77+Ze3Dw48MIC5lQRVm2SRU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XvvIjNiDHjnApn8vI9+HyWi5LD2leABp21biRKbhjWlHRQxGRDt+lVdJ0FdP4lOCH
	 z9+cql85tVualjEmGfuqh0QnBnm0SCoN8u6rvhxAMuxiGK5rAgGjob1oKOu31TYsmK
	 DydGTAs6eRA6HKDTCztBFFvEyCHik0+MsTJdnWqYHn15ZMypscn4z/gMPdsu3e8OKM
	 wM2AawW8xC0xef1ODo6Fvor1Yn66OK+pdtL2IhLMWiymoQG2iSmBN5U79hjIRoizxP
	 ZBBHwxR36hVFNFSidFc/eXHIrXyZ9SrrWyOE18Q1P0k/4AxxFwQOSJgM9zxc8ZMJ/r
	 mOaDe0Rggs3Ig==
Subject: Re: [PATCH net-next v3 4/5] net: rnpgbe: Allow changing the primary
 MAC address
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Wed, 25 Nov 2026 06:36:04 +0000
Message-ID: <179558856439.3135.10366216867025200313@kernel.org>
In-Reply-To: <4EBB27E12BC81D8D+20261124060613.411393-1-dong100@mucse.com>
References: <4EBB27E12BC81D8D+20261124060613.411393-1-dong100@mucse.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] rnpgbe_set_mac_address() in
  drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c checks the new address…

--

net: rnpgbe: Allow changing the primary MAC address

This adds ndo_set_mac_address support to rnpgbe so the primary MAC address
can be changed while the interface is up or down. The new address is
validated, written to the primary receive address filter (RAR0), and then
committed to the netdev. It also wires up eth_validate_addr as
ndo_validate_addr.

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> index 3a2f62f0630da..f25cca98878ef 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c

[ ... ]

> +int rnpgbe_set_mac_address(struct net_device *netdev, void *addr)
> +{
> +	struct mucse *mucse = netdev_priv(netdev);
> +	struct sockaddr *sa = addr;
> +	int err;
> +
> +	err = eth_prepare_mac_addr_change(netdev, addr);
> +	if (err)
> +		return err;
> +
> +	rnpgbe_set_rar(&mucse->hw, 0, sa->sa_data);
> +	eth_commit_mac_addr_change(netdev, addr);

[Severity: Low]
Is updating only the ETH-block RAR0 entry enough here? Would the GMAC
station address and the firmware still hold the old MAC after this runs?

As far as I can tell, rnpgbe_hw.h defines no GMAC station address
register, and the driver never writes one. The GMAC would then keep
whatever address firmware programmed at reset.

The GMAC block looks like the Synopsys DWC GMAC layout:

#define MUCSE_GMAC_OFF(_n)             (0x20000 + (_n))
#define GMAC_CONTROL_RE                0x00000004
#define GMAC_CONTROL                   MUCSE_GMAC_OFF(0)
#define GMAC_RX_ALL                    (BIT(31) | BIT(0))
#define GMAC_FRAME_FILTER              MUCSE_GMAC_OFF(0x4)

On that IP, MAC Address0 High/Low is the source address of the PAUSE
frames the MAC generates. RNPGBE_LINK_ST reports pause state in bits
25:24. If TX pause is active after "ip link set dev X address ...",
could those PAUSE frames carry an address the host no longer uses?

The mailbox command set in rnpgbe_mbx_fw.h also has only
GET_MAC_ADDRESS and no set command. So any firmware-side copy of the
MAC, for example for NCSI (which owns RAR entries 30-31), would also be
stale.

Receive is not affected. rnpgbe_set_link() puts the GMAC in receive-all
mode, and filtering is done by the ETH-block RAR/MTA tables. The concern
only covers frames the hardware generates and firmware state.

This is inferred from the IP family and would need to be checked against
the Mucse datasheet or vendor driver. Later patches in the series don't
seem to add a GMAC address register write or a firmware set-MAC command
either.

Does the GMAC station address need to be programmed here, or the
firmware notified, when the address changes?

> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
