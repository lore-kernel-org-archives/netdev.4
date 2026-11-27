Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777506;
	b=4mEa84tTbedyCy8olMyMdklmI2WI+lPrUEEm+Y6KNe/6eWrYVlOxvWz5CayRJRYDKkwu
	 P4lnvQwPJ5dys2CADClRsGIy/VS0YpEA+mZ6vLvE2t7LOesn+TpUrRbmgwynFvf+ajtoC
	 4KsG7Ki/ZYMASzKOLteQV+k++haTanLE6IdOxF3rRGUT9yGK75MvcCpGB/Xn8KtEQfzYJ
	 jDTwaZpguLm3VY18tjfGG/9p+nhdoTa/4lrVLDJsy4t3NfvJIZltZsGjJ0vwFa5rTG5kI
	 j3TRY2HRNWhPqSjkVO5R+6brxMTgDJYASUofHUKpf1H7vLp7XkEl8vpVdwjQt3tuasQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777506;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=CkQJx+ehJaU/y4ciXKNsJ5PNW3DhlMkrAeAcsjEhzRkoRIqxFbfD/2CrpNv/h7LaRPuV
	 xYnsv/syVrWsl8zZ6ENBOzEqWsENWFY1O+9qR1sjy2rAYQNhRaW2xpcHLofPMnYpDmkS/
	 k+1xULX+fhr3lkwk12D0zfw6pQONm7dDHC+3aeqjLyFCyHb60MjV6xLGgPpHZz3XxMStF
	 TyLS7D+gcz1gs29Wd8VcFoJazZVHAN/oG7H3ogDQc38yVWuo+GBxsV5bn3VSDHgiKVCNe
	 H9QglphHcI0nwd2rDJYSiRo+oeiYJ2bvGlYYk3YcLigTFhbRNvLY3fPW3Dvc5qp/blQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs1q28KR;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="m1/rciBR";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0392606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0392606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs1q28KR;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m1/rciBR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795777504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=Bs1q28KRG+Q+EutZdVt1HQ5lRo5QWfQAf6QBol5yH1DOebcRFcZbeXeUZymFwSIUbK4S2Y
	ORgat4tyec+fTmHLO1BN6WkSDqp5wTBm8oJWMo61G5jtFxxGiUH3cRJ3IaxBhyJQnFxvGK
	s5XLa6qZHfhiy+e4253lK7WJGq5cWpk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-ssvKtu9yM7Kk6slrKOY4HQ-1; Fri, 27 Nov 2026 11:05:02 +0000
X-MC-Unique: ssvKtu9yM7Kk6slrKOY4HQ-1
X-Mimecast-MFC-AGG-ID: ssvKtu9yM7Kk6slrKOY4HQ_1795777501
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so4820927f8f.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795777501; x=1796382301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
        b=m1/rciBRUKbiNZLc56oAE0Djpvd9OQ7EBzCR3KWb7A7zRKLr05+HordNZL+9k1uZpb
         M2/PLpHqTgLow3ARGAy/Aa+QoyRhE+IXHX0fE/tQ46S8vhDbdmICmTwxAyf3NLI9mDZ3
         QlHUkKEVMvk/4J/twgIkvcZoVBtaVwfU9xRNm/djfEZxzCP7RUtQdXI31wlCWe3LwUtn
         +1/78g0UWq5oTKFgDIbKx6Sdqo2ngC/XlOtbQfWVeazjPAry42ZyzKt3o20MPd2+WbrG
         Sk+v1StbHx1PG1wKsQwkOK1mfx35uCj0CXEvnSHcsaOYmYlnWvgL8lN5ITkVhYEcmPLs
         fa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777501; x=1796382301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
        b=VCTbmXH+ehJ5TARjvehjszaC1E+OQcTmPaW3pDwRfiUFdhJOD2Jnmkgy4zvsodcbbd
         njYPTpGC8rLg1ubzdr2N6sAMICgHXZCvMzTosQUIfWLkovQ+n0JAo6he8n0gBfKNogsJ
         CQGo/ATc9Peb2YzAi9aB7BliwJuyfE7yH+/Ic6BePyDqaKRRSy6bJBxMjxOK/O84DbaQ
         58j56Ad5lFdttuz65hzG1J1vt5B0L9RQkW50IodA3XjlU896f+1G5Eutaoec2kMHL9Pt
         ynV7ldgMdnLkSaWoYk2vw94K8ors0J5p+Ews/9zLXCgGFfnE0bBvEzYXUdvW+m/jOX6I
         zU9Q==
X-Forwarded-Encrypted: i=1; AL+hErGd8cqt6ymS/1Nc0Q+JXq5IUrCoiSxKCu7HRb7PII6SLLUHExZzM3oSZgmaW7eX0YMb7BeamjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xy7hyPjIH64y0vNYYagFH5Joo5j3K9Lv4J9vEIpqOGUJ+vNMs
	6LENJCkyNE4cQ0+btXixRwzXuBphb9Cqtlm+M6RrC2wWyoXeHt7wqfrK98krvuFHPCYfB7UtOYE
	iOJmaqG6ipmcVb475VSZVg+O3XnigGBuaJnnB9FLnJFx6WDipYEV/F3uKmw==
X-Gm-Gg: AZFdTZdUl13XbHgfcbEIiWc50XAas0UmXzG3c9LH0y1g+JyXE6muoa5oWdDqltd0DPB
	3QaMQw9cSY8ZfkNX1fphL20LVeHorfAN+R3fzEfx9HBzazx/WKm1Oi/b5QfxY1mQ1y6ov5s8OMQ
	+R6W9WQgE0cdAvmWEViDKLtdj9bej+yz/l4Gr+Vli/z87iWhVhMZVZostwGlwzPMnnNpF6UlwKA
	AsqZ/WkSN4hFdqcVjEyj9w3YXcxJpwtL90oItx8FBTBAbTw3/SPF3aDbz4TxExPxY0Wuitst8JQ
	XvXfhENpiMxE/mTFeJx5EUb1bSClWbzkaK5ZhN5EpyIbH7sE0RErxVJwXovtHGJYoFXfXH2/7qd
	0KRXSp3fPwhdfAW6kjZxwKOmYsf43rTmqMEU9M87LyDVboF8/YrC0f594OlFDfOBFjnkqo7f2uo
	Y+y16YJu+wO+bgQ3QC0VhUXYy2Ni1N+O9H/paV5ZJ3VtVp
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599206f8f.36.1795777500986;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599159f8f.36.1795777500541;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm46514173f8f.51.2026.11.27.03.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Message-ID: <fa61e083-d6c0-40d2-b25a-f83cad368397@redhat.com>
Date: Fri, 27 Nov 2026 12:04:58 +0100
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
Subject: Re: [PATCH v8 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
To: wei.fang@oss.nxp.com, xiaoning.wang@nxp.com, andrew@lunn.ch,
 olteanv@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk
Cc: wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
 <20261119030534.1892935-9-wei.fang@oss.nxp.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119030534.1892935-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 04:05, wei.fang@oss.nxp.com wrote:
> +static void netc_port_tstamp_timeout_work(struct work_struct *work)
> +{
> +	struct netc_port *np = container_of(work, struct netc_port,
> +					    tstamp_timeout_work.work);
> +	struct sk_buff_head free_list;
> +	struct sk_buff *skb, *skb_tmp;
> +
> +	__skb_queue_head_init(&free_list);
> +
> +	spin_lock_bh(&np->tstamp_lock);
> +	skb_queue_walk_safe(&np->tstamp_queue, skb, skb_tmp) {
> +		if (time_is_after_jiffies64(NETC_SKB_CB(skb)->ptp_tx_time +
> +					    NETC_TSTAMP_TIMEOUT))
> +			continue;

Not a blocker, but I think that starting from the tail would be better:
the loop can be stop as soon as non expired skb is seen.

In the hopefully common scenario of no timeouts, the worker will peek
a single skb, instead of traversing a possibly long list.

Can be a follow-up.

/P

