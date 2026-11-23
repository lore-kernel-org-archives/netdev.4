Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473815;
	b=Rnwa+vH8C3QMNPGs91iU6FiecifjoFT/JxAWW3w3M61jP9do+ldMDUSRP08zz4E7+KtA
	 QjPh7U8x33qHV4aibzt7sIKn0PYmH6X1LPzmEUm/PN+VGyJfLXlsmK3Q9qmGjXue9ucjZ
	 UJt5B+fMNSqQ7ZBkMVAZjwaQDn3A0lV400yvd5/3yqvet9HAAjXc/GIInx85FFN7zBFxr
	 0bgIeKSqclZX6RQn3M5NogQdBdTsqg/J0Lv9EMTFBagSvBum5x49CK0fYe0YQ9VOnKlcu
	 LCh+Qf1e8oariHi4Jhv0/pUt2HACFwJ7JDYgaVQPpCfCnVTHZuE9RyTODygE5U5GzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xgnrayIkOaQrcjb8wZzRDk+U8VdMFAj8Ymtz/buBiqc=;
	b=VtCP2zytbOUmvRa2ys2brFC6y9cjhykjFCldnvX411BMcyocXA2Z3XYs9CEejZ4jUiYj
	 9PmlzoVxLChm2RG228iu5msjA0PnnVWgikPj4J0X2qdQ7yJF88kEgU9uvuKAUCAh62rQW
	 pVp5uoioLkX6yswVerIF0TqiefIRR5XxwYwJ1JcrL6BvD5C0lcXsNsYn0yL+N83TKEH1T
	 LdiJW4QfO79dI74fXOu3Hxg3+p9HzR0FM7hecD26tskEv7gkDYMUHT1grQ3XfGrEZUUK4
	 UJ62bOVEtFDoay+L+eqAgCBtk0Fiy+wPVzRt5THLiAnjRC+TyXn8bOGDRvvtjPkPGTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t89UtQSe;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13C606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A13C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t89UtQSe
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1958195a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795473814; x=1796078614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgnrayIkOaQrcjb8wZzRDk+U8VdMFAj8Ymtz/buBiqc=;
        b=t89UtQSe4/VuHG8pw0NtGtJd/7Lw9GJ0OKrPyY/Q0IioDd3ZOJ43WUhnoEBLJ6GhTv
         IERzqfWlTzWwT6SrTW79NrpOgQLZpEoiT8eGY7CTrCwOsZHqlVOBVZQjcTahUUCO0Ynb
         cjQxPkCMSaH2yldtBD3AgRPBi64ASUp9E9EFBPG8RKW9uSELyHQGC0R2QF9Uo2eWj7KK
         p8lzRjz8QadYc6uKb3ujPFA/TphrW9IVtIxYKw+t7wl066IFY/lo+l754MS2YJqOvaIb
         ZLLNPTHbbGGn6ZLcf0t4c8NRMNgeXziRnAAEpImRuNf4Uy2LlFcrmkQdXHqzn2sPe/y1
         Yy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473814; x=1796078614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xgnrayIkOaQrcjb8wZzRDk+U8VdMFAj8Ymtz/buBiqc=;
        b=qLkabXXfnV5CHYyHGmzGaqFj7Vyp5PLYAdVoGnINNEx/++eRFp9NRp679W0X1DdvRF
         Egvrqzm2pEGNV/DMLdawxaGDB1ogUYUNAXCeTEBo9n2qnwVrIW+1PrsfMqBQ/7tUeTjb
         PCwuBhv/4vwMPL8lLMO3MWYz/5EcpVxYVBh3N0silLtbBLjKv+Ip0xKJeXVyNVUTuI6Y
         /wcAquFPjWve+3aU2L5ESysQ5bvbbosCvoavEqnXgeD/t8zB7YjD8EA5Qb13ioy/rKGv
         JLUz7bTsxSKSyqDm5trhcT+HMgbisG4zUMICmo8wo4w3QZfVMX9FqrzR7VRu8RZiWHFu
         gvYA==
X-Gm-Message-State: APuU4Z//qaJYSOn2k6xCYHSYevy6Kws+GrRtlS2AJG5qOZ044sAMwXCb
	kfUNg9gFBxLZIulfaBqmkwYbELOlJj8gQYGhdHh0oyUPXskdC+MJS6OhfBimUrpYL84=
X-Gm-Gg: AZFdTZeD8JbNT1u3TABVYG/SsVZ0a4ClnvZAofNgCvZMTgPT/BgCLpmtBA4TGP3w5J6
	j2JxqpQArezM7UqnVjACcTC/xT/+brO8Kgg79V46S4lET3XU/GwL/AZ8siRn7432PDLJ0BRJHVv
	WPcZ5gvJAjPhMJxl4p9Gqiza9TUnw1PFpC9Pddro+yjrTLy40fS1nf3RKXnaPIMhL2FKT3+qhU7
	Evud/+8qCPc/J7Iv29WUrlnSflwqlApq70FilgdeIzn5VOzOKMILMS97LlC1xzqqM+/71k/Q+Av
	z6QALolcO9aDJzifSIrG1EZt91vKGbHfrimvzdEbl5jfiVYrBaDZYXoH9tkBNZwKz3Dpy3AsVCQ
	l6SOfcHT42pxnQB/hmskDsWC6lJow1A8eQClJDDXBJmHw3jIK27qagyRBA1k4G7w8716bUCLlcP
	X51twBgjdq+OnOdFHUnRDNZ27yI6iPzZj3/RpZQFMpb+9CHvG7MSRxypgOrGVkim4MT4kTmNQo2
	Zu7WFbJhztRRGZBjn/7pkdgfZ2qrqAz4N2CLUrVg3N/o6XeiPM0jEIWSl+bTRs6sjHtfp8HjQEM
	k01fg49PaEag0zzjFznF+vPDLfvaccbw9zTuaTkmaBjZZh7a5dNFLNeXpkQ3jOjC
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr11533973a91.5.1795473813724;
        Mon, 23 Nov 2026 14:43:33 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm7890610a91.1.2026.11.23.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:43:33 -0800 (PST)
Date: Mon, 23 Nov 2026 14:43:31 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion
 never arrives
Message-ID: <awTBkxA0DV4BiQym@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, prashant@broadcom.com, edumazet@google.com,
	horms@kernel.org, selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com, linux-kernel@vger.kernel.org
References: <20261120152830.699712-3-joe@dama.to>
 <179545865940.3135.4199576162321798829@kernel.org>
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
In-Reply-To: <179545865940.3135.4199576162321798829@kernel.org>

On Mon, Nov 23, 2026 at 06:30:59PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In __hwrm_send()
>   (drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c), when the HWRM_DONE…
> 
> --
> 
> bnxt_en: check HWRM response if completion never arrives
> 
> Before this patch, an HWRM_RING_FREE sent over a completion ring failed
> if __hwrm_send() timed out waiting for the completion. With this patch,
> __hwrm_send() checks the response buffer first. If resp_len is set, the
> sequence id matches and the valid byte is set, the command is treated as
> completed and goes through the normal error_code handling.
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > index de02d1baa7514..53667c0c38aaf 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> > @@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
> 
> [ ... ]
> 
> > +			/* The completion was not delivered, but the firmware
> > +			 * may still have freed the ring. Check the response
> > +			 * before giving up and log the state.
> > +			 */
> > +			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
> > +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> > +			if (len && resp_seq_id == ctx->req->seq_id)
> > +				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
> > +
> > +			if (!valid_byte) {
> > +				hwrm_err(bp, ctx,
> > +					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
> > +					 req_type, len,
> > +					 le16_to_cpu(resp_seq_id),
> > +					 le16_to_cpu(ctx->req->seq_id));
> > +				goto exit;
> > +			}
> > +
> > +			/* Read the rest of the response after the valid byte */
> > +			dma_rmb();
> > +			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
> > +				netdev_warn(bp->dev,
> > +					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
> > +					    req_type, len, valid_byte,
> > +					    le16_to_cpu(ctx->resp->error_code));
> > +		} else {
> > +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> >  		}
> > -		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> >  		valid = ((u8 *)ctx->resp) + len - 1;
> 
> [Severity: Medium]
> Is a set valid byte in ctx->resp enough to show that the ring is safe to
> free?
> 
> The commit message calls this case one where "only the notification was
> lost". But the commit in the Fixes: tag, 74608fc98d28, sent the
> RING_FREE response to the completion ring so that the completion entry
> itself would act as the fence:
> 
>   "The response will be the last entry in the ring and we can free the
>   ring after getting the response.  This will guarantee no spurious DMA
>   to freed memory."
> 
> The response buffer and the HWRM_DONE completion entry are two separate
> device writes. Once token->state is BNXT_HWRM_COMPLETE, the existing
> success path reads resp_len without waiting for the valid byte. That
> suggests the response buffer is written before the completion entry.
> 
> So a set valid byte may not mean that the HWRM_DONE entry has landed. It
> also may not mean that the TX/RX completions queued ahead of it on the
> same ring have landed.

Agreed. The valid byte shows that the firmware finished HWRM_RING_FREE for
the TX/RX/AGG ring. It does not show that HWRM_DONE was posted to the
completion ring.

Michael, can you confirm that the firmware has stopped DMA for the ring
(other than completions to the completion ring) by the time it writes
the RING_FREE response?

If the response is written before the ring is quiesced, then this patch is
wrong.

> This path runs when NAPI has stopped draining the completion ring, for
> example after a TX watchdog timeout, a lost IRQ or a full completion
> ring. In that situation the hardware may still have completion DMA
> pending.
> 
> Before this patch, this case returned -EBUSY. Later in this series,
> "bnxt_en: stop DMA before releasing rings the firmware did not free"
> makes bnxt_hwrm_ring_free() count only -EBUSY results as stuck rings.
> __bnxt_close_nic() then calls bnxt_stop_dma():
> 
>     if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
>                                close_path) == -EBUSY)
>             stuck++;
>     ...
>     if (bnxt_shutdown_nic(bp, irq_re_init))
>             bnxt_stop_dma(bp);
> 
> This is the close path that reaches this code:
> 
> __bnxt_close_nic()
>   bnxt_shutdown_nic()
>     bnxt_hwrm_resource_free()
>       bnxt_hwrm_ring_free()
>         bnxt_hwrm_tx_ring_free() / bnxt_hwrm_rx_ring_free() (close_path)
>           hwrm_ring_free_send_msg()
>             __hwrm_send()
> 
> This patch returns 0 when the fence was never seen. Would those rings
> then skip the stuck count and bnxt_stop_dma()? If so, bnxt_free_skbs()
> and bnxt_free_mem() would release the ring memory while bus mastering is
> still enabled.
> 
> Also, if the HWRM_DONE entry shows up late and NAPI processes it after
> the token has been released, does hwrm_update_token() just log an
> "Invalid hwrm seq id" error?

Yes. NAPI is still enabled at this point in the close path, so a late
HWRM_DONE only produces that error message.
