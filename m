Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538061;
	b=Tlb+U3SNW/vh8IyJvAEHLVt5P3g3gKLqRKpW6Oz/owWrkaVaEarfmLAnaoKnu8KwoRBk
	 66htxbqZYxMBVT7lbHTc7G+8kexh3abWxKbqJ73hlXSQw/xE3LP4LQd0fn0m6PVOxdNZI
	 MRkvUtRU8ljrAFWWj8WK6nGxPffgUPoueVslnRQnmyaNSyKlEdyzc9Cl2RAwKx695O0jd
	 yR6HrY24hN44tuOI/OLIb3TPSLWMpyltaM69BQgKgDDlFKTVPFMnA6ESkXqwaFTxXrh0R
	 H5SpjWtZLIQXgNVSc7o+L+QgVofshnGxry0t7G2lLbXnQpWCUftyTBM5wwkP5NQwndA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qBpX9eD/Y1u/lvzmHcfOgzl+QJm/PvOjVer0pSOyAQ4=;
	b=I/1i1bG2Ij45hjeCV+9nb2uwQAD1thXbutbwSDlH2Zv3khsy+AVNTOen6cqHnCu/VcsN
	 s9EKdLl4XqhyezX8UztLP9hAoiu2Qg1EY2AdRTki2+7EiBLs7zn6ahuC/uNVid1SS8UmE
	 r4wDj5zInpBRyCn7J4hnratunGs6ymEUA37RStSPWTaplmU5RGECNr5HHjY1MUDEiKmHK
	 RKudqexWQ4Al86PsJ5nWoWOIHKwpIoiqHnKTdkAyzh4J7JQJDTjXRL8/5Zv5Y9j9+it3v
	 tXZCT+mQDcvjBTT1XofyDbRLIDZuPyUuayncpCdDs0cSbOecKoN6Bi0uRrSPCQmSB2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWrCri4C;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0989C606A333
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0989C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWrCri4C
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a192844so391847866b.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538059; x=1796142859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBpX9eD/Y1u/lvzmHcfOgzl+QJm/PvOjVer0pSOyAQ4=;
        b=tWrCri4CWnTG22uOM9C+jp/befCVypiSR14ss4Hhuw4nQttam+vHWjhBIEnqPCrADa
         C2HDs9OgrZ8A+wz8/LswPqpENVfLvEEj0/oiOOEXqx1cxSvUS/4S0h/rL3nNJNNBJS3D
         Sl56mCRN+MPh+Zn8aGmIT1KZn8UvzbDcxXBgYKE6Gkysp3v0RpXILpd6khsmXaUtiP7K
         Yi9cjmvBEHJJrBPiA1eBfTVO+82+19L3Fb1dECfEpUAdjvDHhBsX8BE/DyJGpcWosNw5
         wp2pQXVv2LFi4pqSkz1xoLVMxRw2ur7RzNe8WfvBZMLZh3gVTNaJSJuEOL5yGS8b216x
         HXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538059; x=1796142859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBpX9eD/Y1u/lvzmHcfOgzl+QJm/PvOjVer0pSOyAQ4=;
        b=MniISPyq2xSb71Lm3bn7Ndjl6CNiXqbFZ+XnrpO8YC4TXZymDyPQ5C0UHcAXC+cd3k
         UkbHt1bOEclsDT/yy4C6rRvqQgOCSMwrjZNIDswQc4sYQE2FosmSokcRnAqsiQdAZQab
         X3RQDrBXyLMKajAmbsVoCI6reHpuE9dUG+wfhlj3/SmjysHGsyiAtZDznE1qrcZOy/3k
         Rn+b8GurLby0PAJ1WB7hx32r/SpsbTyyovC/emP+Eh/Tb+8KIbGXrCjC7Z03xEVFrZiA
         kVKZxNA5/G/ZDl0jRsx9J7HzXMA8ctP5d22dKPTFlSNEN7LMOOLctQVc8kqraX5uGott
         suKQ==
X-Forwarded-Encrypted: i=1; AL+hErFz09PD1fWdbrb5COlZGPBzP2j6+/Exk7iYvDfHQOeWyfu6JXeN7FOZXarZszA2FF1cglyaXFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HEbfkpXFGPaWDwIETMGziJTtAZPvp2wVH9CFcukII+4FnEHIO
	VxNg7wmSJrlOdD7jZ4PYq0GHzWbrge4tiVye6AX6URojiT2Dw67BRXXF
X-Gm-Gg: AZFdTZc445WzpZbBLG571e6zbPxBviPuJ5g+APsstyd+ZGK0n+c/fIyTOU/yWYPUdzg
	kQUG8/a4PgR93lNDxqd8QF+arKxNl0Eb7sq7GbaFLysvdShDnaCh1Ap66Ct/iubaxy+tIwhPOu3
	4uCa+MHcY7iSosf81WFP8FuVszOipzaEDT/st1UUugrcA5gcitEvygDjTHhHExI9A94+hOmYiLs
	uZMnH282P632IX0exEcifA8Cp1+OgLwzbaip9g/4j1NM/DGSc+FuzBqc5Ey51g0uTZko9LzjuOQ
	ccc82tqtdNuQ0QSFQuVohIBwSDNaPlsaKmGNGUMmx1sE0NyfEECxv68PaYjHDqF2fiEPzFwaVhb
	3fJUhbkYAyyn24Lf/sMcapOQnLeyx4WffKw2ZEuu1leicJzsJxWSBz1JDgeAetyEheJAWaf7pWD
	rK2rpHlb4vFtI2K3FG79NI3mSswn4Iq5/MU3Acm/2+OTmHbjfLMPjUafxlDCrcEJLAKwjMOEYdi
	Ftt50t4zudsJ4LlsyJgkdQn9+wDR4jzUkpTrWfUQCYfC1td+EGH6MxPjNpvbVYJ3T+v+TKjrb6E
	8MlcO+Bc3253tL/jAHHvYbcUkce71RG8JQEf7jLWhQZoVrK4fCa52xo=
X-Received: by 2002:a17:906:7944:b0:c50:564b:c63 with SMTP id a640c23a62f3a-c513a43559cmr1313486866b.6.1795538059334;
        Tue, 24 Nov 2026 08:34:19 -0800 (PST)
Received: from theodors-laptop.dotcomltd.ru ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm542032866b.75.2026.11.24.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:34:19 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v3 2/2] net: unset the mac header of a pskb copy that points into headroom
Date: Tue, 24 Nov 2026 19:33:58 +0300
Message-Id: <20261124163358.755345-3-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124163358.755345-1-theodorlarionov@gmail.com>
References: <20261124163358.755345-1-theodorlarionov@gmail.com>
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

__pskb_copy_fclone() copies the data from skb->data onwards but keeps
the mac_header offset, so if the link-layer header was pulled, the
copy's mac header points into uninitialised headroom. With nft dup, a
link-layer payload load on the copy at LOCAL_OUT or POST_ROUTING reads
those bytes, and a set element hands them to userspace:

  BUG: KMSAN: kernel-infoleak in _copy_to_iter

Unset the mac header in that case. Callers that use the copy's mac
header push the link-layer header before copying, as
maybe_deliver_addr() in the bridge does, so the header is copied and
stays valid.

Depends on "netfilter: nf_dup: do not duplicate packets from
br_netfilter"; without it, a tcp reset reject of a bridged dup copy
reads out of bounds.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Florian Westphal <fw@strlen.de>
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
 net/core/skbuff.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 85d5caa08887..e38d0de59e06 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2278,6 +2278,8 @@ struct sk_buff *__pskb_copy_fclone(struct sk_buff *skb, int headroom,
 	}
 
 	skb_copy_header(n, skb);
+	if (skb_mac_header_was_set(n) && skb_mac_offset(n) < 0)
+		skb_unset_mac_header(n);
 out:
 	return n;
 }
-- 
2.34.1

