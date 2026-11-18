Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014077;
	b=fG3Q0NjMDO/2pHf2MzeyazEdK3Kw8h4yk2Jjn+/AnEV3a+FkmL2fK3Nos9bzUsteCHNv
	 S6S2CkbPQLyRWTk0YFNHS5FzFYWba5e4yicn2LReetVPrAi/67KK9c4uDHcuGaSjIMKoL
	 Id6+5SSD1hrq13e2MKcyZRXvDbWOphjDHTuujjLL5X5Vo+/XXRg2M3UjZE7GJy0AbRoVu
	 x7hmDNHd88ZB73tsh9Nm9RxROfSCFMRkWMkNkmPf+xrMNMYI3OIX6RAMM65kDz5Wkvt3A
	 IsbZ5PX0bFVQG12MeTuqwOm1weJP1Fdq135Bs9Ygr4R9JBDgNN3ppTN78/Ha1w5ghpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sBpkM+D4ceLLEoj6PwfftKKY79vNaotRYiVwEiHUE9Q=;
	b=1zPEXwGIDX0J7DOlYoZ6EDwlMPbgApxM3pB1zcbgathrO2fpZeFl+MqGIy6QPuI8dqOj
	 OBdko/V/kh3uxVdeF9hp1wR8rZNx6rmGyMkFe4//Yz3gBKy/hl04+Jrgid5aLt2uYNHLA
	 m7K3FSyrBAFpHhOU/4kJRmvIGIsre9J5EqCylHKotfg9DOJa5vP4hVufGKB7PQH8l36hA
	 0PKQu5PhCYVr9cw/vAIVJxjtycVTP3iIqBXlEsaxjSITPUXIlX0WOtdj6xnQAXHt0POoH
	 YO9fU5SQh0P5jUv8zpvUdO1GKZ2s0tHro4IOx11SkjNsE8uacCOt7rvARisl9G4ktPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qhGucDFY;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2321606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2321606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qhGucDFY
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso601314a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795014076; x=1795618876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBpkM+D4ceLLEoj6PwfftKKY79vNaotRYiVwEiHUE9Q=;
        b=qhGucDFYBC7aCQjPDmAC2YNPWQ6bLbxftPjvuYJN8vr/XpjrABC0ABmymuxHkVuKSI
         xmShxACRfudE1uG+caw9XG/YBYMUV72y+PKt5DANouR4DvjVggLJNHcZWqFMWd50wLxO
         neWTEUIW34IcU1Jcl+CnB0RQttp0P8vc3vjmeKi26bFnsLU7ey98pvL4S1HWtorDDtz9
         de4L4FaIg/xfRb0F3eiWkrW+ZhXOw+7fEtxBeUfoUDyrCHeFPHXuUIVSXPjCiG2pnPtv
         or4dcqEYgQ8j/nG7QRI6yPBRMRiNvRnx0Ph3O8Sv1EdE18x3LG/fRIsJfuoYhrmoeKFD
         vWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014076; x=1795618876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sBpkM+D4ceLLEoj6PwfftKKY79vNaotRYiVwEiHUE9Q=;
        b=z25ujMjiQSDcgqLlduyiWPj986+rBI8wxN/PPYQdqORWrOmvbOdzDMRgJmhGrtzUWY
         CLuSKvD2BqQ+EkTvNgjzbaQHMO9aoNr2Lg83cm4YkblZP5U/tnJsKuNP0GyRFxkuVTha
         V4btLblDzhIKqsY6Bpm9SatKtCTLh4bb+wALNuYO/5SA4jOQ7eDXssUdAdLNa+23AXzv
         kuzSr3b0Yw8h6177MH5wp662D4uCzLhWQ4Pqzbphp2V+dCGpewsbgkFIqPj1CVv0OEm5
         LEC6SAh4lyBZTfslJ1p5VfT96iAbJ3H67RiHzHyvydvfVa8DoMRLG4K+MhK9i9HDYqtX
         DWGQ==
X-Forwarded-Encrypted: i=1; AL+hErHYffOTFvx15L02Mm5pT9sdGlPzAuqs29JO937gPTIr4mvMUjEvzRks66DRRD73IS0ueAmZC4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A8zfUYJgEtQxki8uOULxMvAYtMD5N7Ki5thVfgfm4U1L7Kkl/
	ONnhb/VdOiNg3lwuV4s4DVkxcYCVluOqlxBZe3KXqtV37l3m+mRNP2nbbjDKgeBNUWnJlTD4o99
	5WVvp
X-Gm-Gg: AZFdTZdWkiQon07FTKKwdo2Row+C4aw1t+hJ7wyLDo5h/D2AO2ns/kDGnCsDneh+po5
	JREikPob9B3kkghLFNtKfSHA+H88lukneUdX53xvZ9F9qMSkCPnAKovjKZIALfR2tnHiWfJooyg
	sWHAkQ1Tj8tWK0qiu57itc+a1Xftk3v/gS+8PONCE78ouPvJgdHpxolIScFg7Mg7dzO61mQieo3
	oKt0WX4OAdnc2GsoEsSO0+b2kkUAFqBotx/rNHTI7VN7kIXQqs5cym+Su6oxzEMuTAkg8davbww
	XYKLbKb0/QMvMLuH8dLc6YF9XWgVFIsCuUIezk8Xq4Y+7aYrzxmAzigXdlUMvU0ZuctEI3M2Wan
	wv3+rImfLtqhS4RPIz4eWzoVX79dtiXKwFFwcKJu6bqA5u5TQ3ojY9sI4X3qGakyc1uZqUPzHBW
	pC1vJS9nLrh/vzyNZCZM04oB/k0A6asnMAN0A7PxHzHOZ7WefNz2hL5I7Xe+rs4X5W4Pwwva1XT
	Rj9atW+uKbphOvlZvd/TFuI7ij9UDraEWgbfamZZm7POhzZlpQLhavrDTMLV26dNaJbNCa9vsNQ
	xIQlFO6B2q61rjvRpRt1AodIJ9m1RrV8D57RNn7ExiPAx8rf70vCURuVPwQibjY=
X-Received: by 2002:a17:90b:2808:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b3d07b9f0fmr1702969a91.14.1795014075822;
        Wed, 18 Nov 2026 07:01:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:9::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2cca15sm9541029a91.11.2026.11.18.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:01:14 -0800 (PST)
Date: Wed, 18 Nov 2026 07:01:14 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
Subject: Re: [PATCH net-next 6/6] eth: bnxt_en: restart Rx queues when their
 IRQ moves to another NUMA node
Message-ID: <av29unVgzwNa4T+b@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-7-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118023905.3050661-7-kuba@kernel.org>

On Tue, Nov 17, 2026 at 06:39:05PM -0800, Jakub Kicinski wrote:
> Rx queue memory is allocated on the node of the CPU servicing the queue
> when the device is opened. On a running device it only follows IRQ
> affinity changes if TPH is enabled, as a side effect of the queue
> restart which applies the new TPH Steering Tag.
> 
> Schedule the affinity update work whenever the device supports the
> queue API, not just when TPH Steering Tag changed. Queue restart places
> all the memory it reallocates, other than the ring page tables, on
> the page pool's node, so compare the page pool's nid to decide if
> the queue has to move.
> 
> Since we need queue state of the currently allocated queue to compare
> nid - check that the device is still up after errors.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 46 ++++++++++++++---------
>  2 files changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 134b24842c4f..5f4a8db1f8b5 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -11931,18 +11931,17 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
>  	}
>  #endif
>  
> -	if (!irq->bp->tph_mode)
> +	/* Only Rx queues can be restarted to follow the IRQ */
> +	if (!BNXT_SUPPORTS_QUEUE_API(irq->bp) ||
> +	    irq->ring_nr >= irq->bp->rx_nr_rings)
>  		return;
>  
> -	if (irq->ring_nr >= irq->bp->rx_nr_rings)
> -		return;
> +	if (irq->bp->tph_mode &&
> +	    !pcie_tph_get_cpu_st(irq->bp->pdev, TPH_MEM_TYPE_VM,
> +				 cpumask_first(mask), &tag))

nit: this one is tough. i feel like this is super dense when wrapped this way,
but i am not sure if there is any way to avoid this without making the code
uglier.

Reviewed-by: Joe Damato <joe@dama.to>
