Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795259469;
	b=bVCrTEHs/Ic2x2foHbxr510WRRo3Uv6+kRKWH/fCuaIAveu7AwX1olH9Jrk9NK6UV6/4
	 Y9W+s2C2ZG6/VqODuaK9I+rFNAG60GhGGVj9Rzy2m8z/H9jd7toUJVEgX+js0Nrmobic+
	 M6bBeURVPgRzP5J2hH2Sts41jxFKMYSjbe7DaRCnhYUHjogsVzwg8KOemGELm0dIeSjZJ
	 VKgVkewEIcbPZH4dlOYbj7r+lBLo1z1WxfIIyP6EV7c1mSH7lAqEdEv81XckVDuACiPXX
	 s8gfMlp53DlfGKDAPq8nbiqlGv8bomQPw9NlI3XKwzS/tBzfACJfVT1R/qKAQIs1gOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795259469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=v9QLSZIJw9m840MSBpxhKuuqvGPGCQ+Ti91KhXLTy3U=;
	b=KkeZLbKCP5qig2PpTFL8VaXKrCrk5Sx1gJXe6+lzHEg3ROfrdQfx21OyL1vDfSFl5Mod
	 ZnmZUfpoR2ADk5TlofQfQ5hFVAr0su9Xj/MF3cpR5yVrDl8SKMCqrUFzYaGrV70IhLmZV
	 F6dcemtwHQwK5L6ULd8DCG4TCxOCxjpppt/uWSAk5KXEE1XZ71FHNHuLQdMQfrH5RZfb0
	 alkHmOb4Sp4mY0CLzsgKijT30QIluwigL6HR5l17NasFoaOAXYT6cDvKKNHnfa3MI99ep
	 yXO4TV0WPIUP4sqNlbBpRuK1eOk+4BJvmv+8X1Zxcmxnvb673cNbZj3wJY1WKg9lvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jqiMN5wJ;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B91606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B91606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jqiMN5wJ
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0464dd6b6so9106705ad.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795259469; x=1795864269; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9QLSZIJw9m840MSBpxhKuuqvGPGCQ+Ti91KhXLTy3U=;
        b=jqiMN5wJ8OOLgCO+xu8BxqfNl4BFvKMowPfwbburIUOp7/S09R/eaZ96p71p7AmYpA
         gvKpgemDx99tlytTUthbE5XHxmoTi7N2CwZk3Ddas6Lqz2qdSphE8V/Xr4atD58dHOxK
         LQksTiI0/4v0U+gDQ5KVnMVHRddWSfs5DIF73ihrO+TxDenAp+GE0/y3Iy8mo2868++n
         q+x58ulS6fB31oYSK/EeJgVmcWN3XK+Ek6kk5qflUa2vcXuXOUK66gjM6zcjY6e26XB9
         6rR40P7vftjjyZT3gw4JV+rJUfkU5fxkVXRZ4w0Xq9Flm8dTqYYY4/XRZIerZUaIutGF
         hbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795259469; x=1795864269;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9QLSZIJw9m840MSBpxhKuuqvGPGCQ+Ti91KhXLTy3U=;
        b=rtnpFRN3+/n33x39XLGpldptuk8wEuo5dDuWEQDAmUVBxMhGgVJzOujC7NI0Npy8yV
         48ZBgpLiGbptqJe/0wOL7Kf9/PCGOEbv59W1uB/2nSKoBkmApVvqNn060/dNmQB9GStY
         liIa+cGtwDt+nTp6ADLGlmdJyERrp0yEQ4rhKNberTKER4fMm5n6llOWlrQl05vDPIxi
         +zZLS+L4vqmh2NTiTkcSdxL83BJ5Qc1EHcCX0lPe4rAb36qYLHntWTNCX37NYBrcGgzq
         tHX/JltdUiS6iIkTO47Zv+DOzSldprhLRjmZ7tZP1zgV25bGFMfhrY/MCqIcGvW59Jnr
         8Tzw==
X-Forwarded-Encrypted: i=1; AL+hErF+4xITQ6xtKI8qs7I0I6nDpqLa4RQIuSM6BZFyxPRvPEdYJavitOv1T0NXr6zcCHv7xYzxFDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rtxxy74j1aOMvhC+MHf+lcGkLwHoEVBcWVLjeBkZlz07hxNbP
	ay98/Y5r6tIPLv9bQg7i2PYDVKa8S9QBcZSZ1jcFzxe98/CndeNN+hhA
X-Gm-Gg: AZFdTZfrvrp3zkJZMTsXdSX920rQ3+5z2/RzLoMrT2QWLFfLBaSpOqt2V5AxHPVq2lq
	y1YDyfJRlkgQpvjhBTnhBPSTc0M336pqPoay/yEMjoCWfLfp+/alWSWvLkagopm6mFKXJPonfpo
	/TXDXKskd5Amjsuhq8ayhGQqrrveGNGZlNdmrVJM2qB5jQK3tHXwmpV+IVLXF0dwsZNvLdeD9GG
	YbuycXkMMMF/oZ70DvvydSvSdSfP2l9BykIz5qbMZRm8czaCEBPQ66zfmNQTYdElGpJJw/RUVbx
	RWct1iOXGSKvevJVQ9hsQbtfAP6nPrn8y+qqLMcIxyrs+Wv2Ybf4nI27mTyj84zfr0GuXn9/eK4
	o90zUsPg1rAjmJPiS6k7h+Z8XpZssT+y8E0aAPRIPaHlYu+mVeBgm1o4y4RpyCOAKttQlDvF2cE
	H86zdYmNTCbKh4Yj0LXRiBaHGzOqTP9shR4fVkxJLKP98loKVXnLzaqs0u59oTnD8hZro5FcnWH
	m4jDU+Cq0Vtza5lB/N2L9xqjCjAjaJYMQu1dqZOl8bRghREBc89iJif72+OPJKXTwTGtFGYOUTo
	N1e8orDlAP0TDmJTbDi6KqkaSYJwZWXMN5e5hQ==
X-Received: by 2002:a17:902:e88d:b0:2ef:e864:e0fd with SMTP id d9443c01a7336-2f03ef870f4mr66924815ad.5.1795259468652;
        Sat, 21 Nov 2026 03:11:08 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:5f92:c501:8e47:293d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f072cd1493sm2017895ad.62.2026.11.21.03.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:11:08 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
From: mdshahid03@gmail.com
To: Jakub Kicinski <kuba@kernel.org>
Cc: mdshahid03@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261120100415.363fcb19@kernel.org>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
Date: Sat, 21 Nov 2026 16:40:43 +0530
Message-Id: <179525944307.361783.17801110279499293110.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi Jakub,

I tested this issue on both original and patched kernels in qemu.

First, I used a test module to unregister all PF_UNSPEC handlers.

On the original kernel ,running ip link show caused a kernel crash 
due to a NULL pointer dereference.

~ # ip link show
[   84.803284][   T65] BUG: kernel NULL pointer dereference, address: 0000000000000010
[   84.803926][   T65] #PF: supervisor read access in kernel mode
[   84.804231][   T65] #PF: error_code(0x0000) - not-present page
[   84.804698][   T65] PGD 4d55067 P4D 4d55067 PUD 4d56067 PMD 0
[   84.805370][   T65] Oops: Oops: 0000 [#1] NOPTI
[   84.806277][   T65] CPU: 0 UID: 0 PID: 65 Comm: ip Tainted: G           OE        7.3.0-13253-gbc2a37970c19 #1 PREEMPT(lazy)
[   84.807170][   T65] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[   84.807477][   T65] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   84.808195][   T65] RIP: 0010:rtnetlink_rcv_msg+0xc1/0x350
[   84.809058][   T65] Code: e5 f1 6a 01 4a 8b 44 f8 80 48 85 c0 74 09 4c 8b 68 08 4d 85 ed 75 2e 48 8b 05 cb f1 6a 01 48 85 c0 75 07 48 8b 05 bf f1 6a 01 <4a> 8b 44 f8 80 48 85 c0 0f 84 9d 01 00 00 4c 8b 68 08 4d 85 ed 0f

On the patched kernel, the same test did not cause a crash ,instead
the command returned "Operation not supported" ,which is expected 
becasue no handler was avibale.

~ # insmod /modules/rtnl_unspec_trigger.ko
[   71.413827][   T62] rtnl_unspec_trigger: loading out-of-tree module taints kernel.
[   71.414093][   T62] rtnl_unspec_trigger: module verification failed: signature and/or required key missing - tainting kernel
[   71.428825][   T62] rtnl_test: unregistering PF_UNSPEC handlers
[   71.430356][   T62] rtnl_test: PF_UNSPEC handlers unregistered
~ # ip link show
ip: RTNETLINK answers: Operation not supported
ip: dump terminated

This confirms that the NULL check prevents the crash in this case.

I have collected the logs. BTW,This issue was reported by CLANG.
239873:net/core/rtnetlink.c:409:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]

Thanks
Shahid.

On 2026-11-20 10:04 -0800, Jakub Kicinski wrote:
> On Fri, 20 Nov 2026 19:15:48 +0530 mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > The rtnl_get_link() function falls back to the PF_UNSPEC
> > handler table when no handler table is registered for the
> > requested protocol.
> > 
> > However, the fallback table can also be NULL,for example
> > after rtnl_unregister_all(PF_UNSPEC) clears it.
> > 
> > In that cass, dereferencing tab[msgtyp] results in a NULL
> > pointer dereference.
> 
> How can this happen? If you can't answer that - please do
> not submit any patches to Linux networking for at least
> 6 months.
> 
> > diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> > index e141340172ce..b552cbf17d76 100644
> > --- a/net/core/rtnetlink.c
> > +++ b/net/core/rtnetlink.c
> > @@ -406,6 +406,9 @@ static struct rtnl_link *rtnl_get_link(int protocol, int msgtype)
> >  	if (!tab)
> >  		tab = rcu_dereference_rtnl(rtnl_msg_handlers[PF_UNSPEC]);
> >  
> > +	if (!tab)
> > +		return NULL;
> > +
> >  	return rcu_dereference_rtnl(tab[msgtype]);
> >  }
> >  
> 
> 
> 


