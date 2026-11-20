Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795213179;
	b=Zrkp8lCJ2Fca9lCuuBfkNs3dxFiPo77qlH/HO/IDbctwSig3dFLCq6qpXLiR8ywvGR4p
	 HZ3Z6kKRWXWN7clN9o7/2FekZwDuzw8pYVpcGKIjFfHTnMLMKRk8/oKcL54YDTCJlsanI
	 tuiRHFVtCxd8vsYhpNYzwsY4BUk7zSwnTrTT6W2W4vPNOQE+5/Ce2GBeEnwfoQcu0vhCi
	 Dsc72a/k1ZfNxGP01p7kvtlMPRhcjJbsjQInTFnsR//sLYp/o8QiOJaSsulFwigSCwUqe
	 efxVhy7U+ngMlMpejjOcb/7aWdcPWmOLmduIIp3KMhBxqDYf1By2RsJpz2ngNTOMnPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lyB7pBhelWiMZxoILdMDCkgdjQJ6OIrw6GhR8XWtqsw=;
	b=4ONAHGUPjxec0WTo5gdxBQGbDRl7D3H1fUQBzMQRB+mxzoPI/oc7Pmgj+VijP6jPr7Yc
	 xHhlHiCaBVLbYeTqanHBesNe2j3HtJKJf0YxHOK283Zjnn44y43TJ235/oRM7QIzFD/ss
	 I3TVWLzxVwPMh6ijfo59NatQ34yJ1GVjmeFGUcrSZwXc5UXQC3V2/yGdEVIGtk/V+INe/
	 FWKhJNPb0kgGsu5MD7xNsr6NpzpG5JBCBAi2DPZP+Te+oXplydum9dbJiqptDVcObHpVE
	 ykSflVYCwsZiEun3CzB5YU6BMOZjsf5ie/nLNsQ5vIQePtwAEN0rM/c9jnysdkSqMRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Feew1EaK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E0606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46E0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Feew1EaK
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so608760a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:19:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795213177; cv=none;
        d=google.com; s=arc-20260327;
        b=Fx/9enHK4xJl7ZYH2EHrkYx9ETI1MuI/gjdi56LRSOiqnRHgwTyehJI7AoLZIiVCK7
         mYc8o7oFtSUw8NNJvEf2ObaXQHMiwJxWWermT6/vgiH8uBE6l2N/dbOHGBinZn5Ks8xl
         AJ2zBSQNXHzik7RVyP7oZS9pHAtuAur6q0zQt1LGmMa8inz3F0p5RHYwCExmNkOfxgYj
         HjCpa8h3dmOlmFCsMKMsE8S5nrTlLYrX6zLink7KmSa+xfQoW5gXiCRx4qC3sZSlxXpL
         +uaL8sF6/kAOxY+H6w5ZsNIgiLlDpDDk2ja+g39R23JpMiHTxmB72agAoa4gWMLIFULG
         dyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyB7pBhelWiMZxoILdMDCkgdjQJ6OIrw6GhR8XWtqsw=;
        fh=0fz5sA3ex2UmhfI180dxsUk1HHdgoBlFm4y8ASGeL4c=;
        b=lxgNSaS+hPk6V0+1yz/zHoLjSHsMcWNN9nZxhxjQ1j/U2E+doglyPxSrnO7ZD+Cp1e
         1A3lKvAeWBCnZ2xGSGUwLlDdyuCAk/N4hh/CYrM/xGu5UYmmc8etfU70MABvJe4/TxYq
         yItJAfQO4xPdvt+sV/I7BqZJK9LjjqyOLC6rJAnBWdQdX+BFXntPBeTFKZ93V0M0xvlY
         lylw+dFFO+JqDF9bABKzgFglDdiwuZj1IP9WvPcflq44/MtA/szMvFVMstWyUYqxdQAh
         j4HXUm3FO71oaRoXFF/zZ5Ki46VAgfAtyADeQH6b57o6o6LgG8IIswVyI0Q2tOeiFqrN
         kbmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213177; x=1795817977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lyB7pBhelWiMZxoILdMDCkgdjQJ6OIrw6GhR8XWtqsw=;
        b=Feew1EaK7N0s1mma9t00+LZMVwCs0/T9pYThqqLOqmMw6zRnYk7QlKhRHfUr4B0Rss
         6YF6+fP9HXnRArF/rYopiqOWX5YHsjT8uZ7uQ4BkTSFIL7sDdidBNEz2+ELf636/zh4H
         3kpGhn+0eCPSiCL3Wr1guQmDCZKh6hbC1dqOLwhvuJANvyPGxXhp1yiQFLRx4BwvvXn4
         0YR/kK2MK746Kb4BFYVCt9TEQCiIo+pt+5pvY+X18VkN6/kGDJLEFVk7rvGOcTq4+XLo
         L4djyDg0Ik6/OBxF13h7Q8UoehUzGSIJxaC6t2TiAQAW9MOzpHleUGdrS25FVof30Shi
         foag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213177; x=1795817977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyB7pBhelWiMZxoILdMDCkgdjQJ6OIrw6GhR8XWtqsw=;
        b=1fAh0nmx0/bmgtRI+xe6FTGNcBLG6/zXtt55z4mPIKENG/7fNstaw+d0rb4JMEVauc
         681d0sMfGXsggf+PL+iVGD3n/sgU0+aL4Fd1nmYW2ipKv0MA4VQB8BVqy6AbFQLXb5me
         6frqr09k3sAwaqKCZzyWWMbRp87SRB9wTojGdHbs1nWDlr/jQOumnkYGWoQsFXmmB9b6
         xLR2ANOU8+aQ7aOXzWMpv83AN6M3FiBlFElggFhu+t4SOTwGAFqoM4LJBdEVVwjh5o7W
         p6FcX6SJUknS786KenIbyxdhhlBnoVidgphHyK+zx4bzMFFOO4JhiRXExUMZywNvriO7
         4hKw==
X-Forwarded-Encrypted: i=1; AL+hErEb/GfefMcZdEtC6la4P+eKPJJByTfg334inY1GkPJIult4qde5wYAwrJJw1h1v7AxjdkCalig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5wwDj1u7mVf6exKHrB6M8MDiwV9XAcUnBaWBgqY2LBczdlVEo
	x8dY7lWyS/4rjecl/HkL2pJUh4XDf9cWiuuZBHsOanKp8pUHNCkAhx7lrWMjlvdhTFcGigSbPJR
	ed20l22lDXosrKzbNIXTGwiSNlF0/gKwSJAYrhMH2
X-Gm-Gg: AZFdTZfhcW1hS92pe+ZBCfJcWs3P8GXP+wcqYW4lzlX0Z9NLN5zHd9lA0FencipXTbR
	Go0qatY+/kdo8gqFKyWxAGXgg/xl0PTQtPMFFGde9vBTbTLiOCbW1wDU/yahnBJnPIeKo6XRg1k
	mcXHfVYqyvOJLJR5twq/+EL9OxovyreA3Jb6s62foW0LExhBm7d1bfDo8x/0zVEns+Yb3s13t1v
	JUepMHG0d3llk2c6CLmY2k7KE4rURiadCuau3VBU6sSqDK3ubcEOEEBYPyQVu4Mlh7QUlp/nr+0
	cmZ6vGEKy2xO+nLorv7txkkyvcPhp5YcIM3Y4iGGpEn85OYnaYDxbo7nDXU4Vj7sxEREdDPi7a+
	YD5VYkgsxH0kCDnJH2Dax2bINpExIB6ze8UF9RpTqTawQAhB+vT90jQbXSOJEAlrZbiSbSA==
X-Received: by 2002:a17:90b:5346:b0:3b0:9976:c1c6 with SMTP id
 98e67ed59e1d1-3b41c9bbe00mr3841890a91.66.1795213176411; Fri, 20 Nov 2026
 14:19:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <26fb4276-5615-45fb-9cb9-fa5e872d8e7b@kernel.org> <0469d224-3baa-48c2-9d28-ac0d9fa2ec73@kernel.org>
In-Reply-To: <0469d224-3baa-48c2-9d28-ac0d9fa2ec73@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Fri, 20 Nov 2026 14:19:24 -0800
X-Gm-Features: AclHuK8oVuADkC2YXI4drSb7odw_l4s27U6niEVD7WV6Nn9XTJ5BynoS6ANasOQ
Message-ID: <CAHwYsirFS4nAuvXQA-eOgqq8n=29tfvvUvuk2QygrbCt0pcz3w@mail.gmail.com>
Subject: Re: [TEST] Google's Netdev-CI: missing results
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Sheena Mohan <sheenamo@google.com>, Netdev <netdev@vger.kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthieu,

On Fri, Nov 20, 2026 at 1:08=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org=
> wrote:
>
> Hi Sheena,
>
> (+ cc Pin-yen)
>
> On 23/10/2026 17:52, Matthieu Baerts wrote:
> > I'm working on the Netdev CI, and I notice that the runners on Google
> > side are frequently missing results:
> >
> > https://netdev.bots.linux.dev/flakes.html?tn-needle=3Dgoogle.*vlan-py&m=
in-flip=3D0&br-pfx=3Dnet-next-hw
> >
> > (Look at the non-coloured blocks.)
> >
> > Is it normal? Do you mind looking at that please? :)
> >
> > Note that when an active runner doesn't process a branch, we cannot mar=
k
> > the whole batch being validated as "not causing regression" because it
> > is lacking some validations. So when this happens, the end result is
> > marked as "pending". That's not an issue when it is once in a while, bu=
t
> > here, it looks "too frequent" not to be reported.
>
> Lately, it looks like the situation got worst: 3 days without results.
> Because it is blocking all the other HW tests, I temporarily disabled
> the two Google runners: results (if any) are still fetched, but ignored.
>
> Do you mind improving the situation, please?

Thanks for looping me in.

This was caused by two conflicting patches ([1], [2]) on the mailing
list. [2] removed .resizing from struct htable, which [1] references.
Our runners currently build from a full distro kernel config (which
enables CONFIG_IP_SET), so kernel compilation failed and no test
results were uploaded.

Results for google-gve are being reported again today now that [2] is
no longer in the testing branches. Sorry for the inconvenience and for
blocking the other HW tests.

We will update our testing infrastructure to use a minimal kernel to
avoid unrelated build breakage in the future.

[1]: https://lore.kernel.org/all/20261117092731.14656-1-onleaf322@gmail.com=
/
[2]: https://lore.kernel.org/all/20261117101018.523826-1-fuchen.dust@gmail.=
com/

Thanks and regards,
Pin-yen
