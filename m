Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205659;
	b=w97HsvF6CPu0gDgDSqy5cC1IXBJo/bl+cq0OTjvArqQYmKDvhdY+tMUrnMAxsHLF/ttl
	 qwsqW1PHkxqzrxBbbYeZFOg4Y7lI9MD8/XPmimH33j/2g1Cabknkr6ag1cBEvFHUYksy5
	 HvpS6rwySY34oCQ5io4xn9L7aGmNRjUa+u3HC8MTBn9OsXXmxTa0fUPPo0poDTwMVdeKN
	 GKdOe/z1IjlT1sBWwqPnrXqndbZexTszxAxYtnsQvgWIlkZf5Fe6z/NX/+durRHZ/fk2x
	 Wp7ldXkOx8ojVOkNtwh6nqwK4UZB8QBTzAwsMJE2AdVNChpmpZYhnp6pReBWiHUZWoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=H3BiHe0rG2TmoW/r+SjBA6X3M7NG4Ot2Tx8CRGAsZTk=;
	b=pibf8y4gxo7KgJj+Mokw1Ry0kPyHrwAFuKTmegk3avydGjPeQNuQGkg5EF1RIOrwMwbS
	 ZfOQsjBMmQAVnlttvflNGikZk9slvIFwOITPt+BFZ+OSklZW15IdxaPknoBjLpekQ5WSE
	 dQpl7NIaMmOsuxECE/Jz4qFqZISrLLiS2u/yryGvLEfFXtAG2VSk/2SOcwNH7LJia6ERV
	 cGg1A40NQEh5xU0m1/SKT7avx9lEPVxTHMNX7creqA/M9SQzTUDYn73pQiw5AhKubmtDB
	 pYyw5hhjP3D28Aa8MZtOI24m57A+SXmwF5Seg6HC/Fqmm43ypQdlg3xk0p+aOjj4L1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BpZwQV/T";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD24606A6D8
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD24606A6D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BpZwQV/T
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1379533c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205655; x=1795810455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3BiHe0rG2TmoW/r+SjBA6X3M7NG4Ot2Tx8CRGAsZTk=;
        b=BpZwQV/T4gp2JcLLQBbQ515GRf5zHx4o1tJI8dkZi1CpM0iKvj9vDE8ibfOI66gvr+
         MzNpb+lCrHEEYHcnLO5uuxbuaZu65+x8iMmC40+6AzrgZUFuw+LwmdEgX2FLgbxCJ6Un
         i8PU6axJJdAHVPZc0sgHcJdkzvOqBIpYm7zQ3hWacLcA243SfFtLV2FaNMVjMFhQlusn
         b53hcX6eNddniqvhqVJMzuDfrz3aBtq4gGGvWGsACIc2aXJ8ZLVsdjL5VZ81PO8c8cKo
         i5VUcwCNn0IxHmrF2FzVl+YucQANcpe6FW1y6WxSn+cv4njhaySVjWiO6h6m38a3K8jj
         0uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205655; x=1795810455;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3BiHe0rG2TmoW/r+SjBA6X3M7NG4Ot2Tx8CRGAsZTk=;
        b=yR/PrTe5Q8Kcs7IIbg6bjzT8STXnmSYMry8vkapYcV83UbpG9Xts7QAtL05LDP+dJu
         Qemy/xWuwZ6YKlzWHUcOtJBHbM67Hs8ZPKKJBjSKagOdWDIaOpTvv776T1R6mkFDGLbR
         fO2rsD7A+2bBhDHRXMyiYhxLvVnfnbmrLS6u3eXsC7gmykpT7m5DnepzE6GJqSfT7aUv
         UtsSKLIIfn6FkQtg4XT38SgrSioEfeJpyA9ZfrhIzwKfAuf/vNXKOvt2OdBeQ+lr0IwO
         tIZOwLIC+S7TBWI/EyCTtVyv9dR5OPaD5l3sr5OlpMVSqfMDlsQ7NJ19D+lam0BC/MGv
         qcSQ==
X-Gm-Message-State: APuU4Z9yTUjaf9D/CFP0dyNdaXaVkUON9C6/Q+Iajo3OgBeaqOPvm01X
	2bcZLYCdPxeKWBdc19EBbQqmlB1dt5UjNCs5A+JSr2U50ZHGkfKuf0McTIw7w42U5FvUf09KLLj
	I+1G5LApDBK47Y+s2P9RGUI3Hm+jw318l1F8o/cufJYf/zhIY9VPzKxPszRrUBJJsSC1PCAX55y
	GhVGnbnD78Fobf+2u7WUMUJEChBh/RRD5yc2qU4RfN8zHGI29TVFViOr4HQI+OcZE=
X-Received: from dyz23.prod.google.com ([2002:a05:693c:4097:b0:36a:ead:4dcc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr3800370eec.12.1795205654796;
 Fri, 20 Nov 2026 12:14:14 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:05 +0000
In-Reply-To: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120201408.3445445-5-almasrymina@google.com>
Subject: [PATCH net-next v6 4/7] tcp: propagate skb_zcopy() uarg in tcp_mtu_probe()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

tcp_clone_payload() takes references on source skb fragments when
building an MTU probe skb, but never attaches the source skb's zerocopy
ubuf_info (uarg) to the probe skb. When tcp_mtu_probe() subsequently
frees fully consumed source skbs via tcp_eat_one_skb(), skb_release_data()
drops their uarg references and can deliver the zerocopy completion to
userspace while the unacknowledged probe skb still references the user
buffers.

Additionally, tcp_can_coalesce_send_queue_head() only checks
skb_pure_zcopy_same() (which compares SKBFL_PURE_ZEROCOPY), allowing
adjacent zerocopy skbs with different uargs (or a mixed-zerocopy skb and
a non-zerocopy skb) to be coalesced into a single probe skb that can
only hold one destructor_arg.

Reject coalescing across different skb_zcopy() uargs in
tcp_can_coalesce_send_queue_head() and propagate the uarg to the probe
skb via skb_zcopy_set() in tcp_clone_payload().

This is a pre-existing issue found by manual code inspection and LLM
review; it was not triggered in production. Verified with the net_core
KUnit test suite; not tested on real hardware.

Fixes: 736013292e3c ("tcp: let tcp_mtu_probe() build headless packets")
Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/ipv4/tcp_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 19059d03152e..bedf828cc0e0 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2664,7 +2664,9 @@ static bool tcp_can_coalesce_send_queue_head(struct sock *sk, int len)
 		if (len <= skb->len)
 			break;
 
-		if (tcp_has_tx_tstamp(skb) || !tcp_skb_can_collapse(skb, next))
+		if (tcp_has_tx_tstamp(skb) ||
+		    !tcp_skb_can_collapse(skb, next) ||
+		    skb_zcopy(skb) != skb_zcopy(next))
 			return false;
 
 		len -= skb->len;
@@ -2718,6 +2720,7 @@ static int tcp_clone_payload(struct sock *sk, struct sk_buff *to,
 	WARN_ON_ONCE(len != probe_size);
 	for (i = 0; i < nr_frags; i++)
 		skb_frag_ref(to, i);
+	skb_zcopy_set(to, skb_zcopy(tcp_send_head(sk)), NULL);
 
 	skb_shinfo(to)->nr_frags = nr_frags;
 	to->truesize += probe_size;
-- 
2.56.1.750.gf70dc682cf-goog

