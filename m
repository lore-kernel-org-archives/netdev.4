Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794990240;
	b=D5B47Fmqnn2OYaoVWVqBT1mdLFUjgaw4cjj4b9Fo0csGNa7Ivi7BBYmpGBLRajm219IA
	 KIYLlW3y6Lvg2mI1zVG4fXyBpIDhO7U6OpPGmRe3wANRZQ1huyiNucMGzYiml8VdLTyvt
	 SeSTrjoOap/D5OZGLVLE502d7ryRxHubMN9GetKx4Kue7NL5kLMXgZIVvmlpyCBjYFKIk
	 YsYgnRfCDPsw+qH9pOa239IMoTomgrrqs5vDDUlrBdcL2yo7mQJCiaHBAdDpHUEJ53e64
	 V2qTwhbxSnAgQOEUHIj3yTfB6TqXrNDfsIPKgMZDg8FmdKV4FWSMtQHSa5l3+N6OwJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
	b=1GGgrBnO1RLAfP3vHKcSYt1alScqxyc3G/yAKZOjTrSzQ05uNUNhmIXHjOMvzD1b4jnN
	 zbz5VOvZQrH03Ajoh58YyZFmt2jClGyPYqt2Wua88WQp9tE8hLQdMt14ZegnfclJum3vx
	 f1Jwm1kOnht4iPrt9RrHuevtVSUbspJz4ry+Its2hJpvyWN8axuS1IeT6sWqmchoDD7Gx
	 m/Xm3CSW2Sr0KrYtKd86/9KLwiwnEviJOFTY0TQNAYs1Zlir1EAiYz8AwamBS57G/qQqA
	 Ul8qo+pdljf8n18LjELw2+4iZBY4Y27JPm/zKHbAfVzYk4cwuV5UNhAuc+14UoJ2RpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvXJLKLS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064F606A330
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2064F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EvXJLKLS
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so5901111fa.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794990238; cv=none;
        d=google.com; s=arc-20260327;
        b=CcJm1snikX9bMNmQ+baPv6N7kppC9WfVxYsAcrB9WA3xhp4nRFMtTomwyos7KyQv0E
         h1tP88bBSf2GNj8B+6nbxhoFK9K07JZcNhxws+mNAF2fufLhxWxATfxfI5GQIy3mPtyN
         d07EG//Sez18ldc930RE5K+8i80Dht8nQXdT2SXGu63K6gNXFu4Z9zfjGZu8Vqu/8+y8
         7czPsm1qYzABXXKfiB/BVEKdDIlXE69OsV+6CYL3ZA9U/F467Dw8hJI46jw0YQhKz08M
         Os90eUxmvYLfnvdPByS5LvbVlgUKsyQAI+aOSf1XVb6GJ0kinR3uG8yhA1JH275fCv93
         FN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
        fh=99GZjcgrzuavPNMoX9fPQFTDK1gSN4AJu8GsV+jj96Q=;
        b=PYtuEdpycbj2Usb/21RC5b+nr/0pt5k7mTzbpRDxO+BLDSq/njA+75XoML9EJkmJrG
         oJXwV/OaB6WjoyiAzKTzn2DhnX+tZ2vkUgUoISjLG3wadD6QYKl9AJ3N6q9dApOtooB6
         sMXN9tyO7487ycnhtE1ydsJnxGU8/5kfoY8Jx0n7+GG4ybIHeFyQLzX/c8+nwe0yTEkE
         gjVTAM+H61uPdHnrmjITM75IjQZcbCICEbyY7ZF4rHPADkZyrLMm0YSvBQLy7hG5Xq60
         U+NVM8o9QFWamSkosrVyTbEs+o9pYbQMfO6BXqco44tN+fVUCSk+mVtMrbyDWSNWAkjd
         dvDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990238; x=1795595038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
        b=EvXJLKLSa/4hjF0z9uIGue3u4pc6jkvzQtH1f0PBQlA2FVXtoPM6ojFBdYIrO9fCHd
         gHLSqnSeEfO1o+aR4+ToQqcMZJXpNI/PpQsRjf3JnYKg4l5OrG9GfOx2ognqvlqwf4cC
         oGfa8z3jCGvAgOY0DG/zesjLpzS0sbKftLc2dkRKHA3lQrbh/GG6JQGSWndQyDh1LCbx
         VAmw19KDh16mWOJxlCIFgQtSBIq0E/kB17vYawIjnftezLPjh/QwRoL+5BTwAxd5rL1x
         sHfLbLcUbC+z+MB2OlR+2AS3n0IDuJrhjyndONQJwnw7e4zWqLVTaowQaFc4fU+LENot
         nrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990238; x=1795595038;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
        b=EjEp9ZxRSFXw8q+FbMNim3sP+7mYKsNMrakYAbRHGFgDdaQW7ZGbMwwE+1sZGpREIC
         eTApZ2I4q5jEija55mkh4NOGXNqRAy2UKIMxWlMSMpGRqm50DwiQDK0KuV0IVZQF4oNa
         wtLjg+BSaTVmq+6MzLobjUAJJgLyCYVxkvaFgFyU8Q0Dku0ID/IDQyIuSacZ22FklSyf
         WSRtl1UyLc/BSwxlKxR9kEanQL5/8g6XCAFNnHc4FK04uiywjw94ZzZpgECUua5TZTlz
         vMU768+Fl3inyHCBpjOFKKK4judnm8QSTXikjVJVPDefivrSX/eMiShBtP7JDDUxwMV4
         jgBg==
X-Forwarded-Encrypted: i=1; AL+hErHnXnRVFymXny/Aiht5XXPCX0Nm6yiIozVJkKD4YH4R8Dfg6FdavH3ST/LmofvML61hid1NLRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0RK+g+s6cUejF+S+DTNlBzhvMI5mcphZ0sV98E4WkisMK1u7
	ESIJ0AFQykD3R3C4OCTRYar0Ur4ya7NcfKSl3BYPpPpUkbaIabnoqplHZEz8tht8H3b03vRHR3Y
	0LGEpoRe2eKEcNzPG/hql72R4rmH5LTE=
X-Gm-Gg: AYBFou1+yWxqQKePZnGmsMe67m+omg16lTIYhgK5rqirsKLOOa5cTAJ1Et9/IcfuR30
	UHBJDMZYQ8OCi6BQlb4Cq8LUEWuuJophn+9gyEbTF+Dmpld+RAyy7rB/n93I/QnVSr7bJ6waFnX
	QFO7xn00A+m0yaT0veU0x97th457jn65rDQUh4jWUpotaozxKvw0pF5MrKHtlf431+YUx2VBCLt
	pbtvEEfsQKXYy2vV9n0cGYWB9eLhtEmbismrZ5rNM4CRd1ttT8kUTi6GZuv9oox/4sxacS8JCEm
	jnQ0OFf81voTxBB40kxHOwMuOkznhgTPLiga6xQvkCFDIxqprjKRhcT8DErgczOvgz4fMmhWdzk
	FxkYkvhCC8sOIsp5yMVDWwWPPQk40HejoQFjHmnptl7XJHo6vtjqI/sc5iNhkvaKaNinDiyo27F
	jqymxfa8CyBhrseaSeK6lx1fVqWt+slgcbH2uDV2iAmEtU0DeKrt/+s0CuD6fkyQ==
X-Received: by 2002:a05:651c:a165:b0:3ac:d178:4fab with SMTP id
 38308e7fff4ca-3ae670bf950mr5692991fa.15.1794990237903; Wed, 18 Nov 2026
 00:23:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118081530.32-1-luob87709@gmail.com> <179498993525.3291.5601341761915431183@kernel.org>
In-Reply-To: <179498993525.3291.5601341761915431183@kernel.org>
From: bin luo <luob87709@gmail.com>
Date: Wed, 18 Nov 2026 16:23:45 +0800
X-Gm-Features: AclHuK8tzrXAnBEEnV7izSR1ok85RQGJJb1sS75npmL1o0nlxOXbqqrnO8hfmRg
Message-ID: <CALa7h7Ges-aY7SrJcODTESgq8q04Ak5a_3ksT1FTjQe8RYzwWg@mail.gmail.com>
Subject: Re: [PATCH v2] net/nfc: fix skb ownership on data exchange errors
To: netdev-bot+sinfo@kernel.org
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david+nfc@ixit.cz, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The issue was first identified through manual code inspection during
our NFC callback-ownership audit. I traced the NCI data-exchange
completion path into rawsock and found that a non-NULL skb could
bypass cleanup on the error path. I then reproduced the behavior with
a QEMU NFC_VIRTUAL_NCI test.

Best regards,
Bin Luo
