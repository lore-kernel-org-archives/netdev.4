Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458660;
	b=RpwNc/QUe/j/hHmaVIh03L+8ywBZk7wgHKXd3x1pay/D/B/8T/rNyrUDc+e0SyGlJA1G
	 qwZ6yvi+RigaY7wgPyXC7IPYCo8nzCr2d/wZzza4Ec4PxaRO/qh5FilQhYW1x1GSwZm4f
	 sS0xTdSGajsWmHty5cw9sfC1kmTHa8HqNJemhX2YnvqHU0EwbWH9bdZBshXrvH7VlCLrK
	 w8WJy7dpSZGJ9VQ2towK934CYruO151NqcUbEMC32mU5uM2JAg4cL2sJaUEHCk8JNZixZ
	 DOph2Ra2D+C9WoO8Dvh9ZNGLkTxzPLmlSn9ueKtNgJSLxbblt52XZhmXQ9rVzBBWWBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458660;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0Cr5+htcvfo1cucc/4RedFWOfXhyue4IWdVJkAGcmPI=;
	b=RE7UOAnQTAiZh+6l06Q2i0hl0mvEU2lhrlzGTiSMr/aLSRRYapKPNYEiDPmiPvkYrwJi
	 MQgO2qqoPJwzCxlnwjDYV9IZFol7EFsL0tLNq5dAhTIWU+3vl9COR7a6XzXX3a+ZlpcPj
	 Rxlw7LkyHRVmPTNegUH/BZ4JUIIl1vu5kA8gejR0Z/h/VvShloALbK3h4abHlJrDC8JEk
	 gpC7+vaJYtOHU/uLlntedUf50EG4OIRTm1raSFKdkOWU0eA157DhynWEAHbcrQNn/7B+Z
	 yyFUL3I1OoxVejq8APjP3JWOL0lAQJhPqK55BcxEoI8HdKwzzIY9DhYNSs7qOS9reRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlJxlKP0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780A606A334;
	Mon, 23 Nov 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlJxlKP0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF821F000C6;
	Mon, 23 Nov 2026 18:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458660;
	bh=0Cr5+htcvfo1cucc/4RedFWOfXhyue4IWdVJkAGcmPI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mlJxlKP0YMQVkwFrr2i4+kBhSomdW3Ds3eRTfbFko8mgj4GV9LzreTYLTRukJTF4E
	 WalyfdN4hgPfWUrX74M7ZIsU/dMrVf4jIQvWGmxl6VMwtwNa6Fq17dszX9/qJGrACh
	 oy0Kfluw1aF4OOU6Ug/pPmi6DLHAG/CXsew4cSArxTkKRodN/F3ggFV/apAPNJEze/
	 33CUydGsMWDHoceZOLk8ohagsLBXCuI/cYruc82x6l0Et/bNN4b8TKMcwHWGx3pcal
	 L9Bs0c8gDI5e+jG/p42p3wixr2T+FA+Z9FARGEjlm9zzVfzFI1eIhOKs/xuKlQWCLk
	 35+bj/qBfKXsg==
Subject: Re: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion
 never arrives
From: netdev-bot+sashiko@kernel.org
To: joe@dama.to
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 prashant@broadcom.com, edumazet@google.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 18:30:59 +0000
Message-ID: <179545865940.3135.4199576162321798829@kernel.org>
In-Reply-To: <20261120152830.699712-3-joe@dama.to>
References: <20261120152830.699712-3-joe@dama.to>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In __hwrm_send()
  (drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c), when the HWRM_DONE…

--

bnxt_en: check HWRM response if completion never arrives

Before this patch, an HWRM_RING_FREE sent over a completion ring failed
if __hwrm_send() timed out waiting for the completion. With this patch,
__hwrm_send() checks the response buffer first. If resp_len is set, the
sequence id matches and the valid byte is set, the command is treated as
completed and goes through the normal error_code handling.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> index de02d1baa7514..53667c0c38aaf 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
> @@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)

[ ... ]

> +			/* The completion was not delivered, but the firmware
> +			 * may still have freed the ring. Check the response
> +			 * before giving up and log the state.
> +			 */
> +			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
> +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
> +			if (len && resp_seq_id == ctx->req->seq_id)
> +				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
> +
> +			if (!valid_byte) {
> +				hwrm_err(bp, ctx,
> +					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
> +					 req_type, len,
> +					 le16_to_cpu(resp_seq_id),
> +					 le16_to_cpu(ctx->req->seq_id));
> +				goto exit;
> +			}
> +
> +			/* Read the rest of the response after the valid byte */
> +			dma_rmb();
> +			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
> +				netdev_warn(bp->dev,
> +					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
> +					    req_type, len, valid_byte,
> +					    le16_to_cpu(ctx->resp->error_code));
> +		} else {
> +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>  		}
> -		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>  		valid = ((u8 *)ctx->resp) + len - 1;

[Severity: Medium]
Is a set valid byte in ctx->resp enough to show that the ring is safe to
free?

The commit message calls this case one where "only the notification was
lost". But the commit in the Fixes: tag, 74608fc98d28, sent the
RING_FREE response to the completion ring so that the completion entry
itself would act as the fence:

  "The response will be the last entry in the ring and we can free the
  ring after getting the response.  This will guarantee no spurious DMA
  to freed memory."

The response buffer and the HWRM_DONE completion entry are two separate
device writes. Once token->state is BNXT_HWRM_COMPLETE, the existing
success path reads resp_len without waiting for the valid byte. That
suggests the response buffer is written before the completion entry.

So a set valid byte may not mean that the HWRM_DONE entry has landed. It
also may not mean that the TX/RX completions queued ahead of it on the
same ring have landed.

This path runs when NAPI has stopped draining the completion ring, for
example after a TX watchdog timeout, a lost IRQ or a full completion
ring. In that situation the hardware may still have completion DMA
pending.

Before this patch, this case returned -EBUSY. Later in this series,
"bnxt_en: stop DMA before releasing rings the firmware did not free"
makes bnxt_hwrm_ring_free() count only -EBUSY results as stuck rings.
__bnxt_close_nic() then calls bnxt_stop_dma():

    if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
                               close_path) == -EBUSY)
            stuck++;
    ...
    if (bnxt_shutdown_nic(bp, irq_re_init))
            bnxt_stop_dma(bp);

This is the close path that reaches this code:

__bnxt_close_nic()
  bnxt_shutdown_nic()
    bnxt_hwrm_resource_free()
      bnxt_hwrm_ring_free()
        bnxt_hwrm_tx_ring_free() / bnxt_hwrm_rx_ring_free() (close_path)
          hwrm_ring_free_send_msg()
            __hwrm_send()

This patch returns 0 when the fence was never seen. Would those rings
then skip the stuck count and bnxt_stop_dma()? If so, bnxt_free_skbs()
and bnxt_free_mem() would release the ring memory while bus mastering is
still enabled.

Also, if the HWRM_DONE entry shows up late and NAPI processes it after
the token has been released, does hwrm_update_token() just log an
"Invalid hwrm seq id" error?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120152830.699712-1-joe%40dama.to
