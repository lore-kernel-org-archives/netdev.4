Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514558;
	b=mIRGhu6MkrK5hTESqmdbGl962JTp2TdSW/E2Pm8hLmPlWTBMrWyMNvLgXWuoovyJeI3q
	 7gfNx1T8l25rWhtGtUrrUA8qHhTLzWGKyFfnNQiBP9/FviIcngwRVHlgF3JRP/v0KEVT/
	 Rn5stAKXb27y3FChHm2wkxFdGWLxYNq20xUSuezXhsuyMkgDjbE6I7YP+XkKujEZzTpHJ
	 hsnJTnq8o3wAOOkMCEmsWpSzJtO1pkmmVOh43FQPL+0402YxW9qwY5lM2+JvrGalZ6hNv
	 vwyi5oJt6YEBhFUtrvZoGrineGSnueoBLmp1p+ogYKfS4z5uNbrdNylxSM5h1t1Rspw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514558;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kYC3nDclTU++iCEu00r8ilR77hTAQu3xG5/0UeDTOes=;
	b=ZPypYUtNyxteGyK1qPoTEMhv5tWSpiXsN+0jn2wEWauO1ICcNwL0ph30u6FqB7pNsFVk
	 732OFV7tzURfASr76QmFc4u5OzlgwLSpU8EyewNK3CRt+kYQReCCS8VQWMvEFefRu7WZy
	 SCuzkFe56xKXqYWcX4y/dUUhZmXKGEjY2yg7yz2lMAyXXSwO/otqBMg8ZRWP4c6CaOqcT
	 +b2L655FcB5DlifABqqiEOEDyhDdJ+M9sRg9cQmDNVVWL2G/tu8XYEadTRZlfjsDf7mQt
	 l6daGFHTNIED+3ePYI2w2z2xRd/VjQT9mIb60UdfrAujBqvDQ5+TgpTfeBdsnozhuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN+mCw+Y;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=X3CcaHaA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D3606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966D3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cN+mCw+Y;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=X3CcaHaA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795514556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYC3nDclTU++iCEu00r8ilR77hTAQu3xG5/0UeDTOes=;
	b=cN+mCw+Yaf3ffMiNxpgC3NEJeVFoWR7pI2hKBqZMc4UeasiO1X0/S2loaWbiGJMlPSBe9i
	otOqypQK0NC7ELg0/tMOw98XK7G2HzoZPgsQ+BatI+s+Zf/++44lpe47j4a2Kf3DohpPVg
	yo3fxuvOnnJvVl+3ZmfMLVxOfoHl2b4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-Xn4os_ftMgOh6YVvYXyeaA-1; Tue, 24 Nov 2026 10:02:34 +0000
X-MC-Unique: Xn4os_ftMgOh6YVvYXyeaA-1
X-Mimecast-MFC-AGG-ID: Xn4os_ftMgOh6YVvYXyeaA_1795514553
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb8ae35aeaso35499445e9.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795514553; x=1796119353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYC3nDclTU++iCEu00r8ilR77hTAQu3xG5/0UeDTOes=;
        b=X3CcaHaAMp0bRfVLlV6WNVr8+viCTRrmBUelOGqI966bebxxY2kOI8SfLtWWX5uWrC
         50v//1Mufitsiq8om/VLS+2n5Je+uR4Pp3f+5bnUMf2tofuqDhlnpwcfTVp/Z0ncA/Yo
         Zs1T5Drp7qNWnxL1QsGH3FSTPOm/+h4zHe57H9OevJntTewldPmYNbbCJSc4yIp4MuML
         91o9G+jskj/YDoHXu8U1XJzesMIm+FKlwkYzWEYGgOEV7jCo76xW37oLVDXI+wrdfiEr
         UsrEefDpnxraUknAwTXHV80bkJfmZN5TSjDN/behvMZL3+ueFvfufaJuTbTgWhmsRlJP
         glxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514553; x=1796119353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYC3nDclTU++iCEu00r8ilR77hTAQu3xG5/0UeDTOes=;
        b=FxW8rETRJbdZrQIZ27rZxtNHCZDm4IN9eULvBssPn0EVMhZkBWX+/Pz0uQV7j1gcnO
         SFL5RaHIAPtyObc6oOdee5NBsp2HvtndzA9DWUyJ15CEKxrvnGv0dtqg/60VIbelpJt2
         sb5w8cbSCuhhDxuEEzupvCf5u0Fp1aRvSSy7MtbARWpt3XOGES6olOo0089C58WAhEnV
         R4BiF4nok03IPsjWL02cSz17hNtTGT+VerdRo5ueLeClipZVr7H5FP5iUiEmde/w3Fi/
         tnVCPDrqEbwtc0AkLbtR9D0ay1IX8fwTLoOzmzCubpq9a+iGU3QVs3LcEkV3UPG4fpH6
         uwZA==
X-Gm-Message-State: APuU4Z8tXcDDvMHNxPGxkW8oXYBy8vm+DgO9EWE78MUrs0fn923pLUv6
	WkGBJZ4t0RIHeKG35nK3CniDzfTL07N82euzMK2xbsZ2k3SQtasKOBOKf6BQA6zSU/R5+oIpLr3
	DaOCk8h+9O69QeTcZOfg68Zs7w+CSlHAaMqz2FDcUetaL0Is3uMoaAr0ofg==
X-Gm-Gg: AZFdTZfX3ljEPSveYYU2dICfKdvom2X79Mvunvr3izobgx+X1eH7uZuAZrLvnLwI9nE
	WZCaTAq1+WOJolAJCrfZ2SQxci6PmUqkS/jZgy3gGIK5Z5x/ArUlDYEH3Tmw3m3/WT/94p8XUnT
	N6nZnkj20jYgsvpLb+7xlSSNYVmIvnFacvIfJZoDsJK0poiVXnfZbEZdm+WRchQDXxbAIJJpHst
	Nqymt76DdZyrqrYYUvFtfhMEx32s+043dMjhXSUZHHTPAwO+ymyfFYLVyMp1icPczHzr3Jh6ETg
	k9Izh4uycOYyu7WuCRvPU8LazxFIQ6MXDfofgnNbum3P5J/Tt7bgYAjb/TMPE2zUIfMKy0ero/w
	YEox2fIlwes17JUueFlG/C9IGL5Bv2201THwSJ4nGOitRj6iQ9l0Q26c33luf4PpXAOnarYxcgA
	A/+xkKCtLeleV2cet9zDoVPR6L7GaKG33DHNwPWpfc1qP4
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr241277135e9.8.1795514553274;
        Tue, 24 Nov 2026 02:02:33 -0800 (PST)
X-Received: by 2002:a05:600d:1c:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb8c526ac4mr241276635e9.8.1795514552823;
        Tue, 24 Nov 2026 02:02:32 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm222653865e9.1.2026.11.24.02.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:02:32 -0800 (PST)
Message-ID: <3071ab77-670d-46d1-aa5b-f01274b5f7cf@redhat.com>
Date: Tue, 24 Nov 2026 11:02:31 +0100
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
Subject: Re: [PATCH net-next v2 7/7] eth: bnxt_en: restart Rx queues when
 their IRQ moves to another NUMA node
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, pavan.chebbi@broadcom.com, bjorn@kernel.org, joe@dama.to
References: <20261120035214.369158-1-kuba@kernel.org>
 <20261120035214.369158-8-kuba@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261120035214.369158-8-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 04:52, Jakub Kicinski wrote:
> Rx queue memory is allocated on the node of the CPU servicing the queue
> when the device is opened. On a running device it only follows IRQ
> affinity changes if TPH is enabled, as a side effect of the queue
> restart which applies the new TPH Steering Tag.
> 
> Schedule the affinity update work whenever the device supports the
> queue API, not just when TPH Steering Tag changed. Queue restart places
> all the memory it reallocates, other than the ring page tables, on
> the page pool's node, so compare the page pool's nid to decide if
> the queue has to move. Only consider queues whose IRQ affinity was set
> from the outside, so that moving one IRQ doesn't restart other queues
> just because CPU hotplug shifted our default spread.
> 
> Since we need queue state of the currently allocated queue to compare
> nid - check that the device is still up after errors.
> 
> Reviewed-by: Björn Töpel <bjorn@kernel.org>
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Sashiko feedback looks relevant.

On top of that, some systems (many?) have irqbalanced enabled by default,
and that will move around NIC irqs routinely (!!!). I'm wondering if it
make sense some flag private flag to make this behavior optional?

/P

