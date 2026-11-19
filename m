Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080211;
	b=tZrRQt/6VeJUyvuClj6LYylXy4lJF4yAn9loZMvciFtoeCOZVssdeCOJ+qHiSqTWoZVd
	 u30iv0KrMHYrMtnMgfBLddu6L3oY2I8wYdE7ysqbapir0rbAkk33JsnKfTLmcLmjngAYJ
	 90Xk+KZj4lhpYUIDYovGRS9Hu8Hd2PklHdsZ1pC008UK8byLmKh+O4XkmjV57L1ySYeUb
	 wugmXZLSGAM1Suf0KRtoSHxPlthzfec1INUU31DysttlNNnUqRIS7O2uyzOvtfbaWx/YO
	 WCUtNunD1TpvLh0CIJv5D39fNB8vwjLXn7nx7qm9uTkIqPuZr1qvQhyVacCBYmpaI9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080211;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i3AXkyaf1e5SR4bn6j5cyytF9T1CSV8eUCUoZvRMjzQ=;
	b=lQ5Ox9tl7olsQ344QwMU2O9fJUo5WfP37TtsxdsARgeyLmHMw+V3o4GMzsebMeGYNvE3
	 I8xSYCScbIN/5cNsftN4+3TUXTW2tiB+xnDcFSRWVv2aHZSJIqDd8ALmaxvUgLd16kyF+
	 ojWnIgjpRZVDobZ3rkLrMY7Qr1otCxhJZBJ/5kqODMLrQUc54twn/tV2l8Ru2VvnyZatp
	 2BVHTm5b8SmSKHAABYmPdq63Nf8gD77Pdbbmid6/S/2WelsTHhYkrV5QaeoMT+wNm6Tt3
	 AIr8GHt4/zG4n6FRipfsvqxgL2dcgLqnl+xSx5/avBLAR+KgPuhxZkhs2pulsL0bjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OW8Omu97;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UHrii6lp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23EE606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23EE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OW8Omu97;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UHrii6lp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3AXkyaf1e5SR4bn6j5cyytF9T1CSV8eUCUoZvRMjzQ=;
	b=OW8Omu97GHUGKXccyL1Cu8Pk+HDRkY3QkEOhpyzGRkZ7jpRrLncO9zt+DP8hmZL54yA1DF
	EiBORqGomfyHVOwbWNZNLQxlLQFjOtXYD5+MOYYROP3cqgMEnV7HQ0znFkxq3UrRnKqoZV
	OLz/NCE3ZKLuI/PhMmgg2JNKP3GYnII=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-li6x0DoFNoCMuETtDsrwtg-1; Thu, 19 Nov 2026 09:23:28 +0000
X-MC-Unique: li6x0DoFNoCMuETtDsrwtg-1
X-Mimecast-MFC-AGG-ID: li6x0DoFNoCMuETtDsrwtg_1795080207
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb67b2c00cso3047145e9.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795080207; x=1795685007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3AXkyaf1e5SR4bn6j5cyytF9T1CSV8eUCUoZvRMjzQ=;
        b=UHrii6lp038Y7/7ShgnRk+ov4qUDBE7WJOQfnkgmQtmWsjPGbCcoOx+vXwXJ6lTOd9
         1MiCv2BY+1sA/MiU4tWhZfugURfR9ux0xFDkmWSuZ1dD4+rc67YYu0d/NsPKe43ewKkH
         GzlrdGf4Ej2r+KO6tBE5+xMwfsciegj/5b9URAgJm8rFGPBWd4TESHs2HLQhY2vZ6YUK
         YKe7e1T0km7iVzbuSd9cg8C+Lgis08OKbyuc9wcrvPuzi+hkP2ZrjbZCWW6v7kTi2dNJ
         01I0P2mTDX6uqrKq0yKwd9Mdah6Au+/iBw4xwBBz7yI18xEXaXaMlyBk7LO0RsVprfO5
         kPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080207; x=1795685007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3AXkyaf1e5SR4bn6j5cyytF9T1CSV8eUCUoZvRMjzQ=;
        b=tsZwHf1luNKlgrm+/pjlWbReRCpeZY65XPGDJXnAxYvBo17SUmc2ye2LpX2N+5nspH
         dkd6wmTSVdI1iU6oA6yJXo5YzNOqhPEX9cKC71ShzcfLd6+0B8gcHaM5XSNNAun5/DSE
         jUpxgS170YcoscENwmqGrp3ODgLmxLuSAKDtmJh4bkU/frmz8GdKJK/KbkVYIC5BJyPn
         ydkPueQXGoXCxXtDJ1hyyGm6vm7jW6QAMdOgrcsud7RCmMDTqJefTvTHyOELioM7+WqI
         9jrnudsqLoyflmbrRwO9LAgkgSBya8lvPKgKpwYoa72X9A1RRjnlitABoHvRTstVexuL
         jbcA==
X-Forwarded-Encrypted: i=1; AL+hErGvZr8a72V4vkwjxMzwWYmQT7pbBAnpuYSgNrcmFriW8EVw8TDTl+PbB+MTMIRBnfOnJYZqqxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sAf1IhzvNMfrGRZODkk8dQE2bT+wrQqaQdLAhqYcIeMaZnngS
	0v/nTZQMbpSJdt28SY0CZu9+ailABCVdWIbKBlRNt0niEJInHMUQCB5qU+KL87Q/x11t570hPnP
	R6svEmGoFOwJEk/Jp+MxTleMH31pfoV2P8KjvOrma3nyY5Vo8R7V22TvO2Q==
X-Gm-Gg: AYBFou04NOaE6r/UloP8tlsJ823GN7NdkPqNCfisdULnBRuIbY2HjAMIoHmC4L83vWv
	vKEET6P+5P78a0agYMCeMJabsK2Y1i+UcuMPtxQYh4SIuBjVDzw5YkMZ1mS8YXwdTU7t91TirUR
	Jx6k+1CwpOjDQZwrY6s8f/Stzx1QpG+YBlcZgikEVwsQcFJK0hI4iK1ScwZJWnqQ6dXuEA/vKBc
	4lm2Jcu5KEqM04DGdaoXTVVhEYyeBGtO1nUlhCa9SaQWtdMSQHM9JNtCUoM3HVT8U/ZTRSfnc2R
	r/eOAn4Ltl+uAjQ3sprO87mfTsK7SkT6ihD/j8KvjWmq4A10hvAgqY+bpUYQFScrr7o6oqyYhgd
	3hT6rhnFjlYrTaaSn72ZEyuF/6K6Js8hXS6AUmwmcmwrsxSTx8HRH2EWxGVT5t4DdMIz8TzK/hF
	Q4UntrrqVqCbceQFsGc6LQoMMSoraM8JxeDykytPtp59dy
X-Received: by 2002:a05:600c:c16e:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb86109c24mr11729755e9.9.1795080206962;
        Thu, 19 Nov 2026 01:23:26 -0800 (PST)
X-Received: by 2002:a05:600c:c16e:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb86109c24mr11729215e9.9.1795080206449;
        Thu, 19 Nov 2026 01:23:26 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8532f08dsm22506055e9.2.2026.11.19.01.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:23:26 -0800 (PST)
Message-ID: <83fb9e03-3c37-4c7e-92b1-0eff6e7384cc@redhat.com>
Date: Thu, 19 Nov 2026 10:23:24 +0100
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
Subject: Re: [PATCH net-next 1/4] net: skbuff: don't clone a nested frag_list
 member
To: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org
References: <20261113-b4-skb-segment-clone-fixes-v1-0-f777fb06f3e7@toxicpanda.com>
 <20261113-b4-skb-segment-clone-fixes-v1-1-f777fb06f3e7@toxicpanda.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261113-b4-skb-segment-clone-fixes-v1-1-f777fb06f3e7@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 01:21, Josef Bacik wrote:
> skb_segment() clones a frag_list member whose linear part fills the
> segment.  pskb_trim() drops a nested frag_list from the clone, and the
> walk moves on to the next member while head_skb->len still counts the
> nested bytes.
> 
> With SG the walk then runs out of members and the segmentation fails.
> Without SG the segments that aren't clones are copied out of head_skb by
> offset, so the nested bytes are dropped and a later member goes out
> twice.  Take a gso_size of 1000, a head of 1000 bytes, a member A of
> 1000 bytes with a nested frag_list of 1000, a member B of 1000 bytes,
> and a member C with 200 linear bytes and a frag of 100.  The segments
> come out as head, A, B, B, C.  Without C this was a NULL pointer
> dereference before commit e447e46ce976 ("net: skbuff: don't run off
> frag_list in skb_segment()"), and B goes out twice since then.
> 
> Don't clone a member that has a frag_list.  Without SG the segment is
> then copied by offset, and the copy recurses into the nested frag_list.
> With SG the segmentation still fails with -EINVAL.  Nothing in the tree
> is known to build such an skb.

If nothing builds the problematic layout, this feels like defensive
programming, and we should avoid it.

/P

