Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641314;
	b=0haOfa3oM2dZqadqtl47N5yeEgsDQIlhqR3X9sdkQ9SNVZJ9CfMsL1Ei4VfS2xsDZUk1
	 BOmZTmyc69FzeYJ46MZ57V39NLxquLrVct0CHmbDqmKpsonGjQqAVQpb7+zmqaq2peS64
	 gy29Mzu1OdJzzFjo1FhJ3WMmYxWw4cKf38Q1kSjtR5pmhjjcPf3BEAvYd/INuW06tqq/h
	 w18Sk0wJm7+drojtjbVLKDGtZPsHDBq7bEmObbScVxgtN1YsGrg/Bvp6gjZOOMDdGPj1K
	 xs3VkFqXwCUUZZq+AqiPNc3cYBpMWoOgDA0ebdzsHjOJsh8vpKX4EZslS/bfThzAFoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
	b=fC0IXNNyNd4QnBTuyEXe7ghAyw4sYMjJ3dfMaN/KyvoasH+YVNL2UHLno3bN/W0hSu9z
	 dYGeCzL5Mn2KP2c82fekq39W4hiT3GN7zbjEDzXSpe1/pmCTdchxUADrldr6G/lOzOKnB
	 EwJMYX1fOPNJg/Tq5yqnETEJU+uz+095KuTss5zfZlFxFTeeMXSSUdlISyJDU2oQxgmxA
	 jirGLIjNmsaIxd4YVVcWsclfw/QuIWsioY+jHEfIskKpNVbNc9YqZWTtTJISfX6WSPldE
	 dUMtAlXyBwDiXdQ9qt6F2ejljErpJC/1OwhH550Ep6gFcQ3HEw/+/OIrTrG3gKVVELw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFZGa1Mu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90001606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 21:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90001606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ZFZGa1Mu
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4d26094beso56275617b3.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641313; cv=none;
        d=google.com; s=arc-20260327;
        b=gSS9ZlWzwZGpT/DiFcoRl9tDYSF6jDUAwrY/ESYEmQekDuqQA9HTZaPhrmmtuJeTy2
         TxUhMbnsOeW9cJyMqxmkahAAB7LrTgkOPu7VrA48uM9ZGVbC9DwlvrBS5ZMWy1k0gAig
         Kxj4KCBkQjzutjDaDvrdQHCsagTJEV/y+SELYmprA77wpWxzZJhR3ceApM9Y2RVCj75J
         yU4noDFQn2URmkCKI82VB33oFEFk02jUXs4GDDPVlLkmFTx7pt5VSYoDKrPqMpACNGN8
         Sqa/f2VtV7kJCWGA1gmUdy3Vg/eLkga2a/MZNFVccTQNY6KbQncR2fXj91QZi+LtZUXT
         qJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        fh=nhYgZwIly7AQ4zyqfnsyp0iPYjWwtQ+pzDGwTJRbBAo=;
        b=Qk0eimn61EtAyIrUPGXcW3cKMbGznvtL85R3YlZ9g8mxfh7j36b/Q5lq+DgorSevSJ
         h3LVXIgarp35n8PFyJ2W1c9jnIqn4EOTPAb9mYtP8JetieFR7a89NPlxFIc85qcOO6EA
         dYwXk6er1WVE6vGxPkeP0sLSJLDHytqEsW2dQ0UURQqQtgjCbGBJlie4xgYfFmqdUuE/
         P82NOxmI3m33n/EHDeKndQKboepcJravY/kQM7c9icD9Jr1lUDatFn0tYsF2NZRKydYp
         PAWSB/bfvvf9YNbzrY7vDZvHmk6mD8SQ0amOH2OtsN4hdOlGEyyXuTaEQuQQTsUJXOO2
         sryA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641313; x=1796246113; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=ZFZGa1MuixAy7IjqsLRjY3SC2wAYhkVYCbqN/PVHdn1TM6cmbtD2eRYhqN8A+siVVP
         btUqX/zenGSbVIfr02R/5p+0+h+5DzzOrdwaY/Gelrhz4Vx6jIZfKk57P1PkCT49sU8x
         b3NiMSXkhqHdA0ObMv+/ZNPMqaIR3PVmzpf6/hwl9/dvbvOCH1caXW56EXHVRxrh44Y2
         9LjVNlPYZwwZt6QTPK7OElvfcE09PMvp/BsN5xFr5rpQ3/ySs+4K73CK0Fb0PikHcIG0
         LovIokxWXQN7mPthNCukcvqbGvJBoG4gjzp2fUpJCzr1kcepNE3+QV6ajRdTd+P3DNMP
         h9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641313; x=1796246113;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2Q5BQdNA5CO0G0HRlTvOkzonEqCKg9Nq/F3I2z+4W8=;
        b=BeD0WwabPaXR6wI9NhbaoM8MZWUUfQKHbO+SX9dakSsxVgyShjZNKOVJ7ineqfPc+e
         H7KHuoCzXoThxWSzvocCXTMQQrCVBPj0uLTyDEzHgCbuJt3MRZgaHYPcKfnwJ2EdyNwb
         MIWOE8o98i+pHRK4/BWhMCameLbU5zfPxVSQ1vc8dgN7gCai5j8eVMX3Aa8ynWb5dwsW
         Luh1vYxP9sP0FT84U5hI60usJVWZj760/z6OiHIzmsTX3Sfq6EIVXNEU0C9dNpkJ0M0N
         SeonjktAgTUiWU1+JCCqEDAvPgtgs8ukp65YA6PCMbF6kiQaG1mhizAdw/U8bWz9L1IF
         UfuQ==
X-Forwarded-Encrypted: i=1; AL+hErH/1ZWi38X7YtP1/uMkjOWJ3oYffr1H3KyVLNyGhvJTHGCo0TVNjN1QenZ3LgO2umWVTY/51Dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a0x36ERYX5Vj6sF32ZurZIuGWhFMwli1O4iHWYXt+fwzoEbgg
	IIQVyEhil8D4XMzU5jESOCLBw88cKsRgSsmzPqs3K+fu10cCQMEydNHnKuUnVAwRsObeJd+UV4C
	vNeD1mS6ZQTbnrLNsHwotSBr+5uffIuwo8JXRsnptPg==
X-Gm-Gg: AZFdTZdWgtRuWW97GGpeXxwNAsztJzHu4MqBD0Qz/sOMD0m7LML9iy4JXFEjNkCSQ3f
	V33S2ho0+9INngVd3PqOxK5v1Mleh+ilNBfyzlU2GyCORDsqPuI/kIWId46FNLDXWtSKR/6nSgt
	JP5tmVVCmjoVwOO4kzgxf9NaJK7c//z8ikpmRUTeOyJJp9xkb14bPIA71LGYtBajbOxEp/RvmIw
	UbmNbqNn9C2GJ1c+u98QJUKDkMCJYa+nmiQjnweQrFoZ8cRLKOFCWsN+wJfrJlnxhVutslXBLxw
	qiXeDl4WB4Hj9Q1e/RQOjTTW7365rikWY2ba6Ili45DPR+z46siQ313EKlUSa4xb6Fwu+ZrQbsQ
	mgJpgI/5xzrKRZxx8F4SIsH07Ir7b39kB3M/18fV+EjsAIf8n3+Lshxj4IHYh/9n/G9u6
X-Received: by 2002:a05:690c:4d41:b0:8b3:527b:d18f with SMTP id
 00721157ae682-8b520456090mr78329377b3.11.1795641313439; Wed, 25 Nov 2026
 13:15:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-1-ccc2a3a6cd09@nexthop.ai> <179556272605.3135.9300919500524716345@kernel.org>
In-Reply-To: <179556272605.3135.9300919500524716345@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:15:02 -0700
X-Gm-Features: Aa3M54pDddf1z2GThzIkP6Ya0YrZfZnwcPcCDFy0GPN_7KFQAEfTKsiiMCChi8o
Message-ID: <CAAv61uTjxQD6WUU-ZH1YG6Q_rOzPD5MKtAJvRQnmpm-nqFAs1g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. v2 addresses these as follows.

> [Medium] fix the lookup instead of adding a sysctl

I kept the sysctl. With both listeners present, today's result is
stable but depends on creation order and address family. Making the
VRF-bound listener always win would change that for every
tcp_l3mdev_accept user and may break some existing clients,
so v2 keeps the default and makes the new behavior user configurable
per port.

That said, I can change the default lookup instead if maintainers prefer that.

The per-port scope is intended: on a listed port, a VRF with no
listener of its own refuses the connection instead of falling back to
the unbound listener.

The sk_incoming_cpu tie does not apply to listed ports: the unbound
socket returns -1 before any score is added.

> [Medium] the docs say more than the code does

Fixed. The docs now say that only listener lookup changes, and that
established lookup and bind() conflict checks still follow
tcp_l3mdev_accept.

> [Low] a listener bound to the receiving device also matches

Fixed in the docs.

> [Low] CONFIG_NET_L3_MASTER_DEV

Fixed. The sysctl, field and bitmap now exist only with
CONFIG_NET_L3_MASTER_DEV, next to tcp_l3mdev_accept.

> [Low] net_cachelines documentation

Fixed.

> [Low] bitmap updates are not atomic

This is the same handler and behavior as ip_local_reserved_ports, and
it only matters for a single write longer than a page. I left it as
is.
