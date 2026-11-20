Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188551;
	b=kOJ0rtgzGkxzrQFBT4Ra8yrrlGirbLUlkIEaHoRtRElM1ubPfX8AwwM0f4hc3WNHS4tw
	 mqWGZcFVQImERo9QDLfPd11fJysyiyvbRaVsDw3hAJ6eMGN4e8fubEfu+IHa9ltCcdp0T
	 rCTbiGgtJpYcivJ89wagR+aGu1kP6tY+NGEan77t40KpRG20oKovKDhQxwmFBfVlzcVuG
	 ZsRjtWruGughu/1drOYQIVLaEGD11hpJNgjBbt0SLzyPLN15CGN1SgyNryRp6twWwxx8h
	 mf/eAPeL1ShKPBY12l0UktsPyH4GsEcTOkUHJ04WdGDJWqdD+c1NAFnSKF/hSnmVN+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Vhu55Pzlkvmu17gxKyXMYj6pL0x4NHh7A+EQNL/WuaE=;
	b=pjwAh5UVJ9dpv1ZBttYpVI8n+wcPhgsBRVwP3cTabvwRCHzOKbTWOAH7mJlJvaEe1KcG
	 g2MC0+mtFRX6TxJWdPF5biXiLT8DHMu2I2fhGrhouaenxjU3i+3fjivyFSgCAx7qQplZU
	 pGir4JIQh13WP/ZYi9JutVWGDdX55sWsjDIL+X1ZPTYlGP5gfqfUttLbs7VIYQ6rsbzh6
	 Sey0ANFrhmHbvICbv0OWCjLpcBrqKx23N3jnAp3iGgRyNzOqKQ7+E3G2kJ0YPEXFdCg4f
	 e+Ou9/3sbEG4CTsJqogd0L88WSwZbDXX1ruTSJofxXBllyBoTtRPv4Xqh3HIJf3NA3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0Wd96+k;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF6606A330
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63AF6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0Wd96+k
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3863db981d4so721723eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188550; x=1795793350; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vhu55Pzlkvmu17gxKyXMYj6pL0x4NHh7A+EQNL/WuaE=;
        b=p0Wd96+kVxO+guCcOLTA3P1aCqsrboHkh+kTSzEiBzZoMdDWNL0IRclccjhpyckfJc
         IXqF28qsDzGOX/9JY7UHAt4q74bcsiQ0x7gFASbjovtNoLbw5fquBA2d5iKHOIqnQb7L
         7Z817vRmIL2yC5utzdLG9IHGb0Jxkzo/J9/5j45bPHV+AErU8z5xGVT9o3HMEWUbh1ox
         552R21qZ7DloPUa7b7ZBtaQ9Wlh+V1ktcaoCdp0f03BdArzZys+GYap3o87DTiHuOuwY
         a8NrC+yNrQRHhv/T4rniZThQNDlywp6xKUSlWJ/h4GMisQEHQNi0pzC6DvmqFq7atwQe
         Ircg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188550; x=1795793350;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vhu55Pzlkvmu17gxKyXMYj6pL0x4NHh7A+EQNL/WuaE=;
        b=SqV1Nw8SaGJ7+iDp9I7lz5mVB4/q/meFi699ePubKe8elTpVcO+HGKnGzei0soX5ln
         HKFB1Sef8eVPA6DDr1yQFwaGO/7mB9pFBV4ahT6F3YXU0VzRgkjRcM2a8JCURAVQ5IG3
         1tDcrU98aYylt9rm2laVUWgwjkORwUhcFSpIHgWmwu+Yilki67D4MsQnYJtIGVJPUWoS
         97RnlhircUEp3jHw+0d/zLyP36s0lwJ+hNctf587qVZG5qgHR0xwEcjTJo0vfI8C94qi
         DQ6hWMUdfwyWWlL+v9+8ph/5pEz/pY+NeO+1o4Ku2sbmXVtArG7YFTIIs/5PfaCY0fwx
         8LlA==
X-Gm-Message-State: APuU4Z+7jdPXyTLBPUWMgqBrnp9kicp5oYeL39MSWZxR0VzizZ6K8bdb
	tYicgQlgy+7g1F64wFIrLiecUjdKXSA/+UqjfnXbwPgbY3jvtx5zKpMc
X-Gm-Gg: AZFdTZeBKGCPfQ/4VNk4BZEu5AEZLYCjuSwbEk7JK9QZ7S2cUVjN4Z5CJedbrBeDANn
	y9mNSvoZ9Mcqiczm4hSNZtxZhb+t9yqFX53CtX6i8HXLK6M3uT3e6ytSfxXwlIhmal0ZeP69wT1
	8YtEel6AjQjFqq8rACG1IffrzUHKDR0PtByQC36dFqCvv3MuODHzGfaTuGIpmiS5yefGwpXPSPE
	HklOltEiWe/6DwsGfo/dIFAYM83EH22ziBpcJd9gOtbzglNnTxcOXeUhy8dsxloEyHD+RVa2BsF
	vQ9juvctF1ccZv0mUvh/caZuIiNrzawrghdTlF9VAiAPNzh1cM47U80lP4ydEvhQZ3yOMdjMx0L
	CQZ/SWrOQhiUjZlPxzIHTdcYlSaC+5BxRTL5psIYnW4VKoXUVrQ28m9+3r6faYZzkIuES0XCFU0
	+akPCfySAsxbCgyLM58r4d5ayfwdGv0t7uLYAdwyV16WGVlMslPq+RAJmK2cFY7AzDTpGIXQ/KD
	5KbH9qY1CTDGwLhpHn1F7nGZGAnvgEqMQSTWPy66KRTqzULBpMl4Q9SbXdbrdM5gGXMaEg=
X-Received: by 2002:a05:7301:4309:b0:385:fa10:ee3d with SMTP id 5a478bee46e88-385fa10eefemr1888740eec.19.1795188550101;
        Fri, 20 Nov 2026 07:29:10 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm7705635eec.25.2026.11.20.07.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:29:09 -0800 (PST)
Date: Fri, 20 Nov 2026 07:29:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-Reply-To: <av7JE91kbL3gf8MS@fedora>
References: <179505868590.3571070.12381528230330714812@gmail.com>
 <av7JE91kbL3gf8MS@fedora>
Message-ID: <179509928313.4181850.1728907555340063150@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 06:01:55PM +0800, Hangbin Liu wrote:
> Hmm, should we also check and set the bond device type back to Ethernet
> when set mode to 8023AD?

With this patch the leftover type should not matter for 802.3ad: the
mode can only be changed while the bond has no slaves, every slave of
an 802.3ad bond now has to be an Ethernet device, and enslaving the
first one turns the bond back into an Ethernet device through
bond_ether_setup(). I checked that on this patch: a bond left as
ARPHRD_TUNNEL6 stays so after the mode change, becomes ARPHRD_ETHER
when the first Ethernet slave is added, and comes up fine.

Resetting the type at the mode change would also make an empty 802.3ad
bond look like Ethernet, which seems a reasonable cleanup, but it
changes the device type outside of enslave, so I would keep it out of
this fix. I can send it separately for net-next if you and Jay think it
is worth it.

Thanks,
Kyuwon Cho
