Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054895;
	b=R5czX8IydVlkWB6PajcAyJyylpfOhtlv5LzdgQmBhS1kmkF3h/M+mK+7QAsY4gC1v0bl
	 P6s9L2CvH24rP9WKSs0SInaBt9eywSLmX5tVx5irO6oZgHjboHy1V7mHy3fYAxJHG2pFO
	 RZA1rCy9+zTfJCJKEiOXReoygc/yvdP9Jm+uF+aA8Jqm1sJc2tNd8NTT+AsP1yPanBmIH
	 jJoLxnPoAPJ+6R9TqSW3aqvGS67dXjmXOM32xa9vw7mcK6FQd0DCAaAS57MmIA9VLPNUL
	 wSgJyiNv+e+L6nVC2f9idXj78zA/tZUj7/1AsFXI7KVmhKGEPvo0JqS9zG328/01D/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054895;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1BRZ0HVPBbm4ibil0v+OUd8DRjui30whJpDZ3BuRtgI=;
	b=0Wa2APf23onYQCm3yILCwjcZUW2jtMglpX70Br+4rSP91Wm9/PTXwhIgfFMFtc1OwIF/
	 SxGxRo3zLn7eteqXdDAxHUGfwDMMKDqJEoxS3vWz0FFE/xUteNnjfPEI3lPUhxt+9z1NJ
	 oUM4XucHT+ftHwhfdtfPXtHiFpLJfiyIqyIjS0DgLguePWLudzePSdtRg+9ty4owyS+Zy
	 op1GCFbMxXJ/JrFcPmHfYvbMH6wvbURgZxPmKnDo0D3b+Sdver7ld0/riGPGVQJVszrFt
	 Yftc+zcaXK4JBUj8ZqyEg20//rqwFq8eWrn4kj0NZ3BON/PMPQ4PvsTj2B8n55RS6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHa+KHtT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943A8606A32A;
	Thu, 19 Nov 2026 02:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHa+KHtT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2C91F000C4;
	Thu, 19 Nov 2026 02:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795054895;
	bh=1BRZ0HVPBbm4ibil0v+OUd8DRjui30whJpDZ3BuRtgI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OHa+KHtTlT5WedTvvnWAo8npoE7/tzCxJVVACQO4D2+Q84NcplvqL42h4Wr6MFFNb
	 plbAgE9Gq+wJLzwT7YK+8Jz9JgMA+XHyVnleOPu0dT0DfoRqgYiJBLHLUveVxtSVhh
	 Q3OnKLeynJevOMJfTxgFljRV4Rq0lop85lqWUhpbVmiD+DVTW7vr4FQ37k5QvzdIj2
	 GhDj4mXXnfMkosnvJ7ZcQXA3roloF8cpcCy19S1JVAvU+WAYVSuqxcluR3FAwSCKah
	 aVfjQTEyBGUswBvREamE54OTkWPxnD8Nyzry3QIuRysZPCyEFyCqvvU9Ts10Bt/zrC
	 A2GBIYJhQT9OQ==
Subject: Re: [PATCH net] net: hinic: Don't fail probe when firmware lacks
 rx-vlan-filter
From: netdev-bot+sashiko@kernel.org
To: ruanjinjie@huawei.com
Cc: cai.huoqing@linux.dev, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 02:21:34 +0000
Message-ID: <179505489450.3136.816467311238981764@kernel.org>
In-Reply-To: <20261116021858.273519-1-ruanjinjie@huawei.com>
References: <20261116021858.273519-1-ruanjinjie@huawei.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] set_features() in drivers/net/ethernet/huawei/hinic/hinic_main.c
  turns a HINIC_MGMT_CMD_UNSUPPORTED reply to…
- [Medium] The patch now treats a HINIC_MGMT_CMD_UNSUPPORTED (0xFF)
  return from hinic_set_vlan_fliter() as reliable proof that the…
- [Low] The comment the patch adds in set_features() says a firmware-
  rejected feature 'is dropped from the advertised set, whether it was…

--

net: hinic: Don't fail probe when firmware lacks rx-vlan-filter

With this patch, set_features() in the hinic driver no longer fails probe
when HINIC_PORT_CMD_SET_VLAN_FILTER gets a HINIC_MGMT_CMD_UNSUPPORTED
reply. NETIF_F_HW_VLAN_CTAG_FILTER goes into failed_features instead, and
netdev->features is now written back whenever failed_features is non-empty,
not only on the fatal path.

> diff --git a/drivers/net/ethernet/huawei/hinic/hinic_main.c b/drivers/net/ethernet/huawei/hinic/hinic_main.c
> index 34ed5ea9e46ef..e837140f7c178 100644
> --- a/drivers/net/ethernet/huawei/hinic/hinic_main.c
> +++ b/drivers/net/ethernet/huawei/hinic/hinic_main.c
> @@ -1098,16 +1098,26 @@ static int set_features(struct hinic_dev *nic_dev,
>  		ret = hinic_set_vlan_fliter(nic_dev,
>  					    !!(features &
>  					       NETIF_F_HW_VLAN_CTAG_FILTER));
> -		if (ret) {
> +		if (ret == HINIC_MGMT_CMD_UNSUPPORTED) {

[Severity: Medium]

Can a management channel failure end up on this non-fatal path?

In hinic_set_vlan_fliter(), vlan_filter is an uninitialized stack
variable. Only func_idx and enable are set, and status is checked before
err and out_size:

drivers/net/ethernet/huawei/hinic/hinic_port.c:hinic_set_vlan_fliter() {
	struct hinic_vlan_filter vlan_filter;
    ...
	err = hinic_port_msg_cmd(hwdev, HINIC_PORT_CMD_SET_VLAN_FILTER,
				 &vlan_filter, sizeof(vlan_filter),
				 &vlan_filter, &out_size);
	if (vlan_filter.status == HINIC_MGMT_CMD_UNSUPPORTED) {
		err = HINIC_MGMT_CMD_UNSUPPORTED;
    ...
}

On a send failure, a -ETIMEDOUT or a msg_id mismatch, msg_to_mgmt_sync()
returns without copying anything into buf_out. hinic_mbox_to_func() does
the same on its send error and timeout paths on the VF side. In those
cases status still holds whatever was left on the stack.

Before this patch any non-zero return failed probe, so it didn't matter if
the status was misread. Now, if the leftover byte happens to be 0xff, a
failed or timed-out command only logs "Firmware does not support
rx-vlan-filter". CTAG_FILTER is then dropped for good, and nic_dev_init()
goes on to register_netdev().

Other users of the same status convention, such as
hinic_set_link_settings(), check err and out_size before trusting an
unsupported status:

drivers/net/ethernet/huawei/hinic/hinic_port.c:hinic_set_link_settings() {
    ...
	if ((info->status != HINIC_MGMT_CMD_UNSUPPORTED &&
	     info->status) || err || !out_size) {
    ...
}

Should vlan_filter be zero-initialized? And should hinic_set_vlan_fliter()
require !err && out_size before it honours the status? The uninitialized
status, version and reserved bytes are also sent to the device as buf_in.

> +			dev_info(&nic_dev->hwdev->hwif->pdev->dev,
> +				 "Firmware does not support rx-vlan-filter, feature disabled\n");
> +			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> +		} else if (ret) {
>  			err = ret;
>  			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>  		}
>  	}
>  
> -	if (err) {
> +	/*
> +	 * A feature the firmware rejects is dropped from the advertised set,
> +	 * whether it was rejected fatally or not (e.g. rx-vlan-filter on
> +	 * firmware that predates it).
> +	 */
> +	if (failed_features)
>  		nic_dev->netdev->features = features ^ failed_features;

[Severity: High]

On firmware that answers SET_VLAN_FILTER with HINIC_MGMT_CMD_UNSUPPORTED,
this write-back clears NETIF_F_HW_VLAN_CTAG_FILTER from netdev->features
during probe, via nic_dev_init()->set_features() with force_change set.
Does that break VLAN receive on exactly the firmware this patch targets?

The 8021q core only calls ndo_vlan_rx_add_vid while that bit is set:

net/8021q/vlan_core.c:vlan_add_rx_filter_info() {
    ...
	if (!vlan_hw_filter_capable(dev, proto))
		return 0;
    ...
}

hinic_vlan_rx_add_vid() is the only code that programs the hardware VLAN
table and the per-VID MAC entry, and the only code that fills vlan_bitmap:

hinic_vlan_rx_add_vid() {
    ...
	err = hinic_port_add_vlan(nic_dev, vid);
    ...
	err = hinic_port_add_mac(nic_dev, netdev->dev_addr, vid);
    ...
	bitmap_set(nic_dev->vlan_bitmap, vid, 1);
    ...
}

add_mac_addr() also walks vlan_bitmap to install secondary unicast and
multicast addresses for each VID. change_mac() sends port_mac_cmd.vlan_id,
so the hardware MAC filter appears to be keyed by (MAC, VID).

Before 2acf960e3be6 the driver never sent SET_VLAN_FILTER. CTAG_FILTER has
also been a fixed feature since 2017:

netdev_features_init() {
    ...
	netdev->features = netdev->hw_features | NETIF_F_HW_VLAN_CTAG_FILTER;
    ...
}

So older firmware has always run with the driver programming VLAN
membership.

After this patch, "ip link add link ethX name ethX.N type vlan id N" never
reaches hinic_vlan_rx_add_vid(). Frames tagged with VID N and sent to the
port MAC would then seem to miss the (MAC, N) entry and be dropped, unless
the port is promiscuous. CTAG_FILTER is not in hw_features, so ethtool
can't turn it back on.

VFs hit the same path, because hinic_set_vlan_fliter() also maps
HINIC_MBOX_VF_CMD_ERROR to HINIC_MGMT_CMD_UNSUPPORTED.

Given that, is this part of the commit message accurate?

    and the device stays unusable although nothing is actually broken.

Would it be better to treat HINIC_MGMT_CMD_UNSUPPORTED as non-fatal and
keep NETIF_F_HW_VLAN_CTAG_FILTER set? That would match the behaviour before
2acf960e3be6, without dropping the feature or adding the new write-back.

[Severity: Low]

This isn't a bug, but the new comment says a rejected feature "is dropped
from the advertised set, whether it was rejected fatally or not". The XOR
below it flips the requested state rather than clearing the bit.

For example, if "ethtool -K ethX tso off" fails in hinic_port_set_tso(),
features has NETIF_F_TSO clear and failed_features has it set. So
features ^ failed_features sets TSO again. That restores the previous
state rather than dropping the feature, and hw_features is never changed.

Could the comment say that the previous state is restored instead?

> +
> +	if (err)
>  		return -EIO;
> -	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116021858.273519-1-ruanjinjie%40huawei.com
