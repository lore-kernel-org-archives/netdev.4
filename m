Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080945;
	b=MbKPbB6406kmeaYAZNGSpjYLeKSZkXHskuiSxprN4xxHY1Ttx5+r6NvwrsTO4kBpkB97
	 cc5r5Vm3f8nDuk3ulUu+uq8Msqj+8UISrBPNsPQqt2a/VpUCROr5IoU1wqYwIVhDMSrFL
	 C4AVVKBAEo8bb3SO0BcnBR2OvSGnT3LXPYhMzTN1ZsJnXNiT6o0Tak/mCg04v2JTzYui5
	 KspTDpjFQ4MPOPQsYxtBpIY1Z2eYy5kCtOLinJVm2baYxgZZahay5kjMCHIQP9NncD3QI
	 fwHGwyE/38F5YT+EE/XepPgE6N6tmEVMJbneh/GeiWNsxhXRLmmwwEvQm70op/fsZ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080945;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=tgprmwRJvj+ffI7IR8oHc8XKPV4AIT1X7eYW+5GixEDQ4uJFl6653s6zu3f+Gqwvk8CJ
	 oGWqe9i5SWbeUrd0EqdxfQ5fYzjDHMfuTQnaKS2e5WEOIELN72n4Z5+epZu+MtYHBD5kb
	 XlCREce7IHkEM5DD/ksnGhafgfcId6XPSiDnrpPXfihVVBQz/Ap8Er4Z4swlAxexqPdpL
	 +qRZiB8YB3fa2BQ5SsHiASACektikAVXpotasTT4gqRdNvcJA4Kd3lJDeNUfPtQciy4g9
	 jmkaLXa85A3jedCjVMP/gTnDZW3REDFFOElCqD4djMXHCvthgUz/OUqhRuoRqHG7V4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="EQR5k/S5";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dSJBwNcU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41660A2601
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA41660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EQR5k/S5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dSJBwNcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
	b=EQR5k/S5gX9O2isyt9+JvCb312lvuQU3o+Tqp4+vCflfecSErAFIy3ykBo3xSvgGk7dPsT
	WtLZujzuVFLpnfLmbSdniorq0OACjUOdcLIFEz/ECXMSvzNp4wZQd8wSw/fRHMsunSPAJf
	JibFbSVVIP21JAtWnem5KUV1Mh1omDw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-HatKpz2QPrujLo6a9JqtIQ-1; Thu, 19 Nov 2026 04:35:42 -0500
X-MC-Unique: HatKpz2QPrujLo6a9JqtIQ-1
X-Mimecast-MFC-AGG-ID: HatKpz2QPrujLo6a9JqtIQ_1795080940
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4aa0500c979so186677f8f.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795080940; x=1795685740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=dSJBwNcUgfpqpqpcO00BqOgy6rn/27u4bSv3znU6NaisVn84/7OzU/9ig3OXS8+qsK
         qkKbiT4enLFnOOfvErU0mUGxO9SyqIicLhEdGhj161vtOw7rn06zu5zlfeN4M90uksHt
         BqdsSOZQ9+ChDM02orCwj2u0lN8u9SgDRjDOPlR2V8oX9zNrwJO8yCgUkeLrzbJGqLhe
         Gdo+aLVsRknjp/6HczOJxengWvca6cMc60CwN7kZnk2zIFWBWUiULNnSpqhanfL0AXUr
         uBGXqJNf4T4Ht1kz09UPFF3lpULA8QfuswA3BN77urak8D52Xy+IS+NFkuWseWi4Vwuk
         gtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080940; x=1795685740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOFWnryy22U8bQSzM6KdqLeAcd1quBBtSo308pXYk6c=;
        b=aM4BYAy2DvUeIRwwhVicsnk89zLlTPxhGoIoxunqERpUQfHcj5lD08/2Off61eo6Dz
         QFWmyQvOfpFpFf562LdkfKqhKrvfusmMkMAF96wcE9Mp22npHpAqLSQTEzBJme9TI5CV
         kDDg9iHzM65laGWa8Jt5jricZUSk44cN98q43oD+VIe1not135TYFcHt3aX5xd+djytU
         XB4bkokUHBUjyDTF9qZ6nYhEBWcm8Ngu0K1gdmN85VD3OYrPEoNeAhNWQJaXWb/0+ly8
         wB79QoUFBjVzqyhcNXYfHjAAzIZH32VRlDOdSdhw64Avt2Expwy+MuGZRbkytqcBFKd8
         KTHg==
X-Forwarded-Encrypted: i=1; AL+hErFDRsihKVR+iiFCUGOc5ACwzvcZRVdnAOAyo+V8fZfGs04RY4R2criE6d/UI+o20NAvY69P8hQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dzW+dByXNeuRG3DRGhAbBmXTNO456jWq3BpDot9zBWQAFNFyx
	+jDUMjdj1B6E7dUbjGjpu6LY3ByLuBU0UL56mkeSBcYH6GEZSEMau+S8fUFYNQ0HM+cyD+8qa2M
	qUdwsjpi80CYMLHYQYaSadNJUYjE6W4FJFf2mc9wiX9peH/HkfjiZghEJvQ==
X-Gm-Gg: AZFdTZdGjiBas5v9vIgMLO83tSoucj6WP9k995qm2Fzrcldgbk0f2aeOtDELgHpRtAl
	XuUNbkEvSFrNpM82SIakrDXzor9LgAs7aEjjmWx0em14m5Gvl8XfpGaWc4y3fUl+kQL1NuumJbF
	Fkb/bhiKc/bXzYsf/Ws/hIkoZ6khc/rlhTzSMqQKJwrjhMRQiUH6kvCtjfkE+dzc6mZAJyu1Pem
	yevfCH8fpuApqvmOsPh1gBHMkzxR5sCYoAtkub8Ls9elfQLtAPHlrFRlT6Bucpr1Bbcv7Tl/rxU
	JeZcdwZQVGVRcFnjyxlQs1r4FI1si1/Ili4bM1/KKWLMkjwmT6j/CYtCMgWXHT6Rw17vZDiZT8J
	Kfa1vzJ9Ihq9I1/V/zy//Xqw2g9UDauo11ysILDf+7lQZjOi44ElQAW5YHhZ4AJjqelKyGcsiZ2
	KQ93PkVXmJpIBSF/CXhScsYUkjiGpEbCXYrBCZcBasXLVN
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817892f8f.34.1795080939845;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
X-Received: by 2002:a05:6000:184b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4a63b6fbd88mr11817756f8f.34.1795080939199;
        Thu, 19 Nov 2026 01:35:39 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm9495655f8f.17.2026.11.19.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:35:38 -0800 (PST)
Message-ID: <4eea6d32-4200-4cd1-860a-70e81356678e@redhat.com>
Date: Thu, 19 Nov 2026 10:35:36 +0100
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
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to assign
 a unique node id
To: netdev-bot+sashiko@kernel.org, manivannan.sadhasivam@oss.qualcomm.com
Cc: mani@kernel.org, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 jjohnson@kernel.org, edumazet@kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, andersson@kernel.org,
 christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com,
 raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi,
 jeff.hugo@oss.qualcomm.com, daizhuang.bai@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com
References: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
 <179478985187.3136.15328141866524028119@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179478985187.3136.15328141866524028119@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 01:44, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] A failed node-id insert now drops the packet, where the old
>    code still delivered it, and a dropped HELLO is never recovered.
> - [Medium] In AUTO mode, nid and ep_nid can end up different, which the
>    commit message says cannot happen, and the rewrite logic then…

The first concern above looks relevant, and the 2nd deserves at least an
explicit answer.

In general you need to address (either debate or fix) every AI comment with
prio >= Mid.

Next patch as more of such comments.

/P

