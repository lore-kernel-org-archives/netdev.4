Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150059;
	b=ZoNfQsAAoYEQ7gbwUauJn3QFeYOvxPGCrYRQFzpb3L8+0Kj+Bk32CIlb+w9xMg1x2pDt
	 ovAUnBegoypA4F6CGDFTqopuK4EtLlZRy+0B28ihYEUunCY5CcB4BycyXOg8dI0cRmdZO
	 ver9cbHlq+q8bSq/mtlgvlGBDPmyGYP0uhSfuBYZEqmTQl4hCs4HokqoRHTlqH0V9FSqo
	 hcg3x/OaYDJ35KexT/DpQ+ZqKLc8wRDtr/JWD9WXAwqvTDuUXPwdL5nGIGJ0Hmiba3xe6
	 TdoLQnyDI+a5ukYampRxkTS03yEC/INz3vbpxJHVKnqJudEThYR96v+5v9RK0T8fhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=drpsCDXaiHLhj4RcEkagcNMp+O/zmGu9fZ7pDo0rNgg=;
	b=fmp3iQ/zu2VQGZy+IRYk6ftSWJxuqdg1JCsEw0XC7lk4qSN5nWbeu8W7xKveJ1O8oD7V
	 7h+gBHUW/W7iForLDW0RY/1aSdEcYmlLXHrXAIS5wtFxgLLDtFc5Ji4nFJ0YYd5E5y1gb
	 4yAu/mkiLQ3UktuhkEUK7sHGEqvp5vC2W+UOPZy2jGhdthEx2wVHGFo5ByeAXDx1luVix
	 gZpGqjAWOiei83DrymLUYKshzf/0xfsW64sTXXhePzumxcsmJUVVMtxC8WClmkw+v7YrL
	 +8+fM4wFsJOWA48n2WrDJ2nM3/xXp4ccbzE8P66n4w/R7aaFhDhz0SJhHXGqka2zyig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lRVV+iJ/";
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D140C60A260B
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D140C60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRVV+iJ/
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98301b325c4so164836241.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795150058; x=1795754858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drpsCDXaiHLhj4RcEkagcNMp+O/zmGu9fZ7pDo0rNgg=;
        b=lRVV+iJ/ygJWZUf8Z4JT+/tpCZXBL3G0Z4EtpecZ5MJMSA+Ew0gmdRcSO0AJ0UDBj3
         3ILy6ZUifzg+C2O/bAz4mJcSujYNx5l5vuG6tFWEk+Dw9QcKGOCmb4/GmgDWgcW4u7gQ
         7Qge9KK/wDvtF+K9FWvOUurXXQarDPwAo1wB0THnfNveoU7oFSB576lEyKhKK9jy1QlO
         1yU6OX52wVtY7nQB3+RgcZqZuK80Nu0w9IYkvF5RTvCmWv5eC9al1Q6AYpzXybRYWBR1
         Zx2YpOuPo16YHygjZPiYWtqhQ/uDxbqFffAHGuEfXNBNePQ2T6JyRP9jCRbjwb5kKmK9
         4rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150058; x=1795754858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=drpsCDXaiHLhj4RcEkagcNMp+O/zmGu9fZ7pDo0rNgg=;
        b=Hj3Pm4NTIuWklvswGPfZeaadB0MMnHlh/GknIb6xfyhIZNNhzk7pz6Y90vo6uFVLdW
         5tqpVfQbt0eq6EgWo3dQrho3tRX+Dj4x/JACGFYSDhW02/ZLISGApAJnvCCOcuxMrsFD
         o/ZNvJUknw1eP7b8VH0xTeX/uwJhZJxCbEJ5uphiDe9NYxBgpjVguwLpyPg8rh0ZjYz9
         R9UsNJiAuTkDMhgUt6cYTFrw8IwOudbWuXpfM6MFGWVotHRawSNt7mwiB77/bTcJ3bfK
         EHKIs6al5rB5++ObnYgtS+oj4YzQl8NRess9PCCCUgwNBUmOs/JdtAjGw5LSyEfF77df
         qdjg==
X-Gm-Message-State: APuU4Z8ZHKXcr/9WWCNpM68XN38ztV2X4Zr9OhCST9FF1KES0n4J+Ly7
	EVfPYjZAyIYMBqba8wbmRICWfo+BMqkxmL6vjLlP2lj//Ujik2wKIeBR71TnrQ==
X-Gm-Gg: AZFdTZeKUgZvC4xp/oY2BELiG597PdY8s+D+Tcenfsk0PzCtNp7VpNlGTLHpN0Qf7h7
	qtSZlvbNCKtlxgayOGY9nDrtPRGmsvQDYJFLj86pRoY1AcYE9BPybkWS5R+JHhRxpX59khq0Bol
	0Lno/IJVEu+wWpEagSx/PSkzLmNhjAZwsUzCEcd5j4hW0/rtXqdyMVCYlHVTUL3Z5WmYnfBbyc+
	0l708czc6XLO36tLfASGrX5QxIVEKAe9R0vjXgHRN6UH2bhWbxWIpzmOr7q/3tyNIdRdj8vSfRp
	6dRI/M5ZX1cMhjYCj7ejrNz+elTTem54BM8RnqMRL2Kqx3NaA3LkYiJsJgD37o0Bo6vm/XuTZpY
	Uzz3f9HKQJ1v6g/ZSYtV+c4BHpF/T1OQVqzacaOab98w7zNJWwe+kDgrCPRbOax1fNJZqEADbTg
	d9GA3TeMdCmWCcOuJYeVROGaiUjIyeHuRp+HGCCpK0q6Nrf1LrhvVcwiBbLpIE4EeJw3KKK1zeb
	cVuIUbx6IzhgxIrWRIbA+AY4Ony2MOMW+EDyATywL56Eaceg3heiQ9ZZZtGlguqapPz61LF7G6w
	RrRk0MtuqyNhWzyQ6YicKDLSl+vGz23aZPQDW/ieIQtdLnL425EaetR6EZNn3OpCnBLQtxP2A64
	TFWd2J9C/8WBmOYKyCK2NzHKmbjIfnNMT9Z8dGe0aQ3xqR+OsbVBdHFLnuV9aX2KEi9CX9VnE4E
	m16D4X9JzfJQ==
X-Received: by 2002:a05:6102:4485:b0:7a6:cd7e:72db with SMTP id ada2fe7eead31-7d73962b3c7mr669077137.26.1795150057730;
        Thu, 19 Nov 2026 20:47:37 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm1966811137.5.2026.11.19.20.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:47:37 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Willem de Bruijn <willemb@google.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net: gso: cow head on tcp fraglist fallback to skb_segment
Date: Thu, 19 Nov 2026 23:46:39 -0500
Message-ID: <20261120044733.222627-2-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com>
References: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

When tcp4_gso_segment() or tcp6_gso_segment() cannot use
skb_segment_list(), they fall back to tcp_gso_segment(), first resetting
th->check to the pseudo-header sum. This writes to skb->head without
unsharing it. If the skb is cloned, e.g., by a packet socket on a bridge
port, the other holders see the rewritten checksum.

Call skb_cow_head(), like skb_segment_list() and the UDP fallback
already unshare the head with skb_unclone() and __skb_linearize().
skb_header_cloned() is equivalent to skb_cloned() here, as GRO does not
set nohdr on the head of fraglist skbs.

Discovered by an AI code review agent. Reproduced on an unmodified
kernel with bridged veth devices and an AF_PACKET socket, and verified
in virtme-ng.

Fixes: 17bd3bd82f9f ("net: gso: fix tcp fraglist segmentation after pull from frag_list")
Cc: stable@vger.kernel.org
Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 net/ipv4/tcp_offload.c   | 5 +++++
 net/ipv6/tcpv6_offload.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index b84fcd07c723..520778c5ca7f 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -106,11 +106,16 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
 
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
 		struct tcphdr *th = tcp_hdr(skb);
+		int err;
 
 		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
 		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
 			return __tcp4_gso_segment_list(skb, features);
 
+		err = skb_cow_head(skb, 0);
+		if (err < 0)
+			return ERR_PTR(err);
+
 		skb->ip_summed = CHECKSUM_NONE;
 	}
 
diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
index eec3778855eb..0914f95f100c 100644
--- a/net/ipv6/tcpv6_offload.c
+++ b/net/ipv6/tcpv6_offload.c
@@ -178,11 +178,16 @@ static struct sk_buff *tcp6_gso_segment(struct sk_buff *skb,
 
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
 		struct tcphdr *th = tcp_hdr(skb);
+		int err;
 
 		if ((skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size) &&
 		    !(skb_shinfo(skb)->gso_type & SKB_GSO_DODGY))
 			return __tcp6_gso_segment_list(skb, features);
 
+		err = skb_cow_head(skb, 0);
+		if (err < 0)
+			return ERR_PTR(err);
+
 		skb->ip_summed = CHECKSUM_NONE;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

