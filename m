Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795322444;
	b=CWKUXlRBgIch91+4S6/u2MLCs6tBKmjUIypOo/0/ubTl8eVcQCMF5kYo76SvAp+pcnC5
	 S0wpHjy3SUmhQl6/Tm08C3H+VcnouJ6kRFrY7bo939OLIj1CqK8z+ijtGZ5qXaA0B9kSf
	 gb4CMv8uQSt+2Tk9iLQxbCyHS0Kdo6hFS3U92v+IW7/dAWdY5H87eJOJFL0uQS3uEEfXW
	 9h24WMNqLUW7aeMEKLyE/F076zs/liPV5FztyzpugKx31rnwH8wknYhe6Ax/kzYSc6A9X
	 cW/38jIMAZxsQKKMPAHfvawJqZd7LyTEKxdbR9N+8P0vehpr2YPu3ramOPVoNLPurXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322444;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KrAhZ9E8WnWK+p3yZgfI3yb6F7sSSKosgOZao00gLAY=;
	b=F2uQ7YyRqnzJS5QOEzWg9q2j5U26BBtfn0yD3aPOLQad5uBeAfu2ktaXFtKPqUvIh1zu
	 UpVCW+3CiX9i3xrv6qigfadfI90/eD+wUoDranR7ajixi95fggWVyOqQZA1f4aT/YrDtb
	 hkMPzNaLSlaU1HNN0pffqz+HGhYhVei/hLMPdEB+LC+LfgplPNwuTj8b0apotnwLS5ESX
	 as9o4MHR9XSUKpak3juC33MvCdWlFg4pkE/UMLW5d8Pj4KhSJV1HAM57tXYuxCPD4DswA
	 POG5YY9Lwz0MknW6+rHQft4sN642rSS4+ZphcBG8GYK+zmNaXeA+pPpz7apc1QDe71g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5jaNfyP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1D606A320;
	Sun, 22 Nov 2026 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5jaNfyP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750EB1F000C4;
	Sun, 22 Nov 2026 04:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795322444;
	bh=KrAhZ9E8WnWK+p3yZgfI3yb6F7sSSKosgOZao00gLAY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J5jaNfyP1cBFpKL1waHOYWo19pKbvibqIor7XBOU6oOJkia/IQ2vjZj6oSTK+9rjs
	 Ol7Z+ofiGgYTdDird8e0LH9Wy4Ihe67GY0E1jVQ0awJUsOKdVT9drkS67tCMG4CTX7
	 UJ97PlXQVbKaKnmmPuNtFFeTVPrx4AuZ7oxC/QbWhMi5ZTV0Lsb4/L3r8nb3koRd7p
	 U42aXjG7bfjxpPqbcdZBV04bCpCf7ZRPM0cQ6RGtDLC7mFo7XPCmozRHg2bqTbxEJe
	 uO6OAIuguAq+kfo4Yxq/2QIIip0CEUHhGASM7xPQkT8cwU5kILh7L5FxF2EIRTdJXr
	 VJC6bF2JCHjwA==
Subject:
 Re: [PATCH net v2] octeontx2-af: widen TX scheduler queue index to 11 bits
From: netdev-bot+sashiko@kernel.org
To: vmukunda@marvell.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, sgoutham@marvell.com,
 rkannoth@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, skoteshwar@marvell.com
Date: Sun, 22 Nov 2026 04:40:43 +0000
Message-ID: <179532244301.3135.14806986987888080886@kernel.org>
In-Reply-To: <20261118042614.878448-1-vmukunda@marvell.com>
References: <20261118042614.878448-1-vmukunda@marvell.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch fixes 11-bit SMQ indices only on the NIX_TXSCHQ_CFG
  register path, by widening TXSCHQ_IDX_MASK and NIX_TX_SCHQ_MASK.

--

octeontx2-af: widen TX scheduler queue index to 11 bits

This commit widens TXSCHQ_IDX_MASK from 10 to 11 bits and extends
NIX_TX_SCHQ_MASK through bit 26. With that, scheduler queue indices of
1024 and above are no longer truncated on the NIX_TXSCHQ_CFG register
path. The target is CN20K, where the SMQ field of the SQ context is 11
bits wide.

> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mbox.h b/drivers/net/ethernet/marvell/octeontx2/af/mbox.h
> index cece197d1074b..1b62f9d7f00a0 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/mbox.h
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/mbox.h
> @@ -1164,7 +1164,7 @@ struct nix_txschq_config {
>  	u8 lvl;	/* SMQ/MDQ/TL4/TL3/TL2/TL1 */
>  	u8 read;
>  #define TXSCHQ_IDX_SHIFT	16
> -#define TXSCHQ_IDX_MASK		(BIT_ULL(10) - 1)
> +#define TXSCHQ_IDX_MASK		(BIT_ULL(11) - 1)

[Severity: High]
This fixes the txschq register path. Is there still another place on
CN20K where an SMQ index of 1024 or above is cut down to 10 bits?

otx2_setup_dev_hw_settings() sets CN10K_LMTST on every !is_dev_otx2()
device, and that includes CN20K. As a result,
otx2_pfc_update_sq_smq_mapping() in nic/otx2_dcbnl.c takes the cn10k
request branch:

drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c:otx2_pfc_update_sq_smq_mapping() {
    ...
	if (test_bit(CN10K_LMTST, &pfvf->hw.cap_flag)) {
		cn10k_sq_aq = otx2_mbox_alloc_msg_nix_cn10k_aq_enq(&pfvf->mbox);
    ...
		cn10k_sq_aq->sq_mask.smq = GENMASK(9, 0);
		cn10k_sq_aq->sq.smq = otx2_get_smq_idx(pfvf, prio);
    ...
}

nix_cn10k_sq_ctx_s.smq is a 10-bit field, so bit 10 of the SMQ index is
dropped. The mask also covers only bits 9:0.

On the AF side, when is_cn20k() is true, nix_get_aq_req_smq() reads
every request with the 11-bit cn20k layout:

drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:nix_get_aq_req_smq() {
	if (is_cn20k(rvu->pdev)) {
		*smq = ((struct nix_cn20k_aq_enq_req *)req)->sq.smq;
		*smq_mask = ((struct nix_cn20k_aq_enq_req *)req)->sq_mask.smq;
		return;
	}
    ...
}

In the cn20k layout, bit 10 sits where the cn10k layout has cq_ena, and
that bit is 0 in both the value and the mask. So
rvu_nix_blk_aq_enq_inst() calls is_valid_txschq() with (smq & 0x3ff).
The masked AQ write then leaves bit 10 of the existing hardware SQ
context unchanged.

Depending on the old and new SMQ, would this give the following?

  old < 1024, new >= 1024: the SQ is programmed to new & 0x3ff, which is
  the wrong SMQ, or the ownership check rejects the request.

  old >= 1024, new >= 1024: the ownership check runs on an SMQ the
  function probably doesn't own, so PFC configuration fails.

  old >= 1024, new < 1024: the AF approves SMQ X, but the hardware is
  set to X | 0x400, which may belong to another PF or VF.

The CN20K SQ init path in cn20k.c uses nix_cn20k_aq_enq_req and
programs all 11 bits. The PFC path does not, and it is reachable through
dcbnl ieee_setpfc -> otx2_pfc_txschq_update() ->
otx2_pfc_update_sq_smq_mapping().

The Fixes: tag points at b5dcdde074d5, which also added the cn20k
decoding in nix_get_aq_req_smq(). Should the PFC remap be updated as
part of this fix too?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118042614.878448-1-vmukunda%40marvell.com
