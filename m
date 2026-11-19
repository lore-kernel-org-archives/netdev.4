Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098498;
	b=Cv7PlZ+131D57A3amBLUR8+iFjAgQZWXFaeDcTb2rwEfHXHgDmBhxHWNG5HuT+OFaaD1
	 nrClGamA2uxIOSW7NRvx9UQqFmvYh6VHJ2sN3WwADP2uC5T+d/1VoXL753Zbwf/ee9IFV
	 iiXoYKCXkCn5SZilc2TXvNPJUtP1zng6H73NyKFe8pPm0MJQDlpaoaTe/sG8TcqFKlF6M
	 HWfKDko3Hg3T0bVutGyXHZgzeHnWNnkyiSD6+9OZvXeDZ/loHyagPFL7p6xyFw08bId88
	 UnwH2xhIhs5SSxHoCDJltvOAwOsPDreewWjzbAYGXt1cU1WSFNV1v2+56xPz1wt1IUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iRkY59qNDTF6/FtMLA6rulCu43us4mTaTfJoQTFrVSk=;
	b=pcYe78hEWf3XxyCqlecjyzcnhEaq9/+mFBU6BiOV5m7VfEUnUdqBdTp+E7g3UpV73J99
	 o1SaTVPCoQUOHFGcTBXsnYvgZSGknedhoRk9kJ2mEaJqmmkXukYGkdphXi9ZWCHzj4N8i
	 jxFPN8jyE2q5/AeulF/VfWW2GerY79XAM4ThTbil4TF/gacHhb6n6qZjkAJoLPetRYc1W
	 g4u8dph/V3m+qDmYJRtGg1RA+Ulisd2TGnNYCISy7DsX3Sx379+RI9ycXAjW1JUSapVou
	 C2Z+kmiPa4On4x2SkauKpdOKigI9vF3gMyLYqtBpigTM/JWpEbj/liBMy5C1NVu3uiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=H2n0DgEX;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43AD606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D43AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=H2n0DgEX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so23987585e9.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795098496; x=1795703296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRkY59qNDTF6/FtMLA6rulCu43us4mTaTfJoQTFrVSk=;
        b=H2n0DgEX8aXN207Kv6GfG9g3DcKjBWfKLFbRq9Ii1Cva1YzSqY3C9t42/79ENxkoe7
         FpJ0HCnvWdnvBmQqhwjI/0fxPUFH8y1oyyvrVYo2GEGneYe8MTaLySnJcvkAJTQ5rNWk
         zTqwRbmuUhT/QtK+eVkrIRnXXJastfoKM2oBmkSUz+eorHTFK+5breVqantvePY8E/7d
         CaqlHtG6DlQNjZnyBNNn2ASuLM3ouAJWab8x2RfhvjLQV3SdTKc6InPZDCpvls7mmn6q
         4wlPKxiLVtpt5UbOlx8jS1vDueoreUS/TVHN+LcyUbglw8nPXDlIPIo8pQmKGz4WnboJ
         pPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098496; x=1795703296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRkY59qNDTF6/FtMLA6rulCu43us4mTaTfJoQTFrVSk=;
        b=nKEgQibQ5vAOvCKhmzkVIQIPVrQe3SRbDlJq876oDLqCDFVWTOt6Bk1Qw2nVO5wubq
         sNOYQYxtFDulKCwyujLZafva5P9dD4doL8mhw49X4sSnatGOqppXch2+FLhj3LxK/Z8e
         2jp0fwNfThyh8AJ6k7rwkRTf6MZpEyL5/fgX6BPOKUrys+JZHfqgTQ7hrNDcyJw8aZg0
         xwjoKn4gZ7ohcqflZy8uIMveq+cOvsP14uTsBxfNUoJDWlgahJ96JXAF6NTL1axWUrNB
         6Ca6YHl2r0MXhOiZcQf6zEpmRqAMGnA9P7b38Fz5D4/rMRAyiZ4Mp3p146fAPRlgVj4Q
         TNeg==
X-Forwarded-Encrypted: i=1; AL+hErEQTbI/t5SXYTYNCxSzFP2xrqzHXFBCTW2lAkVoquzOOwp8GFWBq5rvIIieLoFZQyvU3e8eVzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+QrJ1/BekXdRVpElzHJKbkuHyXtE5lq65bpE31ori7T2y8E9I
	O0jdUghSdweafN7CTxcYsAuJ4uIamqPrjapArmhfIvf96ejFkVbrmmv7VPEqnU5aerQ=
X-Gm-Gg: AYBFou1R+K5JSDAh3um95VBcEg4vmy+PrLnHBjABqM6M/aa15OlFotKQdbXUg3UVB3M
	bcuy0lZm2z4MIkWg+Jdntx0NdyTby5jSe+gSiiJBEARuNkj+uedYKo1Ms/67WWUIjYAYA8jucPU
	SSgVlVRwdwiZljrXG5i/eYt4YKDIo6HpvZPurghNdWBajnxws9PpuJoY51vMEAeOive4IpjEpU5
	HWqV/sjpik1TYoDQoR3UrJte5HkglkHqyWTCSe7PZchJWD6JAhXbDBL0GhnrBRqX/J0b0ChgGmc
	Mw8pAW7kM01sEj9JHoLueK45ck9pkH2Yo+dNrE64QNd0wNC9rPXHQ2fUCJ8SQ5fRixCHGpsXcI3
	PfP6Jcw0b2lh8f9BNfm8C5C/ARdJgV+dYfPHzqpLnxaWxAeWcHm1bHZeZZqoyF1LayjXx+0LMvk
	88qa9195FE8VF6gIUKfepbdL338EwN90alpxfG54eIr9zmDE/wg1bPOK6tFYscrpa4mJuQzCjJ8
	dl8Ir95BoBG78JkFgq0DgX5+r7KoyQLJamos3MsAPFRVya1JHWdSET1axDlzE9qgBwqqop08kds
	aLrDBrRZX0o3LHvYiwBMh3jJgBj6zSH4EeWrfz8EYgSAl8ciHAE=
X-Received: by 2002:a05:600c:4e44:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb7da12957mr117847055e9.9.1795098495962;
        Thu, 19 Nov 2026 06:28:15 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b3a7sm47857185e9.3.2026.11.19.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:28:13 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Joe Stringer <joe@wand.net.nz>,
	Paul Chaignon <paul@isovalent.com>,
	Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 1/8] bpf: Orphan prefetched sk on skb_do_redirect()
Date: Thu, 19 Nov 2026 16:22:23 +0200
Message-ID: <20261119142231.2612515-2-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119142231.2612515-1-razor@blackwall.org>
References: <20261119142231.2612515-1-razor@blackwall.org>
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

From: Daniel Borkmann <daniel@iogearbox.net>

Ingress bpf_sk_assign() can borrow an RCU-protected listener. Redirecting
to a qdisc or receive backlog can outlive that protection.

Orphan prefetched assignments before potentially queued redirects,
including peer egress. Keep synchronous peer-ingress handoff unchanged.

Fixes: 7ae215d23c12 ("bpf: Don't refcount LISTEN sockets in sk_assign()")
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Emil Tsalapatis <emil@etsalapatis.com>
CC: Ihor Solodrai <ihor.solodrai@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Joe Stringer <joe@wand.net.nz>
CC: Paul Chaignon <paul@isovalent.com>
CC: Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>
CC: netdev@vger.kernel.org

 net/core/filter.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/core/filter.c b/net/core/filter.c
index 946b07a17fce..1ad57a371534 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -2558,6 +2558,15 @@ int skb_do_redirect(struct sk_buff *skb)
 	ri->flags = 0;
 	if (unlikely(!dev))
 		goto out_drop;
+
+	/*
+	 * Prefetched sockets may borrow a listener under RCU. Orphan them
+	 * before redirects that can outlive this section. Peer ingress
+	 * stays in the same RCU section.
+	 */
+	if (skb_sk_is_prefetched(skb) &&
+	    (!(flags & BPF_F_PEER) || (flags & BPF_F_EGRESS)))
+		skb_orphan(skb);
 	if (flags & BPF_F_PEER) {
 		dev = skb_get_peer_dev(dev);
 		if (unlikely(!dev ||
-- 
2.47.3

