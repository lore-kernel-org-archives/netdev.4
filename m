Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680826;
	b=nCX4lwY8doZB0Zf1bMCcJkjyFifolgD4xmIXS2lSnKKkFkwHmigfLZ0RyH8UvES3yxna
	 QSpzN7N7VIrknxK5IjmFz/7K9AguJ7D5MxdAblzgbp04TQoMm0A96X0pB9DvTHbMInrXa
	 qob8zsOIjIKU76nh/Nzy7s+VRo5Gy1YnFO1drsnt4GMEZAIoHSEsR46fbT1ixaJJ0TIoW
	 0cZ8LbB1IbZXxMdnsiefs4wlo4vZ4rKVIJJpAZYHDRi99jPsSXBDEFlt1FPa7sB8Z+Eqz
	 QUDApRZfHl2D8NrhW3tSo4IqcEuJ1SdgLPKpxoFcYjcFw2Y7cVzFz8FYB7MxThi3DdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y4zzv3EaOx69qMDO5E16Sp31hDskZy6eI4m6bgalJJ4=;
	b=2kA+ftEow4dj4yTIAU60qAdMlkIAgp3dJC2tOCazVcpoLEzjEdD7NgPTmw6/Ym1IExfO
	 SN7LDYGexEbEmp8CojUb0UbnaZ48hNJvk8C3A+Ec25O+Cqj20FI/Vfs0QmpZRv9eWFQGF
	 o4J64oEpfw5qkxaVk65jRm8ffSlyAHEFDBeCmLXH+J2srJntXxFuHffiA9ltH5Kf4nQzj
	 r4AUlhA8gaVnviMd/CnkuzB27mTpNfTKgNMhJ3ElR24/+AH0GbbEOUbo6waomcjYe0aCQ
	 eyozgDJgCacq2uoyhWWiE3lQXRWPEfA9fvc3zHIBAH9qUM38SDc7MBjSy7c7eczsLRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TrpiUiVx;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3C606A88E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D3C606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TrpiUiVx
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4697404c2bso316002366b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680825; x=1795285625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4zzv3EaOx69qMDO5E16Sp31hDskZy6eI4m6bgalJJ4=;
        b=TrpiUiVxN727qqbJfLLvzsS7egQqIC9E7Az5hYKGdx4auQawMDNHRMd6DmEiHXaXV0
         O3kV/T4Qc9I3WLuDSIib9shXXLLf0twJIkeBkKMDLbfkas8hT2EDm1v9S75p98Nyfd4m
         ME1Or2ICgWCLTCWtVIkjGk73WrQiKv3Q4g34gUkMTTHgJ3GKhEsNZa0eI4dZzJc/f7h0
         C/05SZb4nZMckpNLog3ERB1UpAOagidl95W77PiwsMZ7g5grY1TJSt7ZUOlYVoJL4g96
         z+WjutymPnGXfP2T0qPZOE8XXaFF0Tv3sn1x11OyoWvz5pCzgpMiJ2dTFHGDnhVVLq6x
         UCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680825; x=1795285625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4zzv3EaOx69qMDO5E16Sp31hDskZy6eI4m6bgalJJ4=;
        b=iBbXT2Mu2K2WRi1zxivGgKBn+ddkwWstoEK2egrVB08/7yDdFFvaDYbbCLJgm0rtMl
         mGFnhdBGxE5Br6PMrVH32WIg7z8Yz80dEnWHgXZrck9ElLBTWVk3QiNc+bDh5g+ZQNQD
         /RnHVrJK6zDsTzofqaBanAiTds0E/gr/n6QLo6cIJ0uJNzva3y4k6vFs/ggXo0ezTH7e
         bvPx0WscSN9vttlvSWM3zo3GWZgvSxRe9LeURefnWfGaBFJI4mWknk7JTZBA8vF/IjYH
         3TB8qoOJ2g/k+myPkkF1dRurPY9NT2/KFTD7M/x2nDpAKgcHmJRjcTXbK/5y3GuqGnJQ
         T7ng==
X-Gm-Message-State: APuU4Z/pSHWRvYKyJdlk3crkxTQ9d1H/C4MDDy4eTuf/yGzCeilGmRCH
	Sf9SQ7rtQoa0EKnCu7vzXWaFR0wNckGhVATwdBaDkBL5O7tHF2mNBspSwiPxf4l21pPMmg+56Ov
	ijebYP17z
X-Gm-Gg: AYBFou0ZVwRv4SsZvNNYAR4ycSzXGNxtxSeOxP+giabYNoiCMR1e2s1+RUbHejD3mTe
	tCb4S0WNsPkisKKds9R/XFWGIfT/wgpWiNPL8xcIHtoNtgV+7THKuwbzGVRnCCjgXlmTmZd1Co1
	lE3IiVLIm+uK/TybVV+nZQEGIb9kS14L1aI59Av4NSH1atm/5xJa96/6Ckorkvs8Nbzbine+Kpz
	2m6zMPP031c9qlh3d0tz0k4d0geQTEg0afeBwjrv4TEE38y9ExJMESI2WexcetDl9pYXsVTPlkR
	ggkcAq3KFuUMFuQ8A+Mf56N9wlv6ysn48qwOzGAZrJonDcU9F3WVwduA8YewX3x48l5loKoM0dG
	VTUCjhFwddQVUfBnd38SxUwtcteV+LS7LdgV7ioKnLpqrsHHj2ahyaDeUIpq2BtbMSK+ynlUsWw
	KRrryO/Umc3Ti6hhJcTSumG2kyO5t90KL8pX6d6ZyOEKRH5uLxL7a9YgAOQ5jP7g+/ByXnm9cPO
	jMvyIlPhh0ReEPanEtXueD6dvlZM0164bxqlvUQ4QcCLDKTLfSdYhMNLw2BhFfWhJ/wofsio6fm
	kgYJ/oksQSuP1D9iYhDeF/T9BTLGWxK3wY/UEcZyVWnJZwlj/g5oaMp56ZjrsMKJbUJ1Ze1LbRd
	K/GOS9VMNFQdybIrsXbxWE9wm2bpI5YsqsbfkhiyDYA70KMEwCkew8goLwnaye9L0Sa9RgsEzHj
	sXO4eHsNO0Jdz9RcKeMmmAFiGYhWqDryGY1x93vmJl3mE4CF7dnVF8WDHUEvoZZMOItVvWiwvB/
	WAKmgWy3tVxI7GjHdqbM1Ylwu2dD92tqyHbOHpEuAUDGeG6/cu79UU3hI10v24veWwQxlxDGDjl
	bDQ=
X-Received: by 2002:a17:907:2d20:b0:c49:bf6a:28fa with SMTP id a640c23a62f3a-c509642f8dfmr464927866b.28.1794680824836;
        Sat, 14 Nov 2026 10:27:04 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:04 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 2/4] net: gso: count the inner UDP header of encapsulated UDP GSO packets
Date: Sat, 14 Nov 2026 19:26:58 +0100
Message-ID: <e2348827189e5c00ec1bab50aa5e8fe5b8bc3b2a.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

skb_gso_transport_seglen() adds the inner TCP header length for an
encapsulated GSO packet, but not the inner UDP header for
SKB_GSO_UDP_L4, whose gso_size covers the payload only. Every segment
of a UDP GSO packet in a UDP tunnel, built by UDP GRO behind a tunnel
socket or sent with UDP_SEGMENT over VXLAN, is counted 8 bytes short.
ip_forward() and ip_finish_output_gso() then let DF segments that
exceed the MTU by up to 8 bytes leave unfragmented.

Add the inner UDP header as the unencapsulated branch does.

Fixes: ee80d1ebe5ba ("udp: add udp gso")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/gso.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/gso.c b/net/core/gso.c
index b5bd269e56e4e..eb95c9d2819b1 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -156,6 +156,8 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
 
 		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)))
 			thlen += inner_tcp_hdrlen(skb);
+		else if (shinfo->gso_type & SKB_GSO_UDP_L4)
+			thlen += sizeof(struct udphdr);
 	} else if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
 		thlen = tcp_hdrlen(skb);
 	} else if (unlikely(skb_is_gso_sctp(skb))) {
-- 
2.53.0

