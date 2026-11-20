Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205656;
	b=1BAlo79+txW8ilopJByz63NtZ+eGJq2u4/n3zRwTvoWYnPWcwNWoc7YXLan4RN5seVhG
	 X0feJ0W+JRjJOdPKWPe7vgQmLepsxkoxrm3/6XKDbGI8bcsroseR40yiew2ajiP0Ss8PH
	 oy3kJ5zvJAwYUd64wCEXbzSx/ozGePpal2GLv00CldYzKPgj3wnuH3v8aZpIuAuPpT9wn
	 qvh8rorGRm6pG3kvZNWIVWl6ClmsXgsV5H/o7mdXhhl2TMlYjtoI601Jz+yW0vQm4VaAP
	 tHhGige+SoxoGx6g1g/zOo+rh6ex6QPblYnWCcDq6SdrCPaf8wiwTToKwWhHzDgyUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7Ug4jPI7bC9cbjVabh07YpJj6Je6zNKBGZtWAnt3SU8=;
	b=mMnscwavOLg9VAdweiDHRuddKx1kqQeRxB8PZEh/pBr0ucstqM6H5rfAm2e0UWDcsokY
	 lh5UMO8BXa4FBKbiMEOVOkrC9zwHE2CZBjzW80lTyhL3ntXDX8cz8/PXg+ILpDm5Qy8la
	 9H5BeZEFoJ8or4C9JPJ3GPsYU4yFTRNt00jltjKQ3yEwhC3UgDq3psg7Jzbg4fx+DnlsA
	 Lbk4HlQo6tTqRyf5Ybgiapoq/AOYpQCnB5bXooP6uOJzTlGshBfyQfmHlkxcb/jYEJ2rH
	 hRHd5S9PAskaMImcifqdrJjBHfRghTF5a7Z9cGWZzIFlwRyzG63uFaqh1GO8hYmCdOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WeC44IeP;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF8606A6EE
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FF8606A6EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WeC44IeP
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so17984eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205654; x=1795810454; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ug4jPI7bC9cbjVabh07YpJj6Je6zNKBGZtWAnt3SU8=;
        b=WeC44IePunojRiGePL/rFFe94w24nTwNjTttDasXbZFYbPB+gU9hbY89WWBw2nCpRQ
         DebfuFGaJ2pbeO4RyvWJXyOh+YzVZPctJfWBhdx5ls4y+FdzNBVWwQG5CVcOoNDyo4wn
         V49Q4BsSTm8OAhjwSpu75YOKJjXmwiiNP+7qLWRvbBORL/lSiA8AxcrPQbLoCxb+iba+
         ZZLzXYvtxqlvc1h21NRZHAES+K+3malWtyGWDxzoMCqH6ybinim+c2ylbMoCopPp55DR
         xF3kQ5G1hpnAl5oRy0EUR7+Gp3S1uKm9QEa8Beo1ElCObcZmUFXJnzAHLh92eN0FLFB5
         eKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205654; x=1795810454;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ug4jPI7bC9cbjVabh07YpJj6Je6zNKBGZtWAnt3SU8=;
        b=hAq9TLb8gEk6BuHolx3oS3+haXnwZDw4SsakpHW2ws11GHctdIIDpcShDQbf8pcnK3
         wem1bAjzxSeMW+Xuf0bF2lfVNg3MWHsh1TdqDynnogSfteEHXpu8gVCMQFN7NnaWjbOF
         rIkDGJKYc3+BpeQxF2DWkLzsrJWGJxhgBY8hgrpUN7QsJxT3ZmGRjTATinPV59VCfM0H
         hbf0uQZfEB8lTSz19iJf3Q8CxQstR55NwaNSWW65b5o6a3HoTs0jPnRFGds9qklvQ2zk
         nhzfTRJo76QVrEm8mgZ9HyA4M+ZBES8Hp3SVwaOcPH4AxWGGBDxRVWhQqFtV7+6pfPhw
         1WRA==
X-Gm-Message-State: APuU4Z+jSpNdd7S6M6bqi367i1Ex4ovteck/DgYK48Tbd9HxlFv6RdoV
	FEX2cPqL1qMOTI+ztRAM4967A/Ts0BiCLpawtgQC7PTsKXvedl+clwa2lXLtyCgMjTxoID4zOBM
	qW3Rc+88pLixKKO/Wfj0QUXYVLzyc+yN0V7Bo4sb9Ke7BSXf+JyRu83CShdtnj6cFnEHqzeov0a
	rBD7UkO3mdtpPxNf99tHYNfq3Ubav47dyGpZJ1nY/uph1l0swoaSRbvqPyPQC6jsk=
X-Received: from dyz23.prod.google.com ([2002:a05:693c:4097:b0:36a:ead:4dcc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2181:b0:385:5ea7:73f with SMTP id 5a478bee46e88-3856f94ed95mr4298368eec.7.1795205653772;
 Fri, 20 Nov 2026 12:14:13 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:04 +0000
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
Message-ID: <20261120201408.3445445-4-almasrymina@google.com>
Subject: [PATCH net-next v6 3/7] tcp: fix unreadable net_iov handling in tcp_clone_payload()
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

tcp_clone_payload() clones fragments from the TCP write queue into an
MTU probe skb, but does not propagate skb->unreadable and compares
adjacent fragments using skb_frag_page(). On devmem TX skbs backed by
unreadable net_iovs, skb_frag_page() returns NULL for every fragment,
causing distinct net_iovs with contiguous offsets to compare equal as
NULL == NULL and be merged incorrectly, while leaving to->unreadable
clear on the resulting probe skb.

Propagate skb->unreadable to the probe skb and compare fragments via
skb_frag_netmem().

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Verified with the
net_core KUnit test suite; not tested on real hardware.

Fixes: bd61848900bf ("net: devmem: Implement TX path")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/ipv4/tcp_output.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 08d0d4a639fe..19059d03152e 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2696,8 +2696,10 @@ static int tcp_clone_payload(struct sock *sk, struct sk_buff *to,
 				     probe_size - len);
 			len += todo;
 			skb_shinfo(to)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
+			to->unreadable |= skb->unreadable;
 			if (lastfrag &&
-			    skb_frag_page(fragfrom) == skb_frag_page(lastfrag) &&
+			    skb_frag_netmem(fragfrom) ==
+			    skb_frag_netmem(lastfrag) &&
 			    skb_frag_off(fragfrom) == skb_frag_off(lastfrag) +
 						      skb_frag_size(lastfrag)) {
 				skb_frag_size_add(lastfrag, todo);
-- 
2.56.1.750.gf70dc682cf-goog

