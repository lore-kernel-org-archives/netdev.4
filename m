Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004851;
	b=datSObHjSzDQuPvwQJDN1QG667A4uvRfb9l+kJqmBE5nTe4w5+hkgSnizRE+PYJv2bLN
	 F9TE9M6+Pk71/Jw7f937qEYUntp7XhsS+CLo+vTuGda1QzGljOr4VSRCVPq0UG4Osp+wj
	 8IUE/mZ6YOadXZ3IS+hkTp2DntjAglQSQ2mTEUQhqyGKzQn5OOp0RS5D+rzETAr/ctPAD
	 a1VpnsXRW0Cubp1x0pQ9IhpZZoyEOYQH6FubbOhEW/VANf10pA8w/xcrLrdQ/+00kQ8VJ
	 pLESSi8Z5KzBfKulaWgqkgixcY2Or+sotZrwR1DGqHoRoY0quJF5d2U+Hi2Y7lKC0YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004851;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d/z83gs3Ss0ivurI9JYmePnq369zuhDT4HWm59xKnmk=;
	b=hiI9xUw2+1cdC0iC0Inr/iyMv27cpOQeqb0hnAk7MjGL1k3dqei6tfMw43gykdbFwwec
	 PU6gp9Z9BtEpbpaX0Rm7q5UfYKyQwSAAANcNlKXUTKNbI8XN00Ern3BV3HGGzpSBT1jCz
	 dBwpU9xUHhaJMDjyxFuhfCKtlTCXqYQqFVg0HpIIhWqlZuyDgVPmtrRntP2T8Ne+IkWGV
	 YbOX6mUNufjrC5K5cxrj7VZ3U99rdkYXIK3FKnvxGmNGkSuodiwdPMqsmXArNtE3K2VP9
	 s6VWXkuGxPYpmaz73NnBJ45/j9kXqi1i2IptgwDOHLlL+acOP9GpggklM13idBngQ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ4o1vmH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC38606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ4o1vmH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640D31F000C4;
	Wed, 18 Nov 2026 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004850;
	bh=d/z83gs3Ss0ivurI9JYmePnq369zuhDT4HWm59xKnmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fQ4o1vmHIIPpLqQZTO9W4nmGbHLctVuh/IEpXZvIU1iP8c5YO2cDf8ZalVaEeY/2G
	 Q2N+p5O5qs9jEGWEPDwrPzUxf2akrWjO+n31hqyBWzn7XsmxRd9Y4NgOzKYi4b4poR
	 ypTvf2IwGz2Sd1FhSiVssKysLOiqrhR3EDMS/BVvTbl7KA9u7UOMsjSA+Tc8TOzJKT
	 Lk3+KoepDwrIjtmNq7NGcXN4V/7+ugBIoRpfxCOyN8Dimua5jWZB5dzmk+eVIvCHRc
	 mBP8lPXiyF7dU0OiVvKeJ84HLQx2+iVoWkygQ1M7SHkC+wIcPmL/QVf9YWk2FtjShF
	 B2N6H7mcS6mHg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com, Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 1/6] eth: bnxt_en: order event data before
 setting the sp_event bit
In-Reply-To: <20261118023905.3050661-2-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-2-kuba@kernel.org>
Date: Wed, 18 Nov 2026 13:27:27 +0100
Message-ID: <87v75u8guo.fsf@all.your.base.are.belong.to.us>
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
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> writes:

> Callers of bnxt_queue_sp_work() may store data for bnxt_sp_task()
> right before raising the event, e.g. the IRQ affinity notifier
> publishes the new TPH Steering Tag. set_bit() is not ordered, so on
> weakly ordered architectures the event bit may become visible first.
> If bnxt_sp_task() is already running it can consume the event and
> read the stale data. The queue_work() which follows only re-runs
> the task with the event bit already cleared, so the update is lost.
>
> Add smp_mb__before_atomic() before setting the bit, it pairs with
> the fully ordered test_and_clear_bit() in bnxt_sp_task().
>
> Reported by an LLM reviewer while working on subsequent patches.
> Very unlikely to matter in practice.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethe=
rnet/broadcom/bnxt/bnxt.c
> index 6846a27bfef4..5ad2a3033505 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -394,6 +394,10 @@ static void __bnxt_queue_sp_work(struct bnxt *bp)
>=20=20
>  static void bnxt_queue_sp_work(struct bnxt *bp, unsigned int event)
>  {
> +	/* Make the data the event carries visible before the event bit,
> +	 * pairs with test_and_clear_bit() in bnxt_sp_task().
> +	 */
> +	smp_mb__before_atomic();
>  	set_bit(event, &bp->sp_event);
>  	__bnxt_queue_sp_work(bp);

There are direct callers of __bnxt_queue_sp_work(), that'll miss the
fence. Fixup those callers?


Bj=C3=B6rn
