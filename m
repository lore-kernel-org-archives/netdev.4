Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127048;
	b=bbFsZkimvJb052hIjXgRstNqFOzuaqF6wUShYT2Uoa0wIX4fEbid1pgglT1LOugMNWmN
	 HITU83wcYFOof7E4bpxQEGzSJFp1ovpSwKoiUh/DSRo67f89HEC2PO/83yZjxeXh6uGrM
	 AgpzyVM4MBitVuLfk2X2vM0EbsMhGnTT8oK/hA1c4Ir88m3+9JMLZT0I52Z79OPhpEVtX
	 yoFYPWTjvMoIUPX0Q0StUECp/Q+B7bj9WS7VbwnbUBrmfYPz5ZbUNbi91z1sM7TtxaUvA
	 5SPiZAyDVStZVbwCP+m23RundzX9ZOQRVf3VPgnb3qGxy8UOi18jAIQe4RJ+LzmlIlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127048;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MlhI3uLFihtIxO6VQXkXvq8PfKkWoJX+XTh7Gyi8uPo=;
	b=mD+6haqQ/e6PsNSkkuZIVxVF10w1nixeGeSpQcpMfrMQu1sS82r56pFGYwEIBJCdOnts
	 D87ysv4UPxpFiC/HJsGsGugtgDE5UWjp4i72TW4izMJvTz/2QamfkMqLKV7JSSH21/2TO
	 aW/GdEAq5B2IoyoJWQM2WWbmHd+6HJuPTV8whq+ZgQhqfIMjAXkxHXCvQlmgB6OvKWsRI
	 TSoPNzO9Smnyi1sI/7E648LNvMp4hfsZ0AP3WhihwpqwrAXgAf44+ANkQbi+/plXWBp9/
	 0HNMFyj2uwXGpgWWp3mY89gO3irqfA9GALtS/VrE2v0v1fI/tRmmUUJUK3JmlPk7C4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P7kUNGXO;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4135606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4135606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P7kUNGXO
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Q5l2FHqNCjLOr770Cpwl0EQyPJyuaWKoV8UzD7ZWGc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795127045; v=1; x=1795731845;
 b=P7kUNGXOu0kBJK2UQDXk35Ywvrj7vpp1NbakIvkTY9IZ61XtNsUSkn2vQX/W4xkZJbShAvcs
 Q6R66Zoldx8HisVRLsWhuGrJNadhLqhh9z8jHrl1D+LbJec8iYYht1LpjC/FXXWgteZcC5diIYz
 ncCxSEVT0iDPYYTx/ReNDjLA=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e7648e708128b93;
	Thu, 19 Nov 2026 22:24:05 +0000
X-Mizu-Trace-ID: 5e7648e708128b93
X-Migadu-Flow: FLOW_OUT
Message-ID: <ffec4c83-8026-43fb-b3fe-b0c3f9bbe2c7@linux.dev>
Date: Thu, 19 Nov 2026 22:24:05 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 3/4] ptp: ocp: report disabled SMA inputs
 consistently over DPLL
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch, arkadiusz.kubalewski@intel.com,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us, kuba@kernel.org,
 pabeni@redhat.com
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
 <20261119-timecard-common-v2-078fe69f33-3-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-3-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 21:19, Ahmad Byagowi wrote:
> Disabling an SMA input clears its mux field. Zero is also the selector
> for 10 MHz, so a DPLL read reports 10 MHz while sysfs reports None. The
> DPLL core then treats a request to enable 10 MHz as unchanged and skips
> the setter, leaving the input disabled.
> 
> Substitute SMA_DISABLE for disabled inputs before looking up the
> frequency, as the sysfs path already does. The None entry reports zero
> Hz and a subsequent 10 MHz request reaches the setter.
> 
> Reported by the netdev Sashiko AI review and confirmed by code
> inspection. Source-derived C regression tests pass with ASan/UBSan;
> restoring the faulty selector, mask, disabled-state or DCF value makes
> the corresponding regression fail. Tests use stubbed MMIO, not hardware.
> The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
> physical card was tested.
> 
> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.
> 
> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index f1f97c1fa0..06d05fac6e 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5923,6 +5923,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>   
>   	val = bp->sma_op->get(bp, sma_nr + 1);
>   	val &= SMA_SELECT_MASK;
> +	if (sma->mode == SMA_MODE_IN && sma->disabled)
> +		val = SMA_DISABLE;
>   	tbl = bp->sma_op->tbl[sma->mode];
>   	for (i = 0; tbl[i].name; i++)
>   		if (val == tbl[i].value) {

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
