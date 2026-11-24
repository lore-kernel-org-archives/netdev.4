Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515636;
	b=ylQNkMkzeh0yTlhvI1zPy48Si28ggZrZsj6d4YtfWeUKii8mhVDFhtkpq0asQYzofHPS
	 dQiugjFTyP3MK/A8uHOCUD1CmEfcOH3mT8zLUT/azsNd1itKtERfFgK6fIBg8IiIH8POI
	 qAEJOxGyhGUUuxpX8WOMYI8Fpm73+jOY77hxYPPje8moLLSX29XFEBZbyoCSIyEwCr34w
	 9YBYURA8NNd1Ge5yDmDfaSTb5s3k+7TnIgUutlBApH0goaTBhJvns7UCkTfbBaK7e/wDJ
	 BjsMYROzEMAvtHzaakJVSutLbmK5A9MtJRCm1peK+z7AXtRK81BkIJDQ7nWBO3Cd4bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515636;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ezwj1PmRYTif22M9HdFfo8GLeV0gGpBM+EfbcndNxVQ=;
	b=3usx3Ipayz6FI3GvOgG1eionPDBw8nXBTrT0/sq2qd7DND9WjhhrskmVl9pi4pHCSnAo
	 utfrvzBiyvBL5nQg+YbV5s/O/eF9lUVkwRyQYuPOchX3KZ6N67PQiW7Qk16UZSmuU+3Ir
	 LgIqiQyX4ZVbZV03D+aSnbk2PrHlvztv8SbFw5MZOVgPbCSJQT2Avu0AWlUvcBTeHBumW
	 IHfx5c2T+zP7fu3y9+ufLcolgcRvJ0KNxkKgiNl+T39zM9bHdWsJ5zJmXW1T7GGE1k57W
	 7K9g59+SXZKGgScPnbZlx9gCknaNchXKhWHLRXC1LKr1vgXnY6RpDnjYnMMzSYP/whQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLQ2iJj3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73D7606A31E;
	Tue, 24 Nov 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLQ2iJj3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D128A1F00A3C;
	Tue, 24 Nov 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515636;
	bh=ezwj1PmRYTif22M9HdFfo8GLeV0gGpBM+EfbcndNxVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jLQ2iJj3OsuPL0YQ2O5F6BzFhCiZsfJNS22dnzAA6MY2752TwJQ/TT7nKtKtTRfss
	 rqeTvPe34QaGQOMilS3v1ywy/s+lvZCFQ0UE9vusPUn/ZXyUIJcrlcSrzKzXRm81NP
	 Jc25v7ejcIpoorv/Lbdo5q0wDrtZWgduazqWbUyiWO7kI18OREmWC2AqV0Bl3NT0oZ
	 MvgPORoIOx98rHJJPkmod4iTtkURfTa3HvXIAIH6cLHvTcQ6NiQ8OBsU3aPsacU1tI
	 TitMjPXlfzV1qGl/t48Dme3s2jJEFWRWoOpJh8yOJCioZ8Q58d7VlhjpLXCVUFFMkQ
	 0ds68MR15WxFg==
Subject:
 Re: [PATCH net-next v9 08/10] bnge: add NTUPLE filter support in ethtool
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:35 +0000
Message-ID: <179551563543.3135.8782865682278121894@kernel.org>
In-Reply-To: <20261123100746.1975030-9-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-9-vikas.gupta@broadcom.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] bnge_cfg_rx_mode()
  (drivers/net/ethernet/broadcom/bnge/bnge_netdev.c) raises the number…
- [Low] The commit message promises a two-case outcome when a user
  ETHER_FLOW rule and a unicast address share a MAC: "If the unicast…

--

bnge: add NTUPLE filter support in ethtool

This adds ethtool rxnfc get/set operations to bnge for ntuple and
ETHER_FLOW rules. User filters are kept in software across down/up and
programmed again on open. It also replaces the BNGE_MAX_UC_ADDRS limit with
BNGE_MAX_L2_FLTRS, so up to 127 unicast addresses are programmed before the
driver falls back to promiscuous mode, and it enables NETIF_F_NTUPLE by
default.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index 58039e6d610ed..44637152b075c 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -2126,14 +2129,24 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,

[ ... ]

>  	netdev_hw_addr_list_for_each(ha, uc)
>  		if (!ether_addr_equal(ha->addr, dev->dev_addr))
>  			uc_count++;
> -	if (uc_count > BNGE_MAX_UC_ADDRS - 1) {
> +	/* The unicast addresses and the user ETHER_FLOW rules share the L2
> +	 * filters. Receive the addresses that do not fit in promiscuous mode.
> +	 * The firmware supports many more L2 filters than BNGE_MAX_L2_FLTRS,
> +	 * so it is not expected to refuse a filter in the loop below.
> +	 */
> +	l2_free = BNGE_MAX_L2_FLTRS -
> +		  bitmap_weight(bn->l2_fltr_bmap, BNGE_MAX_L2_FLTRS);
> +	if (uc_count > BNGE_MAX_L2_FLTRS - 1 || uc_count > l2_free) {
>  		vnic->rx_mask |= CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
>  	} else {

[Severity: Medium]

The threshold goes from 3 addresses to 127 here. Is l2_free the only limit
on how many unicast filters get programmed?

l2_free is computed from the driver's own bn->l2_fltr_bmap. The firmware
reports a per-function limit, which bnge_hwrm_func_qcaps() stores:

    hw_resc->min_l2_ctxs = le16_to_cpu(resp->min_l2_ctxs);
    hw_resc->max_l2_ctxs = le16_to_cpu(resp->max_l2_ctxs);

Nothing in the driver reads max_l2_ctxs, though. So no check in the code
backs the commit message's "the firmware supports many more L2 filters, so
a refusal in this path is not expected".

Suppose firmware refuses bnge_hwrm_l2_filter_alloc() in the fill loop below
with an error other than -EEXIST. The function then does this before
bnge_hwrm_cfa_l2_set_rx_mask() runs:

    vnic->uc_filter_count = i;
    return rc;

Would the remaining addresses then get neither an L2 filter nor promiscuous
mode?

On the open path, bnge_init_vnic() treats this as fatal:

    rc = bnge_cfg_rx_mode(bn, &bn->netdev->uc, true, false);
    if (rc == -EAGAIN) {
        netif_rx_mode_schedule_retry(bn->netdev);
        rc = 0;
    } else if (rc) {
        goto err_out;
    }

Could a refusal there make the interface fail to open? With the old
3-address limit, the driver would have gone promiscuous well before this
point. Whether it can happen depends on what max_l2_ctxs the firmware
reports for a bnge PF.

Would it make sense to limit uc_count by min(BNGE_MAX_L2_FLTRS, max_l2_ctxs)
minus the filters already in use? Another option is to fall back to
promiscuous mode when the firmware refuses a filter.

[ ... ]

> @@ -2149,6 +2162,11 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
>  
>  	for (i = 1, off = 0; i < vnic->uc_filter_count; i++, off += ETH_ALEN) {
>  		rc = bnge_hwrm_set_vnic_filter(bn, 0, i, vnic->uc_list + off);
> +		if (rc == -EEXIST) {
> +			/* Already delivered by a user L2 rule */
> +			vnic->l2_filters[i] = NULL;
> +			continue;
> +		}

[Severity: Low]

The commit message says:

    If the unicast address is added first, adding a rule for the same MAC
    fails with -EEXIST.

Is that always true? By the time bnge_cfg_rx_mode() takes the promiscuous
branch above, the filters in l2_filters[1..] have already been freed, and
the branch creates no new ones. So the software L2 hash table has no entry
for those addresses.

A later ETHER_FLOW rule for one of those MACs then goes through:

bnge_srxclsrlins()
  bnge_add_l2_cls_rule()
    bnge_alloc_user_l2_filter()
      bnge_lookup_l2_filter()   <- finds nothing

The rule is accepted and programmed in firmware instead of failing with
-EEXIST.

On the next rx_mode update where the addresses fit,
bnge_hwrm_set_vnic_filter() returns -EEXIST here. The address (a macvlan,
for example) is then delivered only to the rule's ring. That is the "rule
added first" outcome, even though the address was added first.

The same seems to happen when the fill loop stopped early on a firmware
error and left later addresses without a filter.

Could the commit message cover these cases?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
