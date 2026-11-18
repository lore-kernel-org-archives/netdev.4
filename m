Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012955;
	b=eP4bHcoDlL2uQ0pmEoR+Lzr6tg0ei9P/P2s2qM1F6X67UAcx8QVgb+CkYHUSEgIJx8Uy
	 wjM5/I/hXREXH7DXpxWzaEIa/OYlm9eqO4iPt18pUHzEK0zbazidayXNL5D7IPMNIXscy
	 bDESTs5ByYTsYU89T+m49qr403xfctd+f3WaWOIWGLYWSq5gM2WmiADmxcd2N6HXxHKtS
	 tS2B/8yhpOLrhvr4MqLHcfTgoUfWGeFDHGUzX/FV05Eeg9egaMk4s0n8IkEegk+jOJAYT
	 3j4bMYacP1mipgo6zTwLR6eTT277rml1HORkD+ZNWf9mwBykB6bOBIiDhv6jxezJW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/cLRMxbcZeO/SqyL/RQeAZOnyTNEeCzqABjXH/+JMb4=;
	b=U4Nwx4VgRA68vazQjuK8Juucyu7zQtju1PmWCq+0FPb6XKnl39s2YhNsE43+JRDTELzC
	 CgbSKjjBha2Uj86fhGOIEk9Jd305rlBsib/yLSta7a4AfYbYfEcMCK3QBiP7yTFvXLJun
	 T3kW382AgZyrTymCSXGUngL/nJraghM39/DtfdcZ+qWKOGh/x3IqCJJAuyD/YtzUKDkoW
	 K7KmKVTvXtTEdu+siLOhiVosRpQXYCVEE2Hzo2EQQfib5NECxKp5FFHqm6iv9I0lOj6fS
	 QLRx5mvcbGapJ78GaeULKqh7/hWi1nlsRjyqAv5y4249u72BEoYcR4XehBxBvSl+AMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jCU0ATXL;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A288606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A288606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jCU0ATXL
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efd659464fso4030515ad.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795012954; x=1795617754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cLRMxbcZeO/SqyL/RQeAZOnyTNEeCzqABjXH/+JMb4=;
        b=jCU0ATXLrGcs2ptpqCaqN05FZc0aPUpxqJa4T8NRWql45E5uguMych1qnqEKtEJT5L
         F1Ro+O6VyGHSdZyMxm1FLmyjcCWOjd6SEGjB5xxAkmSmgsTIldNsWDZmLIy27u/jtgEg
         eflMR7jh4eQrdM/1cf+2ywX32It9piROefKwFlZ6HwwqeUsNimUCYTVfZzRploFQN2vn
         iiYjsckhqa3CNg3FcmWDeYO07xJ9qjGoXbhOGWDNNm6Lf2+Q+3iQXfpwVtasMs1s2DBx
         fxlzSHwwNwYsB0hyxPyCSdGCiQ+G9Wn3zebN2rGsSy1jN6dYE4UtHt9SPLCBt2GEX9Ef
         7XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012954; x=1795617754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/cLRMxbcZeO/SqyL/RQeAZOnyTNEeCzqABjXH/+JMb4=;
        b=ZNbOMNA/smapOGTggMv1mSBARIvDhr1pCjQtUBjQO3jqVxfNrfHH7Mv8o2x/wsEH53
         5YRcGtEFVBTkslaHDxRGIT6xh7BklMHXmaJK9FRD/l/KFPk7ip0XGD6itLRXg49kSD27
         elwLzD19P/7hPMTkJRvZFz34qM6ttOOHfmIFD+UKkhZXVlyfUbRndhi9h7f5xW6AlC2c
         30RBjV8wlnBMk6sPXcThCWQR38oKb7LGFOoNCktMJrP5AizE26zv27AQTp0eyrpooqPV
         IiP24g5RkjYOik8aPQnQPWaIb1gOKMrwxr1ia6MK5d7ZYfmDYc8S7Mnq0bNuLb4RN2Nj
         HOcQ==
X-Forwarded-Encrypted: i=1; AL+hErE8ZqTSgV6er7pGHUvozlHHEkjnx4KUckm6dihL1WFOvl7W+cZ90p6b8lcO77VxuIvoW0C0X8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nVtxl4q9y8iGkRyLYPp4xVAqCtTK7DJDrgcPo8gGtssPJVO7T
	veP3qtJlGUEVY8BuldRRXxy2VWBVncx/KM/7KrmKkWKesbAL5qt3NhZo/6Kd/ZvZCEg=
X-Gm-Gg: AZFdTZeitIkoreq0J3b3CZ2Sdjxy7NqXJItPLKW/oFHpr0jubwvj5XLWWAujw4G0shI
	y2I/H+8uZvJN1c3Py0UAZPyX2Ywm7FYltyov+Aba9UJyJbgnBgKZvv2bGBTt3HS+7EgY4jdz+TB
	Ta4Wgxlq1y9edOhHWKziyEN9YVuJ7Z4onLtG3Jf43qN0ZyYCo/oToXZheTrolGiyYBt3AIiPXc8
	1qdzkcJVcNI+OnPCwYto0+JdW95GpxKqDLRX6EYD5SaaTrz6cGsbEZbJGcMjh/+U6dccGrmHmW+
	zvTo0M/HN/UZdcw8FkRspywsKL5ybnfRCbYpZepkUh6Lw/IbhpWFuKYtFCRxM9/E0IUrbE9ydGM
	CpxFz4+2XnqPhaSVydD8PPoQnnx1Cj4iDwF3xavDIqtx9P3jnAx6ihrOlS3Z5Y2YTfH8YaxMRjt
	FMVXNGA9Kru9dn+7X80ifMgC/koHrWl1ego61UAbLCivWOR3oXrn58tBSs+EMDvguWmPnHbN0PK
	+2R24FMHGhPTXNl1Vb6ZuYgKMD0ypgCMWlBpjCtZ7fuV0rSM07ByioQOf0DCZ5Vh3qUObLaIoq5
	hlV2w68EpNDhop8zlYYdt1a1Uqg26UlFDkY4tuQ42NpC81BSr0R6kWlG7okZy+rd
X-Received: by 2002:a17:903:32c1:b0:2e9:79db:449c with SMTP id d9443c01a7336-2eff758e055mr25133075ad.47.1795012954274;
        Wed, 18 Nov 2026 06:42:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff623c968sm15323595ad.55.2026.11.18.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:42:33 -0800 (PST)
Date: Wed, 18 Nov 2026 06:42:32 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
Subject: Re: [PATCH net-next 2/6] eth: bnxt_en: follow explicitly set IRQ
 affinity when placing page pool
Message-ID: <av25WMsvk8hiJ9VO@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	michael.chan@broadcom.com, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	horms@kernel.org, pavan.chebbi@broadcom.com
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-3-kuba@kernel.org>
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
In-Reply-To: <20261118023905.3050661-3-kuba@kernel.org>

On Tue, Nov 17, 2026 at 06:39:01PM -0800, Jakub Kicinski wrote:
> The driver picks the NUMA node for each Rx ring's page pool with
> cpumask_local_spread() at open. IRQ affinity configured by the user
> is already recorded by the driver and persists across close/open
> cycles. Use it instead of cpumask_local_spread().
> 
> The affinity notifier runs without any of the locks held by
> the allocation paths, and copying a multi-word cpumask is not atomic.
> Like for the TPH Steering Tag, have the notifier compute the node
> (of the first online CPU in the mask) and publish it with WRITE_ONCE().
> 
> Queue restart (bnxt_queue_mem_alloc()) needs to resolve the NUMA
> node instead of copying the nid of the old page pool.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.h |  5 +++
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 48 +++++++++++++++++++----
>  2 files changed, 46 insertions(+), 7 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
