Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617125;
	b=NcqD6MehP9JZx6B+jGcCD7KmoNFsCbz2rLQHxusekYMoDhwNtCVddY9mt3hegt/mT6Q5
	 GHGvWbCLnSjnvGXhsRsNiOG9NO2QZH1k5FpR47CdSQb6g/A9JRQTvh9Gi1RPJ+oAFTyfS
	 C8heaQLz9WIRXktAI/R3/v3p4z9mv87aa08a1MgtisODJxsUntTF2I+tQB38Ljjvlgzgz
	 Ya+bxFmOVrphZWpdZ4FfM3cKc7XHIZ0EQNyLd4mSICLMy14pmT8Xhb5QeUcQpv2UPOG7e
	 wuGSwQkpbAoUsmcKHJgz4F4gAfPuk5f6/qLUCcrK2/VWMYFH8mQ0MM68LW/AVcLJIyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617125;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y9M4mZ1sXqBnAt7gUxOS/kbwMdJhgsv3SyZWvfyQ2Ug=;
	b=LBj3o9u6+D1TUkw7xlVq6zCy/6Exy3MkFuaLtjQlyxKu0jWMAJiCisVTRL6a2+27WxfP
	 zyfPvornR2LDjZaZyc+OMOGcpp+EOL+izhE7dEsldQGDw1zMhrNttkOpMD9910uBOqenY
	 gK2GnnBxddWkywo2w7c4/BKxMrtRlbDMnUPEZhfQwmY29/z3g+9KHzQZKQiebOBvUDlsq
	 NyO5oG+/fyegePMl4mYGnyFr0Eo6VW0987YKmJhnvC+cQNLwv6dDj7yN6eSdr6aLXyMZ8
	 f+WJAU0vt68j56GWa1rnkMKWFwbRvLJ17syOIJ7a0QCT0tWtTwS20Kw7HWpIb/tj+QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pk9LZwaQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rst8sXcQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB3606A335
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DB3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pk9LZwaQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rst8sXcQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795617123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9M4mZ1sXqBnAt7gUxOS/kbwMdJhgsv3SyZWvfyQ2Ug=;
	b=Pk9LZwaQ2+g/0dcs7vL3nS9GSAOKXf2OGUP4gXeVHPeiEM3bAidVvCslxyMrHtUE146um3
	MHePkNpnpHa8TUcA/FEZlfkk4zqp7n15TxLT5aNN7y+cQ8tOhJFzz6M/vL98jhNHZvUA4w
	56ULbMUgUxJUxbZM/1/14RI6ur0digc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-Dgtg0qxwMMmR2FgzTrXFSA-1; Wed, 25 Nov 2026 14:32:01 +0000
X-MC-Unique: Dgtg0qxwMMmR2FgzTrXFSA-1
X-Mimecast-MFC-AGG-ID: Dgtg0qxwMMmR2FgzTrXFSA_1795617120
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso41867225e9.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795617120; x=1796221920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9M4mZ1sXqBnAt7gUxOS/kbwMdJhgsv3SyZWvfyQ2Ug=;
        b=rst8sXcQ4ZLlyc618K0YgyoBvkOQ7ylopU26y8HcJHM6OyJPUCl7D99AMEtglTMSTh
         kgkm/shE8hGo2zOKf9Xy5+0Vl8aWbIvJxNXtFgKNaHXertWesY/sG4q4haubyYlDu6Qz
         apDRpXrp1WCYbKZwntwZYtXts/p7ke+EHwoKuyhb0LKs2mQaIxokbAkTn/s0XNE9eGo9
         L9llm1XNGfX+E9yH98bs8ySJq5se87nr1Iu1zcyHXdnwxwCXfhGXeMsxoICr9mZfg1fa
         Wc5TS4/uFm1cgjap09olqnxS27G9h6/PpXkq6QVK2wqgC2VKx+tTw+PPebpV0UUkXiTf
         59dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617120; x=1796221920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9M4mZ1sXqBnAt7gUxOS/kbwMdJhgsv3SyZWvfyQ2Ug=;
        b=RNk5rcDJqNYIdWsvVLAZrhJr793FU3IK/nCQfy2+x89dgetsg5al9t/uhdF4diE2Iv
         RWdwvM3PuzdcbIaE8cO2ajow/EMEMiY03rcfKSsUX7LLASztTSjf+m/XAM72+HB5QanR
         xzJwjr6pdQECy1T5yWAn613SrWtZNS10TtP+62c+fvKEnUCBHXZsRW1f5xckSq1FgJnc
         0LttyI5RH4nGBXeAEPqN/jENQ/BddhSymvSKiosGN2Yb4QS+yywi2S/6w4IRJ6nskCMm
         Hfms8qUUd2gT1be8rXEwp5GF357q2gwrhmy7Y91xoJ5bf1BmpJUKO/TPPK152yp2UIt+
         UBKw==
X-Forwarded-Encrypted: i=1; AL+hErGUvUVP94B1UXeB7HhYLADTR4QRUvhbiWofVMGkHTcigx/uMXuugOI1PC2gakFDPAvw/37f3Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tk1+MlXdiCaELpmu7mfnbqDxnOMh/OkzrdyuehPPe7f3WmV8t
	9h1pOtiEarYwZd2nDF5PNSM5AQy2liqDcDykL4Sl6+ODhcFwFAiXl1VaDD+pm8Ov/ZCYbiC20Qz
	tCm77USJZiqDFUvdSFZiHaferrbOgUgSMZdNSDCe3mhBd1VTchgiXsfpGzA==
X-Gm-Gg: AZFdTZc8N3AC6kPnouX2VuBklP8z8v++k77QUXxuJgRg2IJSpX7+6d2VGuLX4jKU96d
	rc0+Ma89ntvnxhwgiuIZehgUk2AlxsihQ4ANyaPkOeNIE8KthegjG6zbRXV0EpZC2XAYvC0dmwI
	VBqUhgmo3Jl1G1/QdIS14ajCYjEk0A6Md7vsqgsti6ytXkfG0dQF+7bN96D9FSJ/WkXVbHgouDC
	DxVPgk3fxBJGMpB5x49xJyUePJY/dkcVU/UaGWFB058UmmrBEGaA6hWn7KTgIBGG1ZF5CdGlSnc
	67wiCitOEF/b9K6ZvO1UPk9fLL13ZeSsUpnM1hSmbheE/vzaGXZTmgeF1cnuxJwVmuzSQrBbCVl
	qI5axfbkgBlzBjrHnGIBNSsh/K6ozoY5bMFU454Z23y6R0VD6wX825M+3LHMMeW7trQ+nkjPq8d
	2SRH8WqshK7wYMGVs4FWI4wQuRXp88GjGaDJk/wvhYT0fz
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr338242245e9.4.1795617120308;
        Wed, 25 Nov 2026 06:32:00 -0800 (PST)
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr338241515e9.4.1795617119786;
        Wed, 25 Nov 2026 06:31:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm33434554f8f.40.2026.11.25.06.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:31:58 -0800 (PST)
Message-ID: <3766f988-9ea9-4ead-870f-fab0549e15b6@redhat.com>
Date: Wed, 25 Nov 2026 15:31:57 +0100
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
Subject: Re: [PATCH v5 net 3/4] net: hns3: fix interface stuck after OOM with
 full hardware rx queue
To: Jijie Shao <shaojijie@huawei.com>, netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, shenjian15@huawei.com, liuyonglong@huawei.com,
 chenhao418@huawei.com, yangshuaisong@h-partners.com, ningwei15@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118130330.3026625-4-shaojijie@huawei.com>
 <179535384062.3135.791733868582964041@kernel.org>
 <a727a596-2718-4aaa-8baf-69b1aee9df43@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a727a596-2718-4aaa-8baf-69b1aee9df43@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/26 08:33, Jijie Shao wrote:
> on 2026/11/22 21:24, netdev-bot+sashiko@kernel.org wrote:
>>> @@ -4489,10 +4519,15 @@ int hns3_clean_rx_ring(struct hns3_enet_ring *ring, int budget,
>>>        * FBD number with head pointer
>>>        */
>>>       if (unused_count > 0)
>>> -        failure = failure ||
>>> -              hns3_nic_alloc_rx_buffers(ring, unused_count);
>>> +        failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
>>> +
>>> +    if (unlikely(failure))
>>> +        hns3_ring_set_oom_state(ring);
>> [Severity: Medium]
>> Can rx_oom_cnt be incremented twice in a single NAPI poll here?
>>
>> The commit message says the counter is "incremented for each NAPI poll
>> that hits an RX allocation failure". When the fraglist napi_alloc_skb()
>> fails in hns3_add_frag(), the path looks like this:
>>
>> hns3_clean_rx_ring()
>>    hns3_handle_rx_bd()
>>      hns3_add_frag()
>>        hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ */
>>        return -ENXIO;
>>    goto out;
>>    failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
>>    if (unlikely(failure))
>>        hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ again */
>>
>> -ENXIO doesn't match the new err == -ENOMEM check. But failure can still
>> be true, either from a failed exit refill or from an earlier failed
>> in-loop refill. Under the memory pressure that caused the fraglist
>> failure, the refill is likely to fail too.
>>
>> hns3_ring_set_oom_state() has no per-poll dedup, so in this case the
>> counter goes up by two for one poll.
> 
> The second increment only happens when a second allocation actually
> failed.  hns3_add_frag() counts its failed napi_alloc_skb() and returns
> -ENXIO, which doesn't set `failure`, so the exit refill still runs and
> bumps the counter again only if it fails too.  Two increments mean two
> failures.  I agree "for each NAPI poll" can read as at most once per
> poll, that's just imprecise wording.
I agree another repost is not needed here. However patch 1, 2 and 4
are net-next material and only patch 3 is borderline net material.

To avoid a repost and splitting, I would apply everything to net-next.

/P

