Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477272;
	b=jKdI+SGvV1kISNm9Zuk7EJzWwp+Uj+L9o4ekwd5+cK2iZ1l1cGG8PRmL9DLrHbZuClsl
	 GtVFMQPHMuaITRKwmx4h68pHkkCo1EI3sdVpyJoknShCYwdFcZzVXIids6+bfPsy0jG2T
	 7U5yA13slMcY475/zV/gXHwXpqnhHhQoS0OKMmkbpowfuDFgSNQS0dRu36n8/lJlhB2tO
	 IKF2J0IlZpEJ/R1MaKfY38s6vlngRzRfH02XGXMSw9FkevuNC0LuiVKbGQ88R2k4H+K4Z
	 KZuRwPgsnKPqRl5rT7f1DW4zfSrAv++/YTYkVefMX26h7RY/QlyELgu1nPbSnijB0KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
	b=mOnKzVoMli4RRB6sNEwJ8YRb2zVyoK5uHU47NqQSY/GOgGeYgvhZUDcYjvI7aFdsovbY
	 wl1OllbWIA5fXmKu4f4n2E4/UZ+m0ZfMJvOlh+06XOTu/qQqGRpN1Qh8nEaJBZ0LmSUlV
	 TVt9szJzl6SzSjervjsYTjSCHqtZ5CtGrtVhha35G6q8ZuzApG778yIM+1sIRwWfISDIk
	 4R6A8Gi1nF4im8ibSRFRzpwiHPvIOq02Jb9WPvjcK433yqMb8orfcHOFRVt+stiyf0xMr
	 YUsmaXx9SeCfOhXeq7h9DIOMkkleHnkC6PiCSkc6YrAwVbk5VW11HoxT25/ptppAX2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYWt5XT3;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86F606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D86F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYWt5XT3
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c126f80426so3931265e87.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477270; x=1796082070; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=gYWt5XT3dQdvUniO8+A/+WNJltKocdfgxkgNxZe8u7HVwfNGB6CA1qdTF5017B6rnb
         98PanKA+f1HpBkUcmRqPBdXcFCc3FJI+Ug1A19doLUqC6V1sNwobGVwzJE6zsYqVfLIg
         3W+Dzl6vvvB4YkIzAagXieJMiasMu5GxJBNDkvlc8o1pvh0iZDgvreteWtF1XXdgjG+j
         mIa5mYRLJHka30/ESkNougpg5hX5vQlZab6K5pePpngpPUfUN94211ZkVeRX2C1rh3Wn
         pzXRGh064vXiStuc9IHGJyKV9lj2DjOwgitxM4KN3rwsO/lYRek6kxgoDpqN3CTvzArP
         E4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477270; x=1796082070;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sCs1EHW+8IerzbWNfyv2UgBTw/vhw4f3rwKGqlZg4g=;
        b=JrAS8z8rHJpJmn+4O0vLLtksY+yogaU+gAIcNFnCCLJpZYJEKb8qnf4u0BLnhoZnpu
         YxNlYOG52R//U8rRMpa5he+B3iWLo4wbFHF2rWiThRgWmEDKEBL2mwUcO59Ol3X7jdLe
         WVm39Jf3LVIGuKrKpCRpEwzcHlkYm5VsHtrzOAe2QCsOWYEKEX/TDGns2EJUY4HQFO00
         eCMd/Dsp9LZd+nFLSqLLiinyM549xbTwdOESksJhkFDQ7F4ycL5HEKyEw5Iq4FLzvkkZ
         4grXDMtAJcKOTShEPvzeyq+OD7Q9+mDaXw6h6v3B/D9er2G0JhZgeN9geOr815sQhSG+
         RWog==
X-Forwarded-Encrypted: i=1; AL+hErEz1/2eEM63YwzMpR5dgKzovtFrppNdSg7AQA6ibCbQ/AJBm3gT4VPEnCh+vjFMmyv0tign3Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9puAxFjaGj+HxQwbb+3cLACiJpWdJ38ePmHZo9rF1+FtFS73H2
	7TZZfuth0SMDJPmwOS03fqq4kioXpjSwrx+uBZEDR+oDJqi8IgnevLt7
X-Gm-Gg: AZFdTZdcg9MKx3N2FKtoYlFU57izfeLMkFIZ6JBbmVY2X4BckjWqQn8dnrboPI4mCvx
	9586jVxZziA2WRDDEMvy84JuxdfsP/ENRIt7deSKxNkqUQDY4iA49VxSykgg8w1Xkloaf9HJkCq
	NUp8Gy1rmI+q8A/4OxhQUCtFO3RCRW/fMKbibMkGVW2FjI7qHFmeewdmIpTCUzAqUwCs3s8dzvY
	hFQCv0BWmv/wEnx6YzH32vvKAj1f7I+wMHUbBxAckOHJsovcKnDbX+vhPfTUvx8OEvC4zF+XBLs
	DicQGkv82uOdf77t1Yvf3/zDuMB00KvAJ6GT12wALYcBAMPAbg2SBYaiOpv9jIlAhmwx0x0XXhd
	Mjm6twp1wXOglJnn5EesypqMqarz5gR6n5sC7OByQHuWpRYNusSaK7KEP6kDoZUT2pRUlO3ua36
	vYNReMvs2fCbhHQ40gVmm+kMtKUKIhv5PWPw30HkMakyIQ9sbaJ2V0Y+OwjujTLtaSZDqHLMsVD
	hmeETAobRu5qO5EQopCpLlmovBp5LGhNDZ9Vh92LfRg6LxqbFXXGUjL0xqIaAgKz2B4pHMnmoRY
	qv405ci7yVzbOfbAyttVwJCzwSmwxRgbDicyzgqckJEoDB7OO70N72U=
X-Received: by 2002:a05:6512:124d:b0:5c1:56f2:fda4 with SMTP id 2adb3069b0e04-5c1bc89530fmr3136762e87.49.1795477270244;
        Mon, 23 Nov 2026 15:41:10 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm3314217e87.59.2026.11.23.15.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:09 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Andrew Lunn <andrew+netdev@lunn.ch>,
 	"David S. Miller" <davem@davemloft.net>, 	Eric Dumazet <edumazet@kernel.org>,
 	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 	Linus Walleij <linusw@kernel.org>, 	Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 4/5] net: cortina: Add CS7542 CPU network  datapath
Date: Mon, 23 Nov 2026 23:41:02 +0000
Message-ID: <179547726260.3.2509837092976108381@gmail.com>
In-Reply-To: <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-4-fdb5e8c2d508@gmail.com>
 <560efd8b-44a6-4b3f-9f88-d1a891b4f253@lunn.ch>
Content-Type: text/plain; charset="utf-8"
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

Hi Andrew,

I removed both module parameters and the unused internal-buffer alternative,
keeping the previous external-DDR QM/TM default. I could not justify weight
16 with a hardware requirement, so the next version uses netif_napi_add()
and the normal weight 64. The .c helpers are plain static functions, and
ndo_open now unwinds through cleanup labels.

I reviewed the flags against the core transitions. opened publishes a port
under the shared TX lock after IRQ/NAPI setup succeeds. netif_running() is
already true while ndo_open can still fail, so it cannot identify a port
that shared completions may safely wake. Clearing opened under that lock
before netif_tx_disable prevents completions waking a closing queue.

stopping gates the single reap timer shared by all ports. Last-port close
sets it under the same lock used by timer-rearm paths, before dropping the
lock and calling hrtimer_cancel(). It prevents a running callback or RX
poll from rearming during cancellation. I retained these flags and added
comments explaining their roles. rx_stopping separately closes the device
retry/IRQ-rearm window; napi_disable alone does not join a poll tail after
napi_complete_done().

Independent built-in/module ARM builds without the platform series pass.
The revised driver also passed Almond+ RAM testing with live NAPI weight
64, two load/unload cycles, 600 byte-exact UDP echoes and 20 ICMPv6 replies
through the normal DSA path. A separate internal CPU-port diagnostic
passed 448 nonlinear/jumbo frames, including 8192-byte payloads. These are
functional checks, not throughput measurements.

I will collect further review before sending v2 within the agreed cadence.

Thanks,
Fil
