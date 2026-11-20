Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201604;
	b=E9bjP/wSmhCRrFyVV1vxJ/PF2/5XiPDbI5GDWdEw6VSIMtUrvfg2pzGFU0cT7t4kVd4G
	 F7w/pwg0W9kyQR0+QmPT7er134+jPOfSO9BD3hpErH/A7u81dSq9wlZBJaSOoceFMCo+F
	 yGthoheHDPdRbztaXhLQg8JFNkE2A+exxxFihi4EyyLy24Mgx7I2naMLnmiuAnfJPGnIo
	 Z2Y9FxwW3OuEXrvQLYgKFRmv2CSGTIHthzaOhf1rp/I24KFRx+XU4fDcmygXXxhTGWx96
	 i0gfAiFlW0S5DzIhtqtOf594s1zyHvEKA+U57iLCGy0IXOJJ6j8dd9KixZosLc4ZHxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=9QfCwv6q8iB9+8896+uv5bC3BHslVLQP8NmnilfJ2Qc=;
	b=4jy3gD5Wh6lZz8Xd4AIHACpV8NnVSOfyUEMcaHxJbPDCwz+/+IWEdhMOwTBoIBKFPFOI
	 IVxkZtAmviokWvGGeDNsFSTyLm6k5Oo3SQAyj21CamRJIdCvgOS+sfh5IoBW74pXeZR46
	 KaJhocdKyjfS/RnarmXUQwOAmyqx2Y96NIiYQggXu41NgFwJ3xbVrtCdi1lYx9/r13qNA
	 O2Yf8okrxfXHII9Pe9wJNkAgzFaakRK+h4ABjryuAsOVvWWy8Tf7ptW3MdY6P5jPHVfuT
	 nA1m5AFG0OjXUfDN+k13VenIvkxec/UBZrAksdpVVehpuZSmBnh6trjgX8KXjf/6anA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDsEEaoV;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255460A262E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5255460A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDsEEaoV
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so614330b3a.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201602; x=1795806402; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QfCwv6q8iB9+8896+uv5bC3BHslVLQP8NmnilfJ2Qc=;
        b=rDsEEaoVpoGF5GrKMVL83T+4DUsmLWwaxPxh/QQP0I76AxwjNRSBrN17TOAwnvtjgN
         aGJiM5gFKm4PRR7xzz1M51+5BNgZS+pOMcrSJEOsC1yHKy3lbEuAj+ipN0Mmtwwrdp0J
         fL7/sS3OBfIEriTYlzRyXBjRUF5IANPrT8dwImYQNp3Ca1E05Lykzw9O8TZcHS4AXFuM
         Eetzp6T0FSXtQIctMqOBQ/VfQRwzYiKNlAMFzUeimkG5jqCvFA9xZE8hBlIQb7tZN2hK
         pCoTiGViwfYTEEspTXrQu2cevVCBnfXkrRGbEG4Z6tUWo44I0QEal3Sg7NPENzYm37KJ
         hAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201602; x=1795806402;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QfCwv6q8iB9+8896+uv5bC3BHslVLQP8NmnilfJ2Qc=;
        b=K9bX5modnSxGgaQu1rGrt7NFPWSBHJEkapGEglEDs2HCIcvUSGbfwolPJuI3n45rkc
         QYrSJmtOhgPIqIcMY/dcLWtnpjkOAzhDLls6uHEOb0So5SlX+u8OuQ7llz4yxqK/HjSq
         d88uxucHqZVs8u37hFSnRE8W3h2wWGHG0ODvrH9LpMONRldRmEFEfq85LJdoqljgtGCV
         RCNq59QEDD3fmQZw/3kLp9yttaqx5HFyJ3xhCS5A6Cn6cIexf42hQdxyr/f/juW9mKQA
         1XpNklE27I3lqYkwtNihWEun3AEjy12xmUAPw4q11Bf7bvMUxlIa9fTdLy4KCLsHvljo
         r37w==
X-Forwarded-Encrypted: i=1; AL+hErFNxr/Kzfa+GRhUJvep5RZdYrgGM9HMQUZk108F9NbaRdJkrQj783FFLc290XWLawkDDtcK2TI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pUm8Dc+ejHGTk39I3OZp5fL7+I2G8U+/0KnBbF/MpQfTahOhb
	vD51OJZ673Yl8NspSDcYqIPHiMoz/m732XqOiULB19NE17OGkMCfoJBK
X-Gm-Gg: AZFdTZeG/7Mh4xym0SWvh6QepHoSQUTupHR50BwjzTQVySm/c82AkR0xWHx1pSXRh5u
	c1xiXc4uYaUxgw4eSnKmqPH2q49lskjGyZ7XI+3eLtGECUpHqd7mTDGKGjjU2N9c8tqw1xude+n
	UZX5uhsLFEEEqP9iVMw/yzuoPkAOEvI1sDTI/gEdnIJlKOa75oumhJamcjTG4wDK83aNKE+eVPo
	90tBgigWIYDIGSFKBmOfo5VRMQVnD6c3B+LJbkYw05kIbLgSj9RYQAMydmrdrv6jvfS2KChkdLP
	6NuylGw6K3tsuwn2HecO7/2a6caIvYJMQLxnn83iaxWY1jLAgj/kUc/bSMc6q4OQ7yRIF4mBbfD
	JuX3ZSFzbsGraW7fRZRctg9de/RHswoZkmdy/BzPfn771ZlZsbRT0QJl6RUMC3dd3cYhCUffBsj
	qa+l0EWK+N+nTNiCnl4Dco2kIcUn5Mvwvsv5ksXfk7CmVdeVMoAyiIQfjL2FG3ESmq46buh5Fmf
	eRygB5KReSkEJRrOeqVmNEPfigrDi1eDvKtsKOhmGXXKu7lSg3ouZdaWlR522Hc0uYIW/Sdpaup
	vkNDOfNxD4s111KFrPg3/1PR/Hi0+HLLOQNpbP4mPzeAGELdA60g/ut6KdTpGjSzVhxS8mi9dcs
	lWk3WZvU395hyARWfreNnZtBq8cwaxNXhiw==
X-Received: by 2002:a05:6a00:1808:b0:89c:1f2b:a73f with SMTP id d2e1a72fcca58-8c87bcbced8mr3885525b3a.17.1795201601384;
        Fri, 20 Nov 2026 11:06:41 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm1956161b3a.18.2026.11.20.11.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:06:41 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:06:40 +0000
Message-Id: <DN09UU4NHKLV.29WR92GGDPBP5@gmail.com>
Subject: Re: [PATCH net-next 1/1] net: neighbour: skip the stale dst lookup
 for a redirected skb
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 <bpf@vger.kernel.org>, "Jiri Pirko" <jiri@resnulli.us>, "Victor Nogueira"
 <victor@mojatatu.com>
In-Reply-To: <CORE-J9UK.v1.r0.20261120103344-1@mojatatu.com>
References: <CORE-J9UK.v1.r0.20261120103344@mojatatu.com> <CORE-J9UK.v1.r0.20261120103344-1@mojatatu.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 07:42 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> Skip the lookup when skb->dev is already neigh->dev; the parking neighbour
> is the top-level one in that case and can reinject the packet itself. A
> dst that is a route via another device, which is the sch_teql shape, still
> takes the lookup.

It doesn't. The check never reads dst->dev:

	if (dst && skb->dev != neigh->dev &&

In the repro dst->dev is va, skb->dev and neigh->dev are vb.
The lookup is skipped. teql takes it, because skb->dev is the master.

That ends with 3/3 of your teql series:
https://lore.kernel.org/bpf/QDISC-6HS9.v6.r0.20261119070330@mojatatu.com/
Then 2/3 of it and the lookup itself can go. It can be a follow up.

Acked-by: Alexei Starovoitov <ast@kernel.org>
