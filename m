Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847233;
	b=kOhqBozH3kdPVO47NgCWGfgUnQR4qL+8HigyXxLJJd9AY8/ZIeuCfmyx/lrJgzBngeAz
	 +ZHcr3CQ9xxB7YBIUc7a4WcYT8CdYvs0cWS6ADReBHL6lR72zA0iqVRKgUErLDxcW7utD
	 lqHy2YwBfDmz0Ev6MOnPQZhDYM9pd1Jq0rz5StlVE+MNtzGaEyDuOaR17f/t3KuS+auQc
	 l8QZr/zWFG7ZVximmXaN8yhktxphkczpubOBMMIvqEU0NVgrmMo9JG9nBNe7CZf7Vue9o
	 D2m44aMsAZufnE8Lw/uLDk+kC1hfuDG02kdtBatiDucn00CBOOG2+BpT4JbgalcWrew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uT9dGfnNHZVYLS4OP43xiMgwtbDlKvr9wQr6PZJ9F1Q=;
	b=U74MMB/A74iQPelo3n00TkuLAVugRwKNd3mrOZ43p5cisQPe23R/QrejzRrfA+o7kMjW
	 +8wuFX8jSTy5wUn01qB8P+P+L5wd4/16PPN+VnarcODzKHAi82d2o+Fhfy7KcXcWm7Yzv
	 1KleGAn+wqifFSsqzm/J4saufi7nXw/TeRRgWh42zezuQhPNsRmoZRkPByuFZSq9BkMtv
	 t3rNh2FAFBp4ilRJEIwi2SMiz2TYNGc6bT9JTKxByBlOmdXrBzYgWc4umo6JkpwI+Ev8E
	 ypKQzCgDtnIqcmp3veOtdfS61gC2vF6ZU5xDNQxBUjPM/55h5NcmeVe11s16FjR13xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NzEwAmtv;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE905606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE905606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NzEwAmtv
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so546156866b.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794847231; x=1795452031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT9dGfnNHZVYLS4OP43xiMgwtbDlKvr9wQr6PZJ9F1Q=;
        b=NzEwAmtvoM5yV4dkf4b+6MKvm7WLzvH6v9s12vspGgBLPj00OvAkKne59SU3I07L20
         A+V3TIOH/E5JH5pA2ZxjJUY2XQqHsFJcFobM2+hcKHuPZPefeM3Ajccs483QueMLHMil
         9GigM5V59gRHT2aT60v7UQn2s534ymS8toIhfuy3hJxo6XZ+1VDNykg+d16Jlp02T2XP
         GI0f0r8LPForYseKQ4cippwMcN6wt3pZDz4dnwuLPs2QFewdxCQItVgAulOJoAr+rC+v
         XmyBEsB3AGVR3dBu0HxBAcTe0C7G6EN0D3t5NRZh5de/tgI1+wryeLQRdcass1mnoRpp
         prkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847231; x=1795452031;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT9dGfnNHZVYLS4OP43xiMgwtbDlKvr9wQr6PZJ9F1Q=;
        b=YJM5uVl9SpJG4p7FIQygp3FcVETLB+cJE60Aq83iHhNPjc9GBedm9TCLMUVvnFlIvS
         o1KueCvX99E+xSgHidxBAarDkKIL9FDOnH7pf7yyJ0lckVQoDBmEDyja9gz6AsFKoT3F
         UhSqnNcdz8/gs0txTiLgznSCEwMGrVxSagRf6fEEmLYfk/sjw0KzWTAVJMbmq2LOuV1i
         C6v6aURNHHEKa/x8u1FzmNEylyyZ28BHyORHrRcDcXESPFiTuHt7bpb803dVw8u/jSH/
         u7IZgkNRRPTJN3sVJ5SziI64716q61di6yN+8h4+AvcHn8QsPolDypnW3hG9yFsSBiLN
         GUiA==
X-Forwarded-Encrypted: i=1; AL+hErFq4VOH4bskXLdZUGO4inPVTY5HcITTP/Ir8cHbhNMLKcgVub7SFFUMuRPc5Fo3GjpoQ0mPqMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i53t+ZwSHjBUSNBuHCObhoSuaUPymJFM8nLnvfx5o9HxxQFXU
	DXMQRWzdR2N5Qdw2JeBz49HcKNYAQftmN/cY0jgi/6F1Xo06fhAhHp3bYQQXzrnJk3QB9mJH8Qg
	rH9QeoiG/zQ==
X-Gm-Gg: AYBFou2yeko97WwLhklloxy9ivezeb/52kdU/xzaHtjz3m4vFlQ0RxVHsQx1RjAds2U
	Qxk7DP6F8lIT3X7WAvtKfaAu/PoA2afhWf2UWyUhy+eY128Qtv/EZm6Cpmdy/ubgc7TmXiL6+Mg
	Zj9Q7aoe/Q2NEbOBKIZqYLHsOQ8vxHDR2HvNy1dOpK18sUxtWt1Hrc8avjp7Jwyq3D2/zjS41yd
	Jt5fiTH+7O3ElZZ0Kft6Kry73G0S79pCcM4aQ9TGy+zpTn+7V5g7S+JtxL0jg8JL9tpgM4sjTOh
	/C34VFGGBBYkG+rBoLJ/wx5cgQ2qjidi6a99UKE4qD5Kxwbz0uAPGUWqJgoBzhM/Qbz4T81+VX3
	/j1xIcJSIEKMltG9nK1lb2EyPQ22uHQDOFF06PkGqCo8WKwf6skG8hLyFyUBsp6Z311zsBb5G5o
	9IVuRpov2UcM3f3DZ66oUaRut1sNGaQVUblUserP5YpxoyBkSs35fg3V1s0O9bQ+UO+SsYk2SwL
	AlHpwDJUnMdhL26QzYoVUZyYtDxksOef3omUFSFM441Oxxc//MSQCYjpFzKca4TS7bLu4XxXIoD
	p7OWRrdkVLg3InbahV3Gq8WGC+oCeYN0
X-Received: by 2002:a17:907:d10:b0:c4c:ddd1:cffa with SMTP id a640c23a62f3a-c5096398ae2mr930659766b.29.1794847231194;
        Mon, 16 Nov 2026 08:40:31 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm444919166b.73.2026.11.16.08.40.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:40:30 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: sashiko-bot@kernel.org
Cc: bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Michal Kubiak <michal.kubiak@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH bpf-next 11/15] ice: set skb RX metadata from the skb core extension area of xdp_buff
Date: Mon, 16 Nov 2026 16:40:28 +0000
Message-ID: <20261116164028.37110-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-206188@kernel.org>
References: <cover.1794281983.git.tianyi@cloudflare.com> <ae488c057454cd57fb01ac01aefc3e97d6271ada.1794281983.git.tianyi@cloudflare.com> <sashiko-outbox-206188@kernel.org>
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

Hi,

On Tue, Nov 10, 2026 at 04:23:22AM +0000, sashiko-bot@kernel.org wrote:

[ ... ]

> [Severity: Critical]
> This problem wasn't introduced by this patch, but clearing xdp->data before
> checking whether xdp_build_skb_from_buff() succeeded causes an invalid page
> dereference and leaks the head buffer [1] when skb allocation fails:

[ ... ]

> Should xdp->data = NULL be moved after the !skb check (since
> __libeth_xdp_return_buff() already clears xdp->data on the failure path)?
>
> [1] https://sashiko.dev/#/bug/linux-d6eb94b5-df62-4b78-9f73-358fdd002a0c

This is a pre-existing issue in ice from commit 93f53db9f9dc ("ice:
switch to Page Pool"), not related to this series. Cc Michal, the
author of that commit.

Cheers,
Tianyi
