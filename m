Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515628;
	b=hkT6sRxrkepObpuwJXG2C1gnE4yGDQ7nmzOUoo5Zh4ND8dOEkhUPAB2RhtPPLuRrHEfi
	 iW9HRgeCHiTUTrGWLq07l3p7TCnEFcgmrrKMTp9YnUT9EoMGDQBSJIl9P+tOOE+is2Qlk
	 Kh1+OvL7HwqASOLcuAaOUNi4H9/i1uArLU1g/MoDtFaKXXApRV+U5fEviH9KWANQSMjMa
	 KG2OEc19M3DKIZAUtWQ2zztK80klkB95N9HSoybfYbSQbgrwSC44ww3I1Y2ErQ+YKtfp9
	 6hpdWKWju83wU1rzE/YCi98PX3GDnosjgn1Em3kJis9/NZXGICtMrvIFMhNRe1dHMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515628;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4jyQtNCbmkTDZ8Y8foQ9M/eg0Y/aa6/akLfzbBgWVdY=;
	b=b6MBXQXbwz+mqLRuTw0qkTaPRjvpV4JjBsdTqEWVihYv9eCY74zEmPQYdV+X4L/M5CdD
	 EGcStbXgXuVXiAX3xway2wOOp/RU7hhufoIjD++GfmQCG3vmEJL4VXGWoGMGB8/Lu8not
	 KwUMPfITfXj2MuXFops4uqOT3sCiVMbJ7pkH5Eya3fyKbqlG6HXKNEzXL/ZGXGIiX6oas
	 lIBDb0+Tv2DYSuU8vQeu6pfzdmBJF6gEE95/lRoEm5a/RWZe7asugfPlg5SJfdVFfDMCD
	 qwW47NUA4cafdJO7glmP1x8tXmYIaxYFuSKgvtnwcfSAbWxUyD+6csqf3PEe0Mpe/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTsHGOqp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A21B606A31E;
	Tue, 24 Nov 2026 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTsHGOqp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06581F000EC;
	Tue, 24 Nov 2026 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515627;
	bh=4jyQtNCbmkTDZ8Y8foQ9M/eg0Y/aa6/akLfzbBgWVdY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MTsHGOqpFkfHSH4Ru7G/IVBjWxW88eBWB1uoxx5BddE01Y8E+ySnHwpP1I1QmEgGd
	 iPGSLnhW68LZGkkyj1oL/KJyQoaDNQXxgNcexJ12U1bkOPdLWPMM9rs8Dk1mK1C6mD
	 OA624un/pzIV7F3NV1VTemohNuTt2xg1lRVnuhRPxubQTujE6HXqQZ3V8G0m7hL5df
	 tyhuQHyfYIX7Q8XitOVI/7z59+ksOuYUIVKxlgcfn11G6wWf5Tf5uyzBSd/zSD9qx6
	 xBz9ErKhgkOPIUGcXLpiFk+pHLYjbgh0WV/Wi3b8eXfdNx0N0HHKDFBam6neBNu05V
	 7VBfRdBE0WiVw==
Subject: Re: [PATCH net-next v9 02/10] bnge: add NTUPLE/ARFS VNIC
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:26 +0000
Message-ID: <179551562631.3135.282811496111712768@kernel.org>
In-Reply-To: <20261123100746.1975030-3-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-3-vikas.gupta@broadcom.com>
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

- [Medium] The patch makes two VNICs, each with a full set of RSS
  contexts, a hard requirement for probe.
- [Low] The commit message and the new comment in `bnge_reserve_rings()`
  overstate what a failed reservation preserves, and the message names a…

--

bnge: add NTUPLE/ARFS VNIC

This patch allocates a second VNIC for NTUPLE/aRFS. That brings the VNIC
count to BNGE_BASE_VNICS (2) and doubles the RSS context reservation. It
also moves the bnge_rings_ok() check in bnge_reserve_rings() ahead of the
driver ring count updates, and adds ndo_fix_features/ndo_set_features
handling for NETIF_F_NTUPLE.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> index 01205b161d822..1de7905dd9f13 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> @@ -206,12 +206,16 @@ int bnge_cal_nr_rss_ctxs(u16 rx_rings)
>  static u16 bnge_get_total_rss_ctxs(struct bnge_dev *bd,
>  				   struct bnge_hw_rings *hwr)
>  {
> -	return bnge_cal_nr_rss_ctxs(hwr->grp);
> +	u16 rss_ctx = bnge_cal_nr_rss_ctxs(hwr->grp);
> +
> +	rss_ctx *= hwr->vnic;
> +
> +	return rss_ctx;
>  }

[ ... ]

> @@ -237,8 +241,12 @@ static void bnge_copy_reserved_rings(struct bnge_dev *bd,
>  
>  static bool bnge_rings_ok(struct bnge_hw_rings *hwr)
>  {
> -	return hwr->tx && hwr->rx && hwr->nq && hwr->grp && hwr->vnic &&
> -	       hwr->stat && hwr->cmpl;
> +	/* The default and the NTUPLE VNICs each need a full set of RSS
> +	 * contexts for the final number of ring groups.
> +	 */
> +	return hwr->tx && hwr->rx && hwr->nq && hwr->grp &&
> +	       hwr->vnic >= BNGE_BASE_VNICS && hwr->stat && hwr->cmpl &&
> +	       hwr->rss_ctx >= bnge_cal_nr_rss_ctxs(hwr->grp) * BNGE_BASE_VNICS;
>  }

[Severity: Medium]
Can this make probe fail when the firmware's RSS context limit is below the
doubled demand, even though fewer rx rings would have fit?

bnge_cal_nr_rss_ctxs() grows with the rx ring count. It returns 1 context
for up to 64 rings, 2 for 65-128, and so on up to BNGE_RSS_TABLE_MAX_TBL.
bnge_get_total_rss_ctxs() now multiplies that by 2. Before this patch
bnge_rings_ok() did not check rss_ctx at all.

bnge_net_init_dflt_rings() picks the default rx ring count from
netif_get_num_default_rss_queues() and bnge_get_dflt_rings().
_bnge_get_max_rings() never reads hw_resc->max_rsscos_ctxs or
hw_resc->max_vnics, so the demand is never fitted to the context budget.

If the firmware grants fewer contexts, bnge_reserve_rings() returns -ENOMEM
without changing bd->rx_nr_rings. The retry then sends the same demand:

bnge_resc.c:bnge_net_init_dflt_rings() {
    ...
	/* Rings may have been reduced, re-reserve them again */
	if (bnge_need_reserve_rings(bd)) {
		rc = bnge_reserve_rings(bd);
		if (rc && rc != -ENODEV)
			dev_warn(bd->dev, "Fewer rings reservation failed\n");
		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
	}
	if (rc) {
		bd->tx_nr_rings = 0;
		bd->rx_nr_rings = 0;
	}
    ...
}

bnge_probe_one() then fails. The most likely trigger is a high-core-count
host where the default rx count is above 64.

The commit message says firmware grants these to every supported function,
but the driver never checks that. bnxt handles a shortage of VNICs or RSS
contexts by clearing RFS in bnxt_rfs_capable().

Would it make sense to cut the rx ring count to fit max_rsscos_ctxs, or to
fall back to a single VNIC, rather than failing probe? Later patches in the
series don't add such a fallback either. They only read max_rsscos_ctxs in
bnge_rss_ctx_capable() for additional contexts.

[ ... ]

> @@ -347,6 +358,15 @@ int bnge_reserve_rings(struct bnge_dev *bd)
>  		hwr.rx = rx_rings << 1;
>  	tx_cp = hwr.tx;
>  	hwr.nq = sh ? max_t(u16, tx_cp, rx_rings) : tx_cp + rx_rings;
> +
> +	/* One ring group per rx ring, so rss_ctx is checked against the final
> +	 * rx ring count. Fail before any driver state is changed, so that a
> +	 * retry reserves again instead of finding the failed values in place.
> +	 */
> +	hwr.grp = rx_rings;
> +	if (!bnge_rings_ok(&hwr))
> +		return -ENOMEM;
> +

[Severity: Low]
Is "Fail before any driver state is changed" accurate here? By the time
bnge_rings_ok() runs, this call chain has already completed:

bnge_hwrm_reserve_rings()
  bnge_hwrm_reserve_pf_rings()
    bnge_hwrm_get_rings()

It overwrites bd->hw_resc.resv_* (rx/tx rings, vnics, rsscos_ctxs, cp
rings, stat ctxs, irqs). bnge_aux_set_stat_ctxs(bd, 0) may also have run
earlier in bnge_reserve_rings(). Only bd->tx_nr_rings, bd->rx_nr_rings and
bd->nq_nr_rings are preserved.

The commit message says something similar:

  bnge_reserve_rings() checks bnge_rings_ok() before it changes any
  driver ring count, so a failed reservation leaves the driver state as
  it was. bnge_set_dflt_rings() calls it a second time at probe, the
  retry then reserves again and resets the default indirection table,

There is no bnge_set_dflt_rings() in the bnge driver. That is the bnxt name
(bnxt_set_dflt_rings()). The second call is in bnge_net_init_dflt_rings().

The retry only reserves again because hw_resc changed, so
bnge_need_reserve_rings() sees a mismatch. On an RSS context shortage the
retry sends the same demand, so it just makes a second firmware round trip
before failing the same way.

Could the comment and the commit message be reworded to match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
