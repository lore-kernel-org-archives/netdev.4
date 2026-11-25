Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629656;
	b=qBhCWRlydyGS9qenhc/NPvs45lhjdTvzfN9fGwUP+37K+IvOSPARtp2ZKqt0RWlFZVXZ
	 r7ec1Ke1uh1sdc2uA/jd8P+c7Tzx7uGJ30s6m3wCZu69XQWBHyxWzsN3CxtCf5HbN0TSt
	 rD/7whvJ5i3OsBqFMKqld7OvJrGzQcerJgg1pazzGqWaJXLH/yHhM2EcY2s7kgKSn4jiX
	 Ocejgod3WxEttCDQ8hLhKDJChps3GyQ6+WfPftsoHWSitxDjx1KNFDVrRF2HR8WUbSQ52
	 kl6inQOlTJV6BZQjYd3eVGqDqFD9rADtn5/r0v7YfBZnKkubUd9LWgzj6L7HrLnKO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
	b=do7bM/ylGNE2lLfZHEaSRFmCYVmVprpX7jQYZIVOu/vxqj7yVsGItnqkE+opj6uHVwzU
	 p05+SkrIzTzS+mv9j/h94ShdyJldtAe4dWnt+VfnjGl2lQBi008mHEol7M4MaGV839cGa
	 q34ddpZIJG3QPFg25+2mmdrmBJXXz5zdW2cJh9FRZkLtwkIRoUnfHiaMbaPD3t5cDH7XC
	 GmKg2OfQlm7eu7hCYjf2S6uwsRM+3D1RYYQNwGHV1fQyPuOQtMkZJlRG9oWIi4IUXwTVM
	 vu0D5PoodSp/ny+faojwba8SSPpHuA7gBVkx6ucY+c46XqAwQajXyVuDNcewS6B2k9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRD1AUsF;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CC2606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CC2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRD1AUsF
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so32449005e9.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629654; x=1796234454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
        b=fRD1AUsF9tDJYuYwbxPXkXtu9zWYe1dpFtJfe5CMETSrWtAvc7JRl9O38Gp3o9pp1t
         QbIbT2epeGAm5UWKqdTuGmzg+vfYvcc34ptXmjq1nLAZlxSoE+twsoTjgEqM2CHV8X92
         ErOHBP7xppVVaiIrTyUZ0OuVs4ClYR7gHoexH1JG2QVkw61I+agAq00XIMbhBEpk/ji3
         jzNL2XRFVuKQWvftdF+Vr0Ivz62I0vpcq7MELZzeGy9DZvI9Oa9b3oWsB/K4N7YX9Rdq
         F0hkUL5uv7spyKVe1rFn8YXeD68SNgPjeGBD4+gFaUEADGraUl4rw6AksglWABMDH9ha
         BhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629654; x=1796234454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
        b=JTzQFIaQBdGvD3yeOj5L9Iimv3vjRtui4yUoXwuTN3Eu/CM3KOJ+6Ba/PEI0wi/aly
         opU7nR0b33EM737Ozyc+DmTXX8oxxdX3IiAaHc1PK/vj+1ypoaeX2jiW+rMYfqe9slvk
         j5jlw3t7qHsaQQz/Qxa+UU9Hl6oIQVUBeNamhREGrmyvGgnH9Z5JD9X+tuCGjP101hpQ
         EOQ57U+ucYw55KCwetKClqW9tQ9ReU0SP6+U1zQMnQCOxhFlGVzyieC9hLkE2J0YE+pW
         5amAPSl6ycpvt+xAVPQmAwpNdsPvWSw1cEMe1SvpuHdPl0rJQkywQuoRn09x6uPagaE4
         IFDw==
X-Forwarded-Encrypted: i=1; AL+hErFzVQMK2RUVdCXEuDvwAv1QY8QpBku3PuwhYUS66LNLnBNkMLKNndvay8OgLQ/oVp5jdGVavvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l/3r5pLve3GXhY7+z5nN793pW3pk+ZFkN+T+oE7HjklodJhNX
	L6F3AltWv1un3zm1INvf3REyeOJJg30uG3HF3Il9RVWTxbG3icZj/ZVs
X-Gm-Gg: AZFdTZd2ZumfLUkxqCevBbdnyAEuChP+pu+IAmZPr0BtMoDk4/1Gh4bxWSpy96aB89x
	gc75m+CC6h11JS6DuXab8WSDSJN7lPHbi5PK6YV6c1QxZmTuerxb4Bv/hMS5fuOFlHwEvdQwiyM
	eoPvrc1ltCnVDKnN5duzuZr9WhPC/PNdCG2wsaArqoPJzJa/buZF4PGc5QZWXOxDD43noOM5X1A
	C4jytM4D7vSsTNLuIGNb2P43ejBXxcKLAL9+pk7IXNj3V08PQJfzJhK/mYhYxbouE1UIPVcLmi+
	AQGXiQl3ZlnnVBHyZxxlB31HgNz58rU6NepEsA6sGSevzU6pY61710hHXR/RVVKFgisz2FZOz15
	KPYtpHmrqQdGGRHiinpU7K90czyQB6U7relzlIORMnUqwt0bEmBA9cLSmSTx6OPJurvn47EBiiU
	fvhxLx5BsoBc6sdboGhZWNRr1ktmk6/4ppifq3SHrwyrVo7MCuhooGFE9c2AXKUmH9UTuqAN8Yn
	ky9Gt4WqwcbsrjV+zk2QfZepkNUSUUfYeFBp5OxBl7xwWvI9/qQwO76U+HkdpO25p4qwKdaydIG
	FMzpi6UBwVEj4CITcH5MMiqDz5ZhD577gWN9779IyDQvd93Y3qhPqUHxw0STbhos02xlnDY7DSF
	eaQI4cBmLsOc=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr393055345e9.29.1795629654223;
        Wed, 25 Nov 2026 10:00:54 -0800 (PST)
Received: from [192.168.0.69] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm759477515e9.13.2026.11.25.10.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:00:53 -0800 (PST)
Message-ID: <3d1cc139-77a0-49aa-86c8-a723cd29b992@gmail.com>
Date: Wed, 25 Nov 2026 18:00:52 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
 <20261125145207.GH191152@black.igk.intel.com>
 <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>
 <20261125153300.GI191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125153300.GI191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Understood, thanks. I'll withdraw patch 1/2 and respin patch 2/2 
(atlantic) as a standalone single-patch submission to netdev. I'll also 
keep investigating the Linux-side runtime-PM gaps on this hardware 
separately — your pointer to runtime-idle S0ix was the correct direction 
regardless of whether a thunderbolt patch gets involved.

Thank you for the detailed review.


On 25/11/2026 15:33, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 03:16:26PM +0000, Tobias Heath wrote:
>> Mika,
>>
>> That's clarifying, thank you — I hadn't understood the two-paths
>> distinction. The behaviour I want on lid-close is Path 2 (runtime-idle S0ix
>> / Modern Standby), not Path 1 with the TB fabric preserved. My patch is a
>> workaround that patches Path 1 to behave like Path 2, rather than using Path
>> 2.
>>
>> On AMD Ryzen AI 9 HX 370, I'll inspect amd_pmc debugfs (I assume the AMD
>> counterpart of pmc_core) to confirm whether runtime S0ix is entered when the
>> system is idle, and whether any particular device is preventing it. If Path
>> 2 can be made to work on this hardware, the TB patch is probably not needed.
>> I'll drop it in that case and keep only the atlantic fix.
> Yea, it's not exactly trivial to get all the ingredients right but distros
> typically have all the drivers + firmwares shipped so that may be good
> starting point and just see what is missing (if anything).
>
>> Would you prefer I withdraw PATCH 1/2 now and respin as a single-patch
>> atlantic submission, or leave the series open while I investigate?
> I would leave the TB patch out of it because in that shape it's not
> something I'm comfortably taking as is anyway.
