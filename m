Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710714;
	b=ikLLkk7WBmeSD7et0NjkGRUY/X7GfLSZSzw6wzH6kudhaWzZWhG4cmaO3MT9l1cm2Gtx
	 7U2OFhFZjEFihQgfA5xhsC5j+NfFmBk1V2uZIG/lvN/VWEn0izAuSJzVJBrSw8vXKpeep
	 +ttC36+rvsNYkvm69P3nDFU6+nKKJHt0CQlgG8TiHkjROWEZnsW/ZkY+4LIzBN7YTG5XO
	 Vp3K/vgAhoiQjHa38xaXBqfjx7sS2gKSjOkYROD9vxqROqqbDINGslAZIaQvPuSCHjFoR
	 oFLkOBsiCOr5JMUjh6OLD2OwwONz4mC+lVIzCns4gyET7GV91paBOfbdbuKE1JORnPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710714;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
	b=vksPRkTBj+CI7B+Zi4zXwhj03k1SvODnWuPpiCXP/ck7Sxc7QLXcPLSUL+y/hq3y92Ab
	 ci39p1JtA2MhI0ymVQQn5xxPX18Xdg2buNq/V18K1moz7dsg/EDMGCuBxC3tgtxDGG0Xo
	 7WhiFtUoQB0rRav24EYclhsCJ+G3boQznT5qFXn1HU3vbWKZNShCU5i1/BFJi8D9MO/dm
	 ZeHLAdvnLhZ2IUXYR37WrYD8uZRwyimJPxbHb8gN5LHgRm2QtbzunHHB0Bvr0evFgoDvK
	 JqmYVSg0ZrVCutfSn69dLcIAGxQgxXcCOW3Pehtv/DLThEaZejj5fAxCafSnChRiY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FNXITSxk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="slA4/mwR";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0360A2619
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE0360A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FNXITSxk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=slA4/mwR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795710712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
	b=FNXITSxke5jsILp5WcRxckJFkbtVo8niQpqKers6+xbfFFj//VOVmBiOMlXxs8FgcuhwHe
	rBNuNJU8C8eBS/wh8RQdG13ovQCu40zWp2re/c8ueCPboTeytt2ntqs6ptN90PzARCTB6S
	ONVCEF0Xc6Zer3p3wKgUStFxM4J7jH4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-3Z_XyavDN3Gy43_uot4fCQ-1; Thu, 26 Nov 2026 16:31:50 +0000
X-MC-Unique: 3Z_XyavDN3Gy43_uot4fCQ-1
X-Mimecast-MFC-AGG-ID: 3Z_XyavDN3Gy43_uot4fCQ_1795710709
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso59692665e9.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795710709; x=1796315509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
        b=slA4/mwRHgGh6eC4qPsg3ma9GBSUsqK+U3eisX/eHTTzuMe9UVW34SAZb2WQ4xwtDW
         +eTlg4zzIEYgRhWv10nWv5x5T3JlI6QddpVrTkOJObIGF+K8LKMBDO7cnu3dPDJtPhQL
         CZDUM2f0Iqxbpm2t6bylh2m331ykHT4Tqcmalk8GGBX/6ci0bI2FsiobISE1FCnytjJ3
         ke1KQ10Q0OcxmAeL15nzspqgR4H+nY7OJmLIzmxbISwCUYA7foftptOIg9PyYcgafjz+
         ozgEUJybOvgv250riBScj739LMHu9Tdm0zKV/z4jwY2nVJg/f1dzlcFk+PO2ga8zC1W8
         wouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710709; x=1796315509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9zuf6AtiZX3yOJGNCRqBvoPw6Ll8AmPwZKNUXFPImg=;
        b=ZM3G0uDR9kMGVdRxDPtMiiIY5yD0ZBstkySYMdwiaIbZJsn5FUWsdLogO7I5vUT9gs
         7IuYLibhxSdhQEPQk1UO6R9DX1OwPyNlEjlWmC9CkjCZUWJWp2qZhsPfNUM7saXrqArb
         NuvbJh+9AdpYA3kI0UIq6YtfFUtF/galwZpVO+eHosYMaEt79yHSA3C5yTUEO03E+K4P
         BwaVc0QkiKdcSnAR6QuMO0M0Ch4g8bi0kaZbc3KNJ4LlBMRNJdumlAslsvMqggsa1sT4
         ar6TrHkEXa8ARUf8VXq9YhkSGHgikSS6I/K7u2/HOhiMdFLq2SFLSQm8zG3RGF4z4sks
         hUSA==
X-Gm-Message-State: APuU4Z+Tns2gb6vT4UWIYJCLBEswWKsIWjXDm/GNKjYdpV1cJM7vpt/9
	R4Qq0NWSH9jknrCGAj81AqBo7GvAUG5WcW0k8Y4T6qf7dg6UELU1Mt8+FfTQRjp7Tj001ufsxr4
	tw+pRzLWPngmV3gvbmfhZNUuN2tpsEDEWPARPtpwyc+1HXzgl66j9zRlD1Q==
X-Gm-Gg: AZFdTZcdv8qRTpjLwGOC010/vSFekWY7ILB9/ZCOxm9UJh4QfmCo1TxAvDW4aHkzgRc
	RWc0OuW/yi6+MPf+/SulKshgE/jJpcHfkdlRrEiFzNwWm8/tFtL1+i3nb9MkCKrN51DvW4ipPTj
	BkE3KMrPdjVfhrzlxqX2fU6zxKWnkEo8O8GY026JBkWvD5P0RItoILPhiW3zk1Le4YdozK6fugC
	VhFhjE6VZshkcQ1FcVRKlsr0oU19soRBHP//cAuGbix65Mekgg0cUDTCH1P/PTncCx1sfHIsX0E
	4Q4zpjiN2S3g++Yikx/TpuZR5IyTTlYEwU67I0x68P07f5zgDI2QOlXSOtXvQBh/l+wouGPNZza
	4vwhFEIHyX8/rJxvkdfv0UCjagb3OvSHHVYRo4XkLP/PJK2HNa9YEkc+KDUwlh7CMqGdQvQl53W
	FAvTvnF1Ti8pf9MgirFZI7IKf9qzzMI7MqFQHJ96/tr7Uh
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr421918735e9.25.1795710709175;
        Thu, 26 Nov 2026 08:31:49 -0800 (PST)
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr421918405e9.25.1795710708737;
        Thu, 26 Nov 2026 08:31:48 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm41448852f8f.42.2026.11.26.08.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:31:48 -0800 (PST)
Message-ID: <72ec342e-18a9-4b40-ac3b-a20e4e9608a6@redhat.com>
Date: Thu, 26 Nov 2026 17:31:46 +0100
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
Subject: Re: [PATCH net 4/4] net: skbuff: limit folio refcount when splicing
 from sockets
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kiryl Shutsemau <kas@kernel.org>,
 Song Liu <songliubraving@fb.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Rik van Riel <riel@surriel.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 stable@vger.kernel.org
References: <20261118-skb_refcount_overflow-v1-0-5551b4954c3f@kernel.org>
 <20261118-skb_refcount_overflow-v1-4-5551b4954c3f@kernel.org>
 <14059088-7992-4d89-ac6c-1e6d1f61b3c8@redhat.com>
 <832f42a7-1d44-4138-a7f5-7cead4a28e57@kernel.org>
 <bcbb57bd-6447-4faa-a56c-9bdf1c7bc90a@redhat.com>
 <b36f40f0-3f9c-4ba6-8c1c-a76f99623944@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <b36f40f0-3f9c-4ba6-8c1c-a76f99623944@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:12, David Hildenbrand (Arm) wrote:
> On 11/26/26 17:10, Paolo Abeni wrote:
>> I actually prefer what you suggest here more than the current patch.
>> I suspect Willem may have some other option avail, but he will
>> not back for a few days.
> 
> Okay, just let me now whenever you want a resend with the proposed changes. I
> tested them a bit and they seem to get the job done as well.
Please, go ahead.

Thanks,

Paolo

