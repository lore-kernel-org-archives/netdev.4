Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515631;
	b=LtEuMb8cdBmTci0mANdHvcMZ3Earrag7dpoe5uMz24tbNfhBEt+Uli+XQEm9dT2FfAfH
	 p9wxJ6AsVVrT2Iqo/fAetV2TJ4zny1GHM/C5aU1oIZWn2xESmo7cafuKPFsZtUWv5F+ox
	 rB8Q7MsIjZ33V2esW/ulOPNJwqaizNlAih351mtpWxUMpTnbNe4xqHonUvWlBqE8f46C7
	 vd81U/A1UPe83CaFxZ51tcNJF6U9V9dPrzZSQmLOcjPglz8X8X//+L2dWMr9qVT+tNTtG
	 RWlvwrNh29iyDofpKJRKnZ+X7H6pk03F4dl/8wHDVQirEUoWtoVlUDkkRlg14G6cs9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515631;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=M7YhSHwWC1fFDL0yi76EwqREUB4dPhV1Ja70oSPiJCc=;
	b=ZqeQcaVUSHf1U4lT/HjXJXnP1D3WVAF5eTrb0EJK+bi0lFt0kOzNsUka4p6t0EvG/Q7J
	 C3oNaWCD/MaRJE7e+QbZOfOlqRIQNDGj6aqTZHjJ7Xg86K/jv4eQsvHnt5hWHCAKdqDm3
	 ptLAOjuEPkoVN0aK5a6fFaJ7iZ24tf8AknaH6GIedwGQP10NPkEaMzTp/XAwtgbMk2fSK
	 FsvA0nTmBrb3RXRKVKG4z0jL+bSJelRk/HqiImsQHIPpDlSsqmuRjOr+otmHyrHDBgI6P
	 qGOcEByaeLIhwO30Rqhg5uKh6++3Bx8Dam5Y5t9w+nz4BhsZEnKiCiFkyPVduWp88FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9N7bbM+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530C606A684;
	Tue, 24 Nov 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9N7bbM+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F871F000C6;
	Tue, 24 Nov 2026 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515631;
	bh=M7YhSHwWC1fFDL0yi76EwqREUB4dPhV1Ja70oSPiJCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j9N7bbM+IFFNO55nSjJWfqrSsrZ5dLPDhIIdR1xN5n3ZVUCBAEVz6MQfGjbm2vp0w
	 wEFC3vTYnV3Ej55eFzi+054qV/H3qCwOQPqsY04IJ2oMmWzz7/R2roX3QhBrQdWV0o
	 rXyGr4WBRxvjbInChQW9Lo2DreLVBKQYV0nsaBqRW6s86/hqdiSfQ5c5A/O381gbnk
	 aFvkdqFad2KQKBmI9S0buZ9DR4blPCUsSm/K0jkXRwYTaQhuxzhecklB70OOWtuRZg
	 BVWJDJi4kZ7pTzQx35Z8VWR5cL5GQqGihInlIQUpx3Xv+95X1h2X5fpRsw4u68C7Qn
	 POAL5yAFWfsag==
Subject: Re: [PATCH net-next v9 05/10] bnge: add ethtool support to manage RSS
 contexts
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:29 +0000
Message-ID: <179551562988.3135.2859794460541679817@kernel.org>
In-Reply-To: <20261123100746.1975030-6-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-6-vikas.gupta@broadcom.com>
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

- [Medium] bnge_refill_dflt_rss_ctxs() in
  drivers/net/ethernet/broadcom/bnge/bnge_vnic.c calls…
- [Low] The commit message says a user RSS context is deleted only when
  the RX ring count changes at open "and the RSS table size changes with…

--

bnge: add ethtool support to manage RSS contexts

This commit adds the ethtool create/modify/remove RSS context callbacks.
Each context gets its own VNIC with its own indirection table and hash
key. It also adds handling for a ring count change at open: user
contexts that no longer fit are deleted, and contexts that use the
default table are resized and refilled.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
> index a44971a7c74d3..7d587290c33ab 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c

[ ... ]

> @@ -201,6 +222,89 @@ void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)

[ ... ]

> +void bnge_check_rss_ctxs_lost(struct bnge_dev *bd, u16 new_rx_rings)
> +{

[ ... ]

> +		if (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
> +		    bnge_cal_nr_rss_ctxs(new_rx_rings)) {
> +			lost = true;
> +		} else {
> +			for (i = 0; i < ctx->indir_size; i++) {
> +				if (indir[i] >= new_rx_rings) {
> +					lost = true;
> +					break;
> +				}
> +			}
> +		}
> +
> +		if (lost) {
> +			bnge_del_one_rss_ctx(bn, rss_ctx, true);
> +			ethtool_rxfh_context_lost(bd->netdev, rss_ctx->index);
> +		}

[Severity: Low]
The commit message says:

  When the number of RX rings changes at open and the RSS table size
  changes with it, a user RSS context whose table does not fit is
  deleted and reported with ethtool_rxfh_context_lost().

Does that match the else branch here? A user context is also deleted
when bnge_cal_nr_rss_ctxs() returns the same value for the old and new
ring counts, as long as any indir[i] >= new_rx_rings.

For example, say firmware grants 6 RX rings instead of 8 at open. The
table stays at 64 entries, but a user context that steers to ring 7 is
still deleted through:

bnge_open_core()->bnge_reserve_rings()->bnge_check_rss_ctxs_lost()

and userspace gets an ETHTOOL_MSG_RSS_DELETE_NTF.

Could the commit message cover this case as well?

> +	}
> +	mutex_unlock(&bd->netdev->ethtool->rss_lock);
> +}
> +
> +void bnge_refill_dflt_rss_ctxs(struct bnge_dev *bd)
> +{

[ ... ]

> +	if (resize) {
> +		if (ethtool_rxfh_ctxs_can_resize(bd->netdev, tbl_size)) {
> +			dev_warn(bd->dev,
> +				 "RSS contexts cannot be resized to %u entries\n",
> +				 tbl_size);
> +			return;
> +		}
> +		ethtool_rxfh_ctxs_resize(bd->netdev, tbl_size);
> +	}
> +
> +	mutex_lock(&bd->netdev->ethtool->rss_lock);
> +	xa_for_each(&bd->netdev->ethtool->rss_ctx, context, ctx) {
> +		if (!ctx->indir_user_size)
> +			bnge_set_dflt_rss_indir_tbl(bd, ctx);
> +	}
> +	mutex_unlock(&bd->netdev->ethtool->rss_lock);

[Severity: Medium]
Do the RSS notifications sent from here show the final indirection
tables of the default-table contexts?

ethtool_rxfh_ctxs_resize() in net/ethtool/common.c sends a notification
for each context right after the resize:

	xa_for_each(&dev->ethtool->rss_ctx, context, ctx)
		ethtool_rss_notify(dev, ETHTOOL_MSG_RSS_NTF, context);

The contexts with !ctx->indir_user_size only get their i % rx_nr_rings
tables in the loop that follows. No notification is sent after that.

For example, a default-table context created with 100 rings has a
128-entry table. Firmware then grants 50 rings at open, so the table
shrinks to 64 entries. The notification carries entries 0..63 of the
old table, and entries 50..63 point at queues that no longer exist. The
table that actually gets programmed is i % 50.

Context 0 already gets this ordering right in bnge_reserve_rings():

	/* Notify only now, so the notification reports the new ring count
	 * and the reset indirection table.
	 */
	if (indir_lost)
		ethtool_rxfh_indir_lost(bd->netdev);

Should the extra contexts be refilled before the resize notification
goes out? Alternatively, they could be notified again after
bnge_set_dflt_rss_indir_tbl() runs.

>  }
>  
>  void bnge_clear_rss_ctxs(struct bnge_net *bn)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
