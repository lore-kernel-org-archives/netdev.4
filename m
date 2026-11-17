Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932179;
	b=NYFtcIx5293QmxFdTXFzlwxGXSZ6Czc7E3Lmqmwdq5OdXfyndBqoiugCyD2zBliIMc6u
	 v7KMxXB9ChPTEGfIDgGfjBNS0bekZRZt9QoAsXMJyKekT52IOzdnBB3Qh7B/ZpmeHPomy
	 E1vld1mEWJX/yo5EaJXzGhbQs3zVhnoOCywT/Oqp+LI/Vaf4D8OWdDtCRkLqHX+16sCl9
	 61iOP1afaykJDY64UgAPbdJl5y+l5XYL9tGuKq0nTeFQzsrLT39UaHyNB3GYSE+0kAK8D
	 N8q6yN79gYYlZs43OIEFwClQnBi2tFJzvSKbHmGNtCUZttiBpoezzRW717q7kDaCpnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hz2h34D2UVi4lF1fkvfUed+mfNI6Bvl3fG3Jdcvoc04=;
	b=mtoYYQN/abQQ7XD3uGfE+70s3BVuF/MMk+/gKn8DglUMEfPPqKKb4YdBSCGqQtTUIv99
	 Rtstv/GncIb1yeiX9xcTSgYpGXv8EZk2MMSVj81Qs4NGpmYg0iTQM3m5qPkyGo7toUcKF
	 u5/D1nJlxLjaJzuNPd7K9DUM7Zxsmw6+PB6YcJP4GyqoKC/LQrb/LQ+RM2A3YQBx/tnbq
	 gEFawdaP1K38krfmeWjcG5WL5ejRr1D2EIspZOF+aLp5wpNNhya+v6ijNjZGaeRkXa8NC
	 wCgqCqYNCXOBdUI7AlFjyvdmSBkSx/7a34Vpxbfd0mK8MAwD4yQHDAur4L6uc98t/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eTRhz3yX;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E61606A331
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E61606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eTRhz3yX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505186727fso337154266b.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794932177; x=1795536977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz2h34D2UVi4lF1fkvfUed+mfNI6Bvl3fG3Jdcvoc04=;
        b=eTRhz3yXeGq7o8PaIB0KhMDF0Dgn6xXT29+EpPZuu+KBJKM7DJSi9Uwy8wzRCFNI7W
         3017OSQlEyeCV3+d/j+y5rDBu4rEIEyTOwoYBq+cSmRs59RH/sImL6zq06IAMbu/iQYI
         ksfUESf3RIuIn2XoXwvueHGogtL73M8xsXI1ow/sliepz6kEe0ST19yErFYOsqhpsA37
         pyrhL36q7ba+4qxqOipLdyPKTsgEzXwH+d20T5DZ6MQ/K30TDGLRfJ4FlMJTWy3taUNc
         e76cfal27IsHenpLMhlo2EQOqSCwL0AGkS2GySCa4jx6RI/XR6lXufXrGVFuRzcWQRLN
         PgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932177; x=1795536977;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2h34D2UVi4lF1fkvfUed+mfNI6Bvl3fG3Jdcvoc04=;
        b=pVm91tIVHSiFZVHIJ30u4OFC/D4+FxoUMUesN0IIMR/OCEbrCBJDXaPtv2/ut14qH1
         b3R1WyiYt/mUYNKyaf6MCev6SDljSYF2uRgDQKJ5lT8hKF69JBOBTYdNmkPWoxTGxWBk
         Wo1BPZiKlVtpeKbFZXYfSONTcQ2YH+iGgLSOuvgLGZ7g5jLI5CFiq7CKiNVNHpL8vQkc
         B/o9CopLXTz2wJt7huwqiyboH4cnblE2jVZkVEf2pAnX8yhWXAmrjPiMHikd/d9CVh13
         RKQsaYQIIxBIeisPgLTXrxOhyY4gRmwaTV7aGh9fxJZNVByjPsb94NT6HAVxce/CmErx
         IXpQ==
X-Forwarded-Encrypted: i=1; AL+hErH3BUjj5mzFhtHlBmmXuNQUzJihvEXDEr5sve+wlXRSAhU1XH8CheitnhEGaFg51RMDyI9PIaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1MbyBvX4Yl/wm6IJj8bF1SMH1El9nklNs/Cdw3VBAup7jxPI/
	927MMEoMDIkw3YUd3VKnJkt/u1oNnBCuth0hUosFv6ngf1+YGTIlxKyiWFtMOyg3ZS0=
X-Gm-Gg: AYBFou2dv/06PjjD0u/Trhm9muNxiXC10sWLRhBbhaHGSDfX+UQCIl4ZMZL6ungau86
	ZSOwuTIHlau2Hkyb/TdfrDcANzoPeTnqyZQ37vB6Z6IjHKZ0UN8Cy/37GyPmwohHr8NQBNLly86
	TGIlOsdL9YVtgAzZbpS5IaHOLjqXOFX/nAfE91oiowUU19lkHxDfai3htdDg/eGeLkXIctxB0vS
	ZxjTgGtQIeOK9k78hX5aWtTCWl2t0VM8jvYPJmTGPRsYxiOBgrqgtnRdMwTNzSCykbU8PfZXyJY
	kbAD4+sQO4k6omcExpuwRHQ/lRDoeA8PeckNQSoYbkECKeFJ7HMSc+ORhKQvZOb6G5tAyQVRCBk
	SJV1B+pIsT52GZWa0uZ0xiksCNjvaeHEzp7cO3WeQ8FqiqmmJckq/lIDNCNocTkflzv5R/1O1yJ
	YpWCUSeltMt2ftVkjs7R87qOiA5eFoxevfMJqh3qDRu0iB7uyqUCDlbmaoGAlqc2+H43+3yeFxM
	Bq0CifVTZ9KG4EkRpNbf0IP+UPo3ZN4+/gmu+hwmgPbVUeIBcTSzLyn06G33O6p3LuFll11hmFS
	7rsJK+GQZMTSKv1xI99qlGrZfOp0i8edrbbFtl3yYZDV4eM=
X-Received: by 2002:a17:906:4795:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c509636a806mr1177152466b.25.1794932177483;
        Tue, 17 Nov 2026 08:16:17 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm1746566b.10.2026.11.17.08.16.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 08:16:16 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: bot+bpf-ci@kernel.org
Cc: Slawomir Stepien <sst@poczta.fm>,
	ast@kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	magnus.karlsson@intel.com,
	aleksander.lobakin@intel.com,
	ilias.apalodimas@linaro.org,
	toke@redhat.com,
	lorenzo@kernel.org,
	ihor.solodrai@linux.dev,
	tavip@google.com,
	maciej.fijalkowski@intel.com,
	syzbot+ff145014d6b0ce64a173@syzkaller.appspotmail.com,
	andrii@kernel.org,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	mason@kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH v6 bpf 1/3] xdp: introduce xdp_convert_skb_to_buff()
Date: Tue, 17 Nov 2026 16:16:03 +0000
Message-ID: <20261117161602.62553-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <9b616d465e6f88aab813a79cc84c51ed358861e201bfb23921864e62fc9dc023@mail.kernel.org>
References: <20261104121316.1155680-2-sst@poczta.fm> <9b616d465e6f88aab813a79cc84c51ed358861e201bfb23921864e62fc9dc023@mail.kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 12:53:35PM +0000, bot+bpf-ci@kernel.org wrote:
> Could mem.type be saved and restored around the program run, or could
> bpf_prog_test_run_xdp() set the mem type it needs (or use its own
> xdp_rxq_info)?  The later veth commits in this series only touch
> drivers/net/veth.c and do not address this.

I think test_run should just use its own copy of the rxq, which is also
easier to backport.
