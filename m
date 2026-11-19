Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090787;
	b=b+eG7BDyU5ahiLLfKq6erQaY+kje+cx4iWu/KEq1RWNUN1vGRdlII/+oG2THmXiNQUf4
	 bYgmohaDLq2neo6L+1/dgmlDuVHM5SdGwja+x2bzZqj0jSaDuHZfE+Bg5w97Ns9YqatLE
	 LR2JLDi5D2uOxk7O7aTQxg2/5o2ITgf0l5wseAaREJvIlPaIY9z2hR6YLfOWkaP+bCjnB
	 6xj+WrUyQtOtShyKAZGlAJo0wPDddV2xOb2PRkcncnF93McFuHtwELlfjLYZuNBlzyoYj
	 P0vLh4U3za9q5mjWmKagsR0cw4JEOJROS5GmHJDg5aPHPch1tp6eWcsIFPcEpOWOrgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090787;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F/ck0G4nuRK44u6zQy40hDmKFJGNm82vzkxFU2J3CdU=;
	b=c6PQZhgIAcpA06k+oZ/S+CBZW+PzEhILqLvEaHtC8yytD7AT0QNo5jLHrkfmvBKPqWut
	 HiNjD5IRCyrSvksS+XtHiQteJ/PFfy3WmUpnQE/J8F2GiFsV8twlrWkIjHqFTBr1hNu0T
	 ybykAYORa5LZ2eR8VPxsFR1sFiWKGi4W8sQ+J5aRQ4mixRVTtTPk1Muvbj3iy2WFapL4f
	 f3a2TQ91XAK0sc2+R5Ffs1ffFpXKwZOqjs2hWXoxOVBtNRlIruFjp+xQVuv0xc1nuWliU
	 ahvnoQjFexVKwIpnK/OrjgSEAIOHIiallECtMIxJdgKcZUBDitFX0urJcdZ25Xioo+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXtgxIqj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WmARy1v5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEA606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXtgxIqj;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WmARy1v5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795090785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/ck0G4nuRK44u6zQy40hDmKFJGNm82vzkxFU2J3CdU=;
	b=iXtgxIqjnE56v7nZDUxdNrzqlphwPvAYpUkQbHH58/hFFYVMbFBq9d1W/jvoSrCgVm4SjP
	O1eCS6JISj+acB7kNT08W7KU4awS14RCUJH8lcTQHrEd8ap+RKwhD4oODhgu7GrK1/UK+3
	Ge6TjbcS3ydM04XPOqqnY1D6WPZAg4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-0ceBZd1pOcqB2VK9A01AGg-1; Thu, 19 Nov 2026 07:19:44 -0500
X-MC-Unique: 0ceBZd1pOcqB2VK9A01AGg-1
X-Mimecast-MFC-AGG-ID: 0ceBZd1pOcqB2VK9A01AGg_1795090783
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4aa0500c979so283429f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795090783; x=1795695583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/ck0G4nuRK44u6zQy40hDmKFJGNm82vzkxFU2J3CdU=;
        b=WmARy1v5tRDuZXjqlcdDhRpY3dL3ZnVNInsryw01LAkE/ikLFi8n6lCom3lfbC35OF
         Ntb/zAfeLohMF+GuDVwPT6Uk2WWAEXbTeNPRmaJSqPwsraXH8hKcWkXi/JrVsyYpez+A
         NlfxuizY/Cwq8gTtqDhZRA0nEAh3FbIy9Xt/y6LNNiUn9Wp1XhonRU0QUZ1yZOd70yaG
         4lo0WjRHM4BR408XWg7o+9qTMFT2nNX7g5fIE5ZrKprKJfmT1lrQA4Mn/Qh3EmArHP+H
         /VZXVI2Y/1btlr6XrwYpOjDuFLnwvPEn4ht7cke/EwMCnWJgB58wnVZINGJ14sJgeBYL
         QdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090783; x=1795695583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/ck0G4nuRK44u6zQy40hDmKFJGNm82vzkxFU2J3CdU=;
        b=lx4nlpXWSGKZMDDgPE6+6uc1771TvTx+b7hPOp8Np63VEgnc0UEEzS61SDvW+8Zxvv
         wzEOYBbVGs2jStYWnKdVs3BYRKd3eBhd8cUQB63vSAHTaoLCoN2KBdUwRkFSoEyW/jiC
         ICjTSNWbDbl/rbIvXpJYD+CmHYVpKlk2X8DboPJynzUE0DjetvfqLQEb5BmeuveEktsE
         OU4eAp90srRSrvSNCLdJhm4kjST+HJupgdnSOBcMLd10n9CNEtttioelFCgmydFZzLRH
         xnsBI8b3Tyhbef1C/ZKwb4j2DCpV0RqyHd36zzB9seGN0ZntbSErPs7dgObm4u7gEAQP
         g3Mw==
X-Forwarded-Encrypted: i=1; AL+hErGNisO1Lgb4pal4tLn3woy5FfcsTYcjSKAOSYvFbSACX4ip/+R5BK7Kj2TgqZDML8KXXzGh+Go=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9IVnDFRpjWCt5tLDkSlg9s5C+l2IsAEYOOvV5YhSp7YfryfGd
	pc+WH1/jZjEUkmmXwTVRTXphqtAzMvXr878Ji1IuKhyMqOeZrgq9JHvSUeZcR2iDiXZayOVNslx
	TgJbW8Wm/D94yOqT3rZMJ0j8m0uzneX0AKnhyfgnbZjqH4sR5prDsZcgwhQ==
X-Gm-Gg: AZFdTZejPmAxq7Dia5FPU5MLo1PeDa9sVC0XAPnuNv45YVSabjKn3J/pRh6h862A2z/
	A7+YiU3DmaBEv/d8e81viBCjPQW/UQXumXR/4QC7DCzRaRnUQ2byS0/VodN4Z7i8vdNyG9xOW09
	4Hd3odpVpe5/2brg0twfDuxA+f7DBDMVk3WfksxKUO7PWiRpJrHgRFOGsmsawVxQrbzUXO3zo9j
	HK9g2eEKLY7b95gFwUYbjm7d0tAaNaCQdIEu8qQ8vjL9eWijmxzBr/pJQn7EomDfsrnBoGFCaF9
	ElAYcHzeIUdeZDDmZAJlphgBAmWOsLcWpKWZ1foZUCjfVMVmKfnH44DsFbVS5n2pW8qgplEnJMg
	h/rAPfQCA5ufs9mSUDlm4wGKbrL4kHHSJNohJ1bExciRQru3b5Qe2gmdW91zKu/PZglIA+ltMEp
	mfr5nMK+cF+FnzKIqFtnN3f1V4Qgsea+xAJsQkaksmcWnJ
X-Received: by 2002:a05:6000:2f85:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4a63947578dmr12956048f8f.15.1795090783136;
        Thu, 19 Nov 2026 04:19:43 -0800 (PST)
X-Received: by 2002:a05:6000:2f85:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4a63947578dmr12955978f8f.15.1795090782552;
        Thu, 19 Nov 2026 04:19:42 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656a28b8esm10682615f8f.50.2026.11.19.04.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:19:42 -0800 (PST)
Message-ID: <bfbb9944-a2e2-4a8d-b6d4-a99cf444e683@redhat.com>
Date: Thu, 19 Nov 2026 13:19:40 +0100
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
Subject: Re: [PATCH net v2 4/5] tcp: clamp the samples in tcp_rcv_rtt_update()
To: Chris Mason <mason@kernel.org>, edumazet@kernel.org
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
 kuba@kernel.org, horms@kernel.org, willemb@google.com, josef@toxicpanda.com,
 netdev@vger.kernel.org, netdev-bot+sashiko@kernel.org
References: <20261118155144.18393-5-mason@kernel.org>
 <179502618349.3136.1063676165373741119@kernel.org>
 <37e80ec6-d2f6-4683-9d6f-4e9c959564c5@slotsi13m47>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <37e80ec6-d2f6-4683-9d6f-4e9c959564c5@slotsi13m47>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 19:48, Chris Mason wrote:
> On Wed, 18 Nov 2026 18:23:03 +0000, netdev-bot+sashiko@kernel.org wrote:
>> [Severity: High]
>> Can a long window-fill time still wrap before it gets to this clamp?
> 
> tcp_stamp_us_delta() narrows the delta to u32 first, so from 4295 s
> on the clamp sees what is left of it. Your 4300 s example is right.
> 
> It takes a flow that needs more than 71 minutes to fill one receive
> window, so I don't think it's as bad as High, but the changelog says the
> patch covers both callers and for this one that isn't true yet.
> 
>> Would it be better to clamp the 64-bit delta in tcp_rcv_rtt_measure()
>> before it is narrowed to u32?
> 
> Yes, so I can spin a v3 with this change, or make a follow up, I'll defer to
> netdev maintainers:
> 
> -	delta_us = tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
> +	/* Clamp the delta before it is narrowed to u32. */
> +	delta_us = min_t(u64, tp->tcp_mstamp - tp->rcv_rtt_est.time,
> +			 TCP_RTT_MAX_US);
I think a follow-up is the preferred option  here.

/P

