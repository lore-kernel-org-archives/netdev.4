Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468695;
	b=nDd4arHohojSw/b9buJ+Vdcy8bc6PiV3Fa/iVctDaS3Qx25rM5lfDyEiquQQJTruo2kF
	 6XBmEbgUyBlitvpdKWXH1V3uy2kA8GZSWRKMjaa4wDENrq+FMHbfLgwtianLykz3h6gcb
	 3VWo0o2EsSMUCsaJuSFXgeuo8RhiX8iVfusuZpA9PRF2Jarm4hBwd37w3mBf3iHwCtBJ2
	 19/CR6lq32LfFmEGDIAypM6WOWUAfHA99+KJQsDp3Www8hHZszlhTe2FhKyIWNAS+e6O+
	 1i9Hp+HwoB+HvOY0QYRxmiZCLYXe8gw3GzfGoZq7vmV8BNZdb6Tm6IgvwBTUROnvWPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=rnFG97WXsa546bE2oe4nQaaoawSalj3YEF2bXMkelUo=;
	b=QdQlU9uB8Gn8du3FM06Xr3H95SKOSx2bXpIhjjVPBmk8vimwykjrHKItstqpWxYHVULb
	 P2zFpfnXT+BtiQ7q/XhG6BSnbLd+ScAi272PA/YWTx8CYqsGE0JZXkfI6g980YGdoFfOt
	 tEsKbB2WODVBXsk+CqnNMWsUNfdYKFn/+co8KESQNh0wSMtlKa/Zukz74GeQpeR0HWSY8
	 esf2+CcMABMGU7AzPjFT3K+wjjbyGy42Bn5ln7MbPVvI/eBWZt/vJZmPW6+FRGb5I26NW
	 pNXFNfAaN/0BGvdeT5z9L7ehEMMghvbjNoVPFVW3dDkbSvRqjMdO7+GS+AJV5ikwIbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZymQIMKI;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CCB606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZymQIMKI
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cde84cb8803so690253a12.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795468694; x=1796073494; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnFG97WXsa546bE2oe4nQaaoawSalj3YEF2bXMkelUo=;
        b=ZymQIMKIHgtOZ3h9wmhuFq5N5VzASSfaGAbDi259xOEgfIO4rOR02KPHNqW4Nc3fXo
         t7wnSaqOjx3x5bhq46oC8jr6gQ72wGLgXgWsV+yXRBZUDyFtHmSo3ZtYjPYnZJ6b2GGk
         S/U36mI1ZS/r1tPJgHQzfRKtiBLXo5euSzmS2mSKhKg3asE9d6UX/0wD0+sTSe3tCzXn
         baTAcHgaar3Y5Owzj97f7PZ+Le3hdxzHRVMadUOlzHfjm8hCshzX+qM5q2zVbvQ6T5mc
         ZXwnBfIwhLyJRyANMre16nA3/fL9yPD9WmNTwYz7fxP7IpYkItPLcvxbebRRtOHoZJDr
         pA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468694; x=1796073494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rnFG97WXsa546bE2oe4nQaaoawSalj3YEF2bXMkelUo=;
        b=zwCBo1Me6xIBchb3TxsrV6t4EEulIostL3RaEy54qyyz3bhJIVMbAr9aJhsfMAyWtf
         1S/rd7dtLS3nsDcZmN3yCG03+/oCP8tTrHCwxlZ+jCx3PQCi5RRNn4nzVM0E1Vlo98y4
         3pqJ1Gp5O+Q+SACxm7NecwD44wYgwApEBhKA6MtAt8ERvBbAe5wb0ISkSJOqTgfPzDs1
         XTOroNpDZQ/qpCwPhcsSEXTdRTttyZ6T1Oyo190n7Y6yap5os7BI/vd3Sd2t2U8szChT
         JunvYCnja9lqhLBC2KdRbSef8pPPsw2AauMSL/Zl07QTE+WPqY1GmCwoFLvGbJpsihli
         b4EA==
X-Gm-Message-State: APuU4Z/ZuD8FN5M6gi4R+t5n7VREhzDuorSC+2URyVkQXvLls8zpe7SB
	d78fsCjQofSGY1/vAB0IN+DxqGwBHRCTfrG/2FpvJhGUQnXxegRlSj+OSn2S8b6ZUMo=
X-Gm-Gg: AZFdTZcWDxCR0dl5VWJcEAsjWty4JUsH5VYGQzB1vXSJwo/uhgwzB5ezrcNFpvPPbsu
	hZM/R51MTJXDhyp8SketSXgtM8SkbPqY4/LKkJV4noNd7s+5pg3OLspRUk1VkMjsRGXohbJBRaZ
	OE3HLciWBrZy5YDLh4i6/l6HPOjkDQass6575eYfqPuUOA0V7/q++UZwBtYBnw6ZFep2fqYYFRm
	lihPyfdCYduUPc39eRl4RNCLORp1Va4n2N616EntdZIqX+AT1G64FPSl4l3y+J0bG17kBtE6H0v
	fa7H5ckjW9ucXTBqM7ET65aUfs0YVdMLIPUijKY946AOfOTWgDz2GASeeE1A868HsyDXNkfmGao
	UJ9icreuPNLewvfSJbvhlwOvYqGFAt6zM+QikiymhrVlh9PfftKop3tUc43IErDs/cOkIOgW5GZ
	j8j4geG4wPBH5gIHGo3Yqt+HRKb3BaqAtLbBBWSWvryLIpf9ItqRRB0I1jjAa2w08jK4QDzNylQ
	dPxhZs8CAa26V2mHAE+W4Mb8tAbywRtabRySzMEQVONpmbyQcJwGl5Td+qL1mpWI86ydu8ehaSh
	gJceIvl7W77Rbk72eLmlrATmbWnwe4fGfxqkUS0lIA==
X-Received: by 2002:a17:90b:5109:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b41c956568mr11182393a91.50.1795468694116;
        Mon, 23 Nov 2026 13:18:14 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm3916508a91.14.2026.11.23.13.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:18:12 -0800 (PST)
Date: Mon, 23 Nov 2026 13:18:11 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 1/5] bnxt_en: return the RING_FREE status to
 callers
Message-ID: <awStk4gPo+BvDDuQ@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-2-joe@dama.to>
 <179545865792.3135.13782875077253506018@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179545865792.3135.13782875077253506018@kernel.org>

On Mon, Nov 23, 2026 at 06:30:57PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message describes an errno contract that
>   hwrm_ring_free_send_msg() (drivers/net/ethernet/broadcom/bnxt/bnxt.c)…
> - [Low] The commit message says 'No caller acts on it yet, so there is no
>   functional change' but still carries `Fixes: 74608fc98d28`.
> - [Low] In hwrm_ring_free_send_msg()
>   (drivers/net/ethernet/broadcom/bnxt/bnxt.c), the `return -EIO;` left…
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is still
>   present at the end of the series.
> 
> --
> 
> bnxt_en: return the RING_FREE status to callers
> 
> This patch makes hwrm_ring_free_send_msg() pass up the errno from the HWRM
> layer on failure. Before, it always returned -EIO. It also changes
> bnxt_hwrm_tx_ring_free(), bnxt_hwrm_rx_ring_free() and
> bnxt_hwrm_rx_agg_ring_free() to return that status, though no caller uses
> it yet.
> 
> > No caller acts on it yet, so there is no functional change.
> >
> > Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
> 
> [Severity: Low]
> This isn't a bug, but is the Fixes tag meant to be here? The commit message
> says there is no functional change. At this commit, every caller of the TX,
> RX and AGG helpers still ignores the return value.
> 
> Later patches in the series carry the same Fixes tag and depend on these
> return values, for example "bnxt_en: stop DMA before releasing rings the
> firmware did not free". If the tag is there so stable takes this patch
> together with them, could the commit message say so?

The fixed tag belongs there, yea, and I think it being there already explains
to stable what the situation is. So, I'm going to pass on this feedback.

> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index e78cf7ad3cbc8..c3413354e7582 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -7673,55 +7673,62 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
> >  	if (rc || error_code) {
> >  		netdev_err(bp->dev, "hwrm_ring_free type %d failed. rc:%x err:%x\n",
> >  			   ring_type, rc, error_code);
> > +		if (rc)
> > +			return rc;
> 
> [Severity: Medium]
> Does the errno returned here match what the commit message describes? The
> message says:
> 
>     Return the errno from hwrm_req_send() instead. -EBUSY means no response
>     arrived: the wait timed out, was abandoned, or the firmware channel is
>     down.
> 
> If the channel is already down, the request never reaches __hwrm_send(),
> because hwrm_ring_free_send_msg() returns success first:

Yes, you are correct that the commit message could be adjusted. If there is a
v7, I will fix the commit message but I am not sure it is worth respinning
this if only the commit message is slightly imprecise.
 
> 	if (BNXT_NO_FW_ACCESS(bp))
> 		return 0;
> 
> So the only channel-down case that comes back as -EBUSY is a FW_FATAL_COND
> that gets set during the wait.
> 
> Some cases where RING_FREE never reaches firmware return -ENOMEM, not
> -EBUSY. The first is hwrm_req_init() failing in __hwrm_req_init():
> 
> 	req_addr = dma_pool_alloc(bp->hwrm_dma_pool, GFP_KERNEL | __GFP_ZERO,
> 				  &dma_handle);
> 	if (!req_addr)
> 		return -ENOMEM;
> 
> The second is __hwrm_send() failing before it sends anything:
> 
> 	token = __hwrm_acquire_token(bp, dst);
> 	if (!token) {
> 		rc = -ENOMEM;
> 		goto exit;
> 	}
> 
> __hwrm_to_stderr() also maps a firmware HWRM_ERR_CODE_NO_BUFFER reply to
> -ENOMEM. A caller therefore can't tell "never sent" from "firmware
> rejected" for that errno. Also, the hwrm_req_init() error is returned here
> as well, not only the errno from hwrm_req_send().
> 
> Later in the series, bnxt_hwrm_ring_free() counts a ring as stuck only
> when the helper returns -EBUSY:
> 
> 	if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path) == -EBUSY)
> 		stuck++;
> 
> On the -ENOMEM path, would the ring then be released through
> bnxt_free_mem() without bnxt_stop_dma()? Firmware never got the RING_FREE
> and still owns the ring. The path would be:
> 
> __bnxt_close_nic()->bnxt_shutdown_nic()->bnxt_hwrm_resource_free()->
>   bnxt_hwrm_ring_free()->bnxt_hwrm_tx_ring_free()->
>     hwrm_ring_free_send_msg()->hwrm_req_init() returns -ENOMEM

Yea, I don't buy this one.

This would need a small allocation to fail on the close path. The driver
already released the ring in that case before this series, so nothing gets
worse with this change.

Every RING_FREE failure in the production logs from the cover letter was a
no-response (rc:fffffff0, -EBUSY).

That is the case this series handles.

> >  		return -EIO;
> 
> [Severity: Low]
> Can this return -EIO still be reached?

Probably not, but leaving it is harmless.

> This isn't a bug, but rc is now the errno handed to callers, and the
> netdev_err() above prints it as rc:%x (for example rc:fffffff0). Would %d
> be clearer? The %x format predates this patch. After a timeout or abandon,
> the err:%x value also comes from a response buffer that firmware never
> wrote.

The response buffer is zeroed before the request is sent, so err reads 0 in
that case. That matches the logs (err:0).

> >  	}
> >  	return 0;
> >  }
> 
> [ ... ]
> 
> > -static void bnxt_hwrm_rx_ring_free(struct bnxt *bp,
> > -				   struct bnxt_rx_ring_info *rxr,
> > -				   bool close_path)
> > +static int bnxt_hwrm_rx_ring_free(struct bnxt *bp,
> > +				  struct bnxt_rx_ring_info *rxr,
> > +				  bool close_path)
> >  {
> 
> [ ... ]
> 
> > -	hwrm_ring_free_send_msg(bp, ring,
> > -				RING_FREE_REQ_RING_TYPE_RX,
> > -				close_path ? cmpl_ring_id :
> > -				INVALID_HW_RING_ID);
> > +	rc = hwrm_ring_free_send_msg(bp, ring,
> > +				     RING_FREE_REQ_RING_TYPE_RX,
> > +				     close_path ? cmpl_ring_id :
> > +				     INVALID_HW_RING_ID);
> >  	ring->fw_ring_id = INVALID_HW_RING_ID;
> >  	bp->grp_info[grp_idx].rx_fw_ring_id = INVALID_HW_RING_ID;
> > +	return rc;
> >  }
> 
> [Severity: High]
> This is a pre-existing issue that this patch did not introduce, but it is
> still there at the end of the series.
> 
> bnxt_hwrm_tx_ring_free(), bnxt_hwrm_rx_ring_free() and
> bnxt_hwrm_rx_agg_ring_free() clear fw_ring_id on every path. The RX and AGG
> helpers also clear the grp_info rx_fw_ring_id and agg_fw_ring_id. The queue
> management callers ignore the status these helpers now return.
> 
> bnxt_queue_stop() does:
> 
> 	bnxt_hwrm_rx_ring_free(bp, rxr, false);
> 	bnxt_hwrm_rx_agg_ring_free(bp, rxr, false);
> 	page_pool_disable_direct_recycling(rxr->page_pool);
> 
> It then hands the old ring and page pool to qmem, and ndo_queue_mem_free
> frees them later.
> 
> bnxt_tx_queue_stop() does:
> 
> 	bnxt_hwrm_tx_ring_free(bp, txr, true);
> 	bnxt_hwrm_cp_ring_free(bp, txr->tx_cpr);
> 	bnxt_free_one_tx_ring_skbs(bp, txr, txr->txq_index);
> 
> This unmaps and frees the TX buffers right after an -EBUSY that nobody
> checks.
> 
> If firmware doesn't answer RING_FREE here, can the device keep writing into
> freed RX pages, or keep reading from unmapped TX buffers?
> 
> The close path log in this series shows firmware can keep doing DMA after
> an unanswered RING_FREE (AMD-Vi IO_PAGE_FAULT). However, only the close,
> half-close and init-error paths through bnxt_hwrm_ring_free() were changed
> to stop DMA.
> 
> The RX side is reachable through netdev_rx_queue_restart()->
> bnxt_queue_stop(), for example from the TPH IRQ affinity notifier or from
> binding a devmem or io_uring zcrx queue. The TX side is reachable through
> bnxt_tx_queue_stop() when BNXT_FLAG_SHARED_RINGS or tph_mode is set.
> 

The above is the first item in the "leaving out" section of the cover letter.
It is a real proble, but I haven't seen it in production. Every failure I've
seen was on the close path.

I think fixing the paths mentioned above are a separate series from this one
which addresses an issue I observed.
