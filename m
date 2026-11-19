Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077807;
	b=iOGqVpciwaS3t1Y4OVP2bJhKz63x+hVGFxQiKBjhPfIKDNSLLFXHUUtSHnF0TBo9AJPK
	 32W5fjz0ANXKaS3Vw/EW3WP5d6haH/KJZJdreSKpiaLYD1UB8EhIYwExHO1+zc0x1TUdn
	 NvqQrLIACI2EqIh/3lZ/BACZnW/Q5JCcTNNvb18wQVgFJ68BBhe13BDG/GZOagigWmRLq
	 wPdeqwJQDF+JggR7XTsnRF8yx9JVQwkpl8aB4UYkMIpRdIlUOWJDVr/s5pf0w5RFNnRo4
	 nW6ufvjoTUSf7mrJZ8oU/Tbw9BglAbc8B+/jDpBERESTUNz/OxjU1L0puobilkzWCeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077807;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Cjzngq1VGH0F6kYJpBdoRXztCMYblcWKIno2QwRBjA=;
	b=yvImv5x1ks/Fs80JyG3E5EhWnFvyZnzKiNWzkbOsli6ZHLSzMGqSbVT93WfVx8YjIIij
	 ROeHh4uX6JVXlJgDv7TsbPz8A7ft4W1ZdNQUn8yibj36EEC/kgJMRqh37cuwlSci03w1Z
	 ECVdM7mPDAFgPG9oZDKVtyWeh9NUAWPMrQQ2Jpn+LHTTUXeHspi+0Us5cVHF1KviBvtRm
	 xXCZdUppdz0DdPZc0uPeFa51qAkgA2BUsj1dGhI1tEpo+odkUAO/OG4Meq/VdatcT5Zje
	 HaroQfiV1pkjXkvu3f6619G46gHWT3tXy7Q4siBPzJlUtcLtr5JaSRjdQ4MhgYJ6ZyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Di7cHPve;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bHrE2JO0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01177606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01177606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Di7cHPve;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bHrE2JO0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795077805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Cjzngq1VGH0F6kYJpBdoRXztCMYblcWKIno2QwRBjA=;
	b=Di7cHPvezovVu+Ra/6MEHgLRukZemXUfwzLb9mvtT2oKTb7ZYzuAWfoF2yBzCX35+ZjOqF
	nGCuuiVZypumRd9RD0qtLBs67QNu14Hi6JvtA2yLbnv2zKA/W7FwoNpdX4/GW6DUYCntO9
	ysFlVTyoe5Uec9aLVhH+TA97GqTh7rA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-1cujbrUqPpWnr7rtQ4IL8Q-1; Thu, 19 Nov 2026 03:43:21 -0500
X-MC-Unique: 1cujbrUqPpWnr7rtQ4IL8Q-1
X-Mimecast-MFC-AGG-ID: 1cujbrUqPpWnr7rtQ4IL8Q_1795077800
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49034831bb3so1307637f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795077800; x=1795682600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Cjzngq1VGH0F6kYJpBdoRXztCMYblcWKIno2QwRBjA=;
        b=bHrE2JO0hzT/aSfmOHX/SU0tVzGRoXHijJiuUwWJOkjAFVNDMdzUFxKsO27/j8gmM0
         5wf33Gwqbs9IUiLMY9mwWpCCDa2Tm1GARulPzLto0IB1FZK/Br3Lc2+k9318wdvZj+Sp
         37+XdfLzxG7IFjWtKZ1eo+TVJw2/Kxo3zhvO8ZImat3AmdIF3YxYiyiM324l4X4K6UYH
         t5u3wCwwNY39viIoOfCW2/dYnWtMXfbZtqGL5qyHJoAWVntis0TZV0E2kIbnp35tU6OR
         SD5n/+tgA/rplt1T+RoeLVL9Zs9jFfjXk37xt5fqswVQ5RSUOj6V553vr6HHUof0KWI4
         4YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077800; x=1795682600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Cjzngq1VGH0F6kYJpBdoRXztCMYblcWKIno2QwRBjA=;
        b=ybtaZqnFutjoDE856xyJS2OjxqvnY0pIddxnBknp5cSHquyx0279w+1hh3FDiGu/TB
         EDpwe9MQa9IkHziRw/mV+54RXEYVYidVJKfb0cjk58g1AP3uoNZdXEjFx2pMrL8xBiqf
         xIOg+5rqW5M0G1/rnvMppxRium0d8JD6PHq6IPkOQO8wHh7LeuU7aKvl4dS0NyHbshtD
         fy1sjj7ys7GL0FJfQTv4PeUN0eF7Pa7jM5ZovSb1MMo7qhnU3AeVfNSvsQfLWIgPmKro
         P0lQkh/rOG8TtGBb93iFf7Xh6K5xElsm5WEodtGrTTt5XmLKqrbShUhuVYsHNmJKz9V2
         h+zQ==
X-Forwarded-Encrypted: i=1; AL+hErHEeyCrwEaNGzE1a1dlhuL6GNYaP7z8se2bRpjGZrZFI0xQzbX/oKmE5fYa4bHUkuxNWA7UiI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hh8aMtpJODvENy4Hjf7MEOkZlL3MZ0Pg2ac+hhtXEhxwEmANZ
	B09Sp8FK98R2XEmlPag4nQ35/+vW7T+YXhSIW1kiXGHCZO+WmEglrHBvx68BhxGYuzMrUQj+UNx
	jmuSy4QGjfUgXUi/Lhx3bCAFhJXEsAdbhhtu1YX6XTi4qojtfbyX80dSFow==
X-Gm-Gg: AZFdTZcUpgELyORetpl1Pw9RsWUB9EdN/uVkcWRd0vqLql2Vp2uJkN5REIp5Ra02Avs
	ZYMH5x5n0RbjYKVqvdKqIAHa59aCQApA4u8MLzyDHWXn5TqK3+191nPbe0nu706bqdXLHNPvyId
	9afyvbeJUktmI56xHdIrYar9+FWQyKnE+STb6xV8AcOP4mJFYwKA8YPFXtjVpIIjGsuf1EcGHsi
	H0O7fxzHsWYD+B7PsBfUI+73QNIlQCwdymVsC5H9iz7SYpWxzUBW+D1VxlgL2FOH3PX2YbjsKJ7
	+06HmO2Yk1sWvyHjHvUWVxAJbuirYlwjfoFg/Ipu9fOfKQUEmeqot4t1UAMKwFQw4GtRxrkUpK7
	WTuROkivGdxpk+Hw6dHGeJe/Jw93DEmQ7MdgJ7BlTZvwLAiW5ZnbTt62L2PUnFS7aBBOWj55S13
	wzdjEwPBQms5NhuMKTVuzBUfEB9ge3rafeuJ2vq/hACHCW
X-Received: by 2002:a05:6000:4812:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4a63b9d9635mr9987017f8f.22.1795077800452;
        Thu, 19 Nov 2026 00:43:20 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4a63b9d9635mr9986962f8f.22.1795077799925;
        Thu, 19 Nov 2026 00:43:19 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm9637679f8f.21.2026.11.19.00.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:43:19 -0800 (PST)
Message-ID: <597411fe-5506-43dd-ae37-3bbbc581bd76@redhat.com>
Date: Thu, 19 Nov 2026 09:43:17 +0100
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
Subject: Re: [PATCH net 1/1] ipv6: mcast: use resolved interface for source
 filters
To: Zihan Xi <zihanx@nebusec.ai>, netdev@vger.kernel.org
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, vega@nebusec.ai
References: <cover.1794492711.git.zihanx@nebusec.ai>
 <a5d3d0505baed01a213ea7953f0fe78cb025ee22.1794492711.git.zihanx@nebusec.ai>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a5d3d0505baed01a213ea7953f0fe78cb025ee22.1794492711.git.zihanx@nebusec.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 16:19, Zihan Xi wrote:
> When no interface is specified, ip6_mc_source() resolves the multicast
> route to an interface but searches socket memberships with a wildcard
> index. A socket joined to the same group on multiple interfaces can
> therefore update its source filter on a different interface from the
> interface filter.
> 
> Use the resolved interface index for the membership lookup and for
> dropping the membership after leaving the last source.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>

This is changing an established behavior. While the old one is likely
"uncorrect", existing application may depend on it.
This is at best net-next material (with no fixes nor stable tag), but
lacking an end-user report, but I tent to think we are better off
without this change entirely.

/P

